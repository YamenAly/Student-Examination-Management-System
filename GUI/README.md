# ExamHub – Setup Guide

A full-stack exam system built with Flask + PostgreSQL.

## Project Structure

```
exam_system/
├── app.py                  # Flask backend (all routes & DB logic)
├── requirements.txt
├── .env                    # DB credentials (create this)
├── static/
│   ├── style.css
│   └── main.js
└── templates/
    ├── base.html
    ├── index.html           # Landing / role selector
    ├── student_dashboard.html
    ├── exam.html            # Take exam (JSONB submit)
    ├── result.html          # Score + review
    ├── admin.html           # Generate exams, correct, list submissions
    └── reports.html         # 4 report types
```

## 1. Add to PostgreSQL — CorrectExam Procedure

Run this in your DB before starting the app:

```sql
CREATE OR REPLACE PROCEDURE CorrectExam(IN p_StudentExamID INT)
LANGUAGE plpgsql AS $$
DECLARE
    v_total_grade INT := 0;
    v_points      INT;
BEGIN
    -- Validate StudentExam exists
    IF NOT EXISTS (SELECT 1 FROM StudentExam WHERE StudentExamID = p_StudentExamID) THEN
        RAISE EXCEPTION 'StudentExam ID % does not exist', p_StudentExamID;
    END IF;

    -- Calculate grade: sum points for correct answers
    SELECT COALESCE(SUM(q.Points), 0)
    INTO v_total_grade
    FROM StudentAnswer sa
    JOIN ModelAnswer   ma ON sa.QuestionID     = ma.QuestionID
    JOIN Questions     q  ON sa.QuestionID     = q.QuestionID
    WHERE sa.StudentExamID   = p_StudentExamID
      AND sa.ChosenOptionID  = ma.CorrectOptionID;

    -- Update TotalGrade
    UPDATE StudentExam
       SET TotalGrade = v_total_grade
     WHERE StudentExamID = p_StudentExamID;

EXCEPTION
    WHEN OTHERS THEN
        RAISE EXCEPTION 'CorrectExam failed: %', SQLERRM;
END;
$$;
```

Also make sure `SubmitExamAnswers` and `GenerateExam` from your project are already created.

## 2. Create `.env`

```env
DB_HOST=localhost
DB_PORT=5432
DB_NAME=examdb
DB_USER=postgres
DB_PASSWORD=yourpassword
SECRET_KEY=change-this-secret
```

## 3. Install & Run

```bash
cd exam_system
pip install -r requirements.txt

# Optional: load .env automatically
export $(cat .env | xargs)

python app.py
```

Open: http://localhost:5000

## 4. Pages & Features

| URL | Description |
|-----|-------------|
| `/` | Landing — choose Student / Admin / Reports |
| `/student/<id>` | Dashboard: available exams + history |
| `/exam/<id>/take/<student_id>` | Live exam with timer, question navigator |
| `/result/<student_exam_id>` | Grade + full answer review |
| `/admin` | Generate exams, correct, view submissions |
| `/reports` | 4 report types with dynamic data tables |

## 5. API Endpoints

| Method | Route | Description |
|--------|-------|-------------|
| POST | `/api/submit_exam` | Submit JSONB answers → auto-correct |
| POST | `/api/generate_exam` | Call GenerateExam procedure |
| POST | `/api/correct_exam` | Call CorrectExam procedure |
| GET | `/api/report/students_by_department/<id>` | Report 1 |
| GET | `/api/report/student_grades/<id>` | Report 2 |
| GET | `/api/report/instructor_courses/<id>` | Report 3 |
| GET | `/api/report/exam_questions/<id>` | Report 4 |
| GET | `/api/student_exams_pending` | All submissions list |

## 6. JSONB Answer Format

The exam page submits answers like:

```json
{
  "student_id": 1,
  "exam_id": 3,
  "start_time": "2024-11-01T10:00:00.000Z",
  "answers": [
    { "question_id": 12, "chosen_option_id": 45 },
    { "question_id": 13, "chosen_option_id": 48 },
    { "question_id": 14, "chosen_option_id": 51 }
  ]
}
```

This is parsed by `SubmitExamAnswers` using `jsonb_array_elements`.
