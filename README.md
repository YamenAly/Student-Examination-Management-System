# ITI Student Examination Management System

A robust, database-driven examination management system built for the Information Technology Institute (ITI). The system manages exams, question banks, student submissions, automatic grading, and reporting across ITI branches, tracks, and courses — with all core business logic implemented as PostgreSQL stored procedures.

---

## Table of Contents

- [Project Overview](#project-overview)
- [Team Members & Roles](#team-members--roles)
- [Tech Stack](#tech-stack)
- [Repository Structure](#repository-structure)
- [Database Schema](#database-schema)
- [Stored Procedures](#stored-procedures)
- [Reports](#reports)
- [Setup & Installation](#setup--installation)
- [Running the Project](#running-the-project)
- [Optional Web GUI](#optional-web-gui)
- [Backup & Restore](#backup--restore)
- [Example Procedure Calls](#example-procedure-calls)

---

## Project Overview

The system covers the full exam lifecycle:

1. **Instructors** build a question bank (MCQ and True/False) per course
2. **Admins** generate randomized exams from the question bank
3. **Students** submit answers which are stored as structured JSONB input
4. **The system** automatically grades submissions and calculates total scores
5. **Staff** run reports on students, grades, and instructor assignments

All application logic runs through stored procedures — no direct table queries are made from the client.

---

## Team Members & Roles

| Team Member | Responsibilities |
|-------------|-----------------|
| **Amal** | Database schema design — Department, Track, Course, Track_Course tables; seed data for departments, tracks, courses; CRUD procedures for Track and Course |
| **Mostafa** | Instructor and Student entities — Instructor, Instructor_Course, Student, Student_Track tables and CRUD procedures; role-based access, authentication, and database backup/restore scripts |
| **Yamen** | Question bank — Questions, Choice, ModelAnswer tables and all CRUD procedures; Report_InstructorCourses; SubmitExamAnswers core procedure |
| **Nada** | Exam lifecycle — Exam, ExamQuestion, StudentExam, StudentAnswer tables; ModelAnswer CRUD; Department CRUD procedures; Report_StudentsByDepartment; GenerateExam procedure; CorrectExam procedure |

---

## Tech Stack

| Layer | Technology |
|-------|-----------|
| Database | PostgreSQL 15+ |
| Stored Procedures | PL/pgSQL |
| Optional Web GUI | Python 3.12 + Flask + SQLAlchemy |
| DB Connectivity (GUI) | psycopg2-binary |
| Version Control | Git + GitHub |
| Design Tools | draw.io (ERD & Schema diagrams) |

---

## Repository Structure

```
Student-Examination-Management-System/
│
├── Schema/
│   ├── schema.sql                    ← Full CREATE TABLE script with constraints & indexes
│   ├── schemaonlybypgadmin.sql       ← pgAdmin-generated schema export
│   └── FullSchemabyPgadmin4.sql      ← Complete schema + procedures export
│
├── Data/
│   ├── Department, Track & Course Data.sql   ← Seed data for org structure
│   ├── Questions & Choice Data.sql           ← 96 questions with all options
│   ├── Model Answer Data.sql                 ← Correct answers for all questions
│   └── dataonlybypgadmin4.sql               ← Full data export via pgAdmin
│
├── Procedures/
│   ├── Department CRUD.sql
│   ├── Track CRUD.sql
│   ├── Course CRUD.sql
│   ├── Instructors CRUD.sql
│   ├── Instructor_Course.sql
│   ├── Student CRUD.sql
│   ├── Student_Track.sql
│   ├── Question CRUD.sql
│   ├── Choice CRUD.sql
│   ├── ModelAnswer CRUD.sql
│   ├── ModelAnswerProcedure.sql
│   ├── Exam CRUD.sql
│   ├── ExamQuestion.sql
│   ├── StudentExam.sql
│   ├── StudentAnswer.sql
│   ├── GenerateExamProcedure.sql     ← REQ-09: Randomized exam generation
│   ├── SubmitExamAnswers.sql         ← REQ-10: Student submission via JSONB
│   └── CorrectExam.sql              ← REQ-11: Automatic grading
│
├── Reports/
│   ├── Report_StudentsByDepartment.sql
│   ├── Report_StudentGrades.sql
│   └── Report_InstructorCourses.sql
│
├── Diagrams/
│   ├── StudentExaminationManagementSystem_ERD.drawio
│   └── StudentExaminationManagementSystem_Schema.drawio
│
├── Dictionary/
│   └── DATABASE DICTIONARY Examination.txt
│
├── GUI/                              ← Optional bonus web interface
│   ├── app.py                        ← Flask application
│   ├── requirements.txt
│   ├── .env                          ← Database connection config
│   ├── templates/
│   │   ├── index.html
│   │   ├── admin.html
│   │   ├── exam.html
│   │   ├── reports.html
│   │   ├── result.html
│   │   └── student_dashboard.html
│   └── static/
│       ├── style.css
│       └── main.js
│
└── README.md
```

---

## Database Schema

The system uses **15 tables** across 4 logical groups:

### Organization Structure
| Table | Description |
|-------|-------------|
| `Department` | ITI branches/departments (e.g. Cairo, Alexandria) |
| `Track` | Specialization tracks within a department |
| `Course` | Courses available across the system |
| `Track_Course` | Junction — which courses belong to which tracks |

### People
| Table | Description |
|-------|-------------|
| `Student` | Student records with contact info |
| `Instructor` | Instructor records linked to a department |
| `Instructor_Course` | Junction — which instructors teach which courses |
| `Student_Track` | Junction — which tracks each student is enrolled in |

### Question Bank
| Table | Description |
|-------|-------------|
| `Questions` | MCQ and True/False questions per course |
| `Choice` | Answer options (4 per MCQ, 2 per TF) |
| `ModelAnswer` | The correct choice per question (enforced unique) |

### Exam & Results
| Table | Description |
|-------|-------------|
| `Exam` | Exam definitions linked to a course |
| `ExamQuestion` | Which questions appear in which exam (composite PK) |
| `StudentExam` | A student's exam attempt — start/end time, total grade |
| `StudentAnswer` | Each answer a student submitted per question |

---

## Stored Procedures

### Critical Procedures

#### GenerateExam
Randomly selects questions from the question bank for a given course.
```sql
CALL GenerateExam(
    p_CourseID   := 1,
    p_ExamName   := 'HTML & CSS Midterm',
    p_NumMCQ     := 5,
    p_NumTF      := 3
);
```

#### SubmitExamAnswers
Records a student's exam submission. Validates student enrollment in the course track before accepting answers.
```sql
CALL SubmitExamAnswers(
    p_StudentID  := 1,
    p_ExamID     := 1,
    p_StartTime  := '2025-01-15 09:00:00',
    p_EndTime    := '2025-01-15 10:00:00',
    p_Answers    := '[
        {"question_id": 1, "chosen_option_id": 1},
        {"question_id": 2, "chosen_option_id": 6},
        {"question_id": 3, "chosen_option_id": 9}
    ]'::JSONB
);
```

#### CorrectExam
Grades a submitted exam by comparing answers against ModelAnswer.
```sql
CALL CorrectExam(p_StudentExamID := 1);
```

---

## Reports

Reports are implemented as stored procedures using a cursor output parameter (callable with `CALL`) or as views.

```sql
-- Students in a department
BEGIN;
  CALL Report_StudentsByDepartment(1, 'dept_cursor');
  FETCH ALL FROM dept_cursor;
COMMIT;

-- A student's grades across all exams
BEGIN;
  CALL Report_StudentGrades(1, 'grades_cursor');
  FETCH ALL FROM grades_cursor;
COMMIT;

-- Courses taught by an instructor
BEGIN;
  CALL Report_InstructorCourses(1, 'courses_cursor');
  FETCH ALL FROM courses_cursor;
COMMIT;
```

---

## Setup & Installation

### Prerequisites

- PostgreSQL 15 or higher
- psql command-line tool or pgAdmin 4
- Python 3.12+ (only required for the optional web GUI)

### Step 1 — Create the Database

```bash
psql -U postgres
```
```sql
CREATE DATABASE examdb;
\c examdb
```

### Step 2 — Run the Schema

```bash
psql -U postgres -d examdb -f Schema/schema.sql
```

This creates all 15 tables with constraints, foreign keys, and indexes.

### Step 3 — Load the Stored Procedures

Run these files in order:

```bash
# CRUD procedures
psql -U postgres -d examdb -f "Procedures/Department CRUD.sql"
psql -U postgres -d examdb -f "Procedures/Track CRUD.sql"
psql -U postgres -d examdb -f "Procedures/Course CRUD.sql"
psql -U postgres -d examdb -f "Procedures/Instructors CRUD.sql"
psql -U postgres -d examdb -f "Procedures/Instructor_Course .sql"
psql -U postgres -d examdb -f "Procedures/Student CRUD.sql"
psql -U postgres -d examdb -f "Procedures/Student_Track.sql"
psql -U postgres -d examdb -f "Procedures/Question CRUD.sql"
psql -U postgres -d examdb -f "Procedures/Choice CRUD.sql"
psql -U postgres -d examdb -f "Procedures/ModelAnswer CRUD.sql"
psql -U postgres -d examdb -f "Procedures/ModelAnswerProcedure.sql"
psql -U postgres -d examdb -f "Procedures/Exam CRUD.sql"
psql -U postgres -d examdb -f "Procedures/ExamQuestion.sql"
psql -U postgres -d examdb -f "Procedures/StudentExam.sql"
psql -U postgres -d examdb -f "Procedures/StudentAnswer.sql"

# Core logic procedures
psql -U postgres -d examdb -f "Procedures/GenerateExamProcedure.sql"
psql -U postgres -d examdb -f "Procedures/SubmitExamAnswers.sql"
psql -U postgres -d examdb -f "Procedures/CorrectExam.sql"

# Reports
psql -U postgres -d examdb -f "Reports/Report_StudentsByDepartment.sql"
psql -U postgres -d examdb -f "Reports/Report_StudentGrades.sql"
psql -U postgres -d examdb -f "Reports/Report_InstructorCourses.sql"
```

### Step 4 — Load Seed Data

```bash
psql -U postgres -d examdb -f "Data/Department, Track & Course Data.sql"
psql -U postgres -d examdb -f "Data/Questions & Choice Data.sql"
psql -U postgres -d examdb -f "Data/Model Answer Data.sql"
```

> **Alternative:** Run `Schema/FullSchemabyPgadmin4.sql` to load the complete schema, procedures, and data in a single file.

---

## Running the Project

### Using psql directly

```bash
psql -U postgres -d examdb
```

Then call any procedure:

```sql
-- Generate an exam
CALL GenerateExam(1, 'HTML & CSS Quiz', 5, 3);

-- View the exam
SELECT * FROM Exam;
SELECT * FROM ExamQuestion WHERE ExamID = 1;
```

### Using pgAdmin 4

1. Open pgAdmin 4
2. Connect to your PostgreSQL server
3. Navigate to the `examdb` database
4. Open the Query Tool (`Tools → Query Tool`)
5. Paste and run any procedure call from the examples above

---

## Optional Web GUI

A Flask-based web interface is included as a bonus. It exposes all stored procedures through a browser UI.

### Setup

```bash
cd GUI

# Create and activate virtual environment
python3 -m venv venv
source venv/bin/activate          # Linux/Mac
venv\Scripts\activate             # Windows

# Install dependencies
pip install -r requirements.txt
```

### Configure Database Connection

Edit `GUI/.env` with your PostgreSQL credentials:

```env
DB_HOST=localhost
DB_PORT=5432
DB_NAME=examdb
DB_USER=postgres
DB_PASSWORD=your_password_here
```

### Run the Flask App

```bash
cd GUI
source venv/bin/activate
python app.py
```

Then open your browser at: **http://localhost:5000**

### GUI Features

| Page | Path | Description |
|------|------|-------------|
| Home | `/` | Login/role selection |
| Admin Dashboard | `/admin` | Manage departments, tracks, courses, instructors, students |
| Exam | `/exam` | Generate exams and submit student answers |
| Reports | `/reports` | Run all 3 mandatory reports |
| Student Dashboard | `/student_dashboard` | Student view of their own results |
| Results | `/result` | Exam result display after correction |

---

## Backup & Restore

### Create a Backup

```bash
pg_dump -U postgres -d examdb -F c -f examdb_backup.dump
```

For a plain SQL backup:
```bash
pg_dump -U postgres -d examdb > examdb_backup.sql
```

### Restore from Backup

```bash
# Restore from custom format
pg_restore -U postgres -d examdb -F c examdb_backup.dump

# Restore from SQL file
psql -U postgres -d examdb < examdb_backup.sql
```

> **Note:** Always create the database first before restoring: `CREATE DATABASE examdb;`

---

## Example Procedure Calls

```sql
-- Insert a department
CALL InsertDepartment('Web Development', 'Cairo Branch');

-- Insert a track
CALL InsertTrack('Frontend Development', 1);

-- Assign a course to a track
CALL InsertTrack_Course(1, 1);

-- Insert a student
CALL InsertStudent('Ahmed Mohamed', 'ahmed@example.com', '01012345678');

-- Enroll student in track
CALL AssignStudentToTrack(1, 1);

-- Insert an instructor
CALL InsertInstructor('Sara Ali', 'sara@iti.gov.eg', 1);

-- Assign instructor to course
CALL AssignInstructorToCourse(1, 1);

-- Insert a question
CALL InsertQuestion(1, 'What does HTML stand for?', 'MCQ', 10);

-- Insert choices for the question
CALL InsertChoice(1, 'HyperText Markup Language', 1);
CALL InsertChoice(1, 'HighText Machine Language', 2);
CALL InsertChoice(1, 'HyperText Machine Language', 3);
CALL InsertChoice(1, 'HyperTool Markup Language', 4);

-- Set the correct answer
CALL SetModelAnswer(1, 1);  -- QuestionID=1, CorrectOptionID=1

-- Generate an exam
CALL GenerateExam(1, 'HTML Midterm', 5, 3);

-- Submit answers
CALL SubmitExamAnswers(
    1, 1,
    '2025-06-01 09:00:00',
    '2025-06-01 10:00:00',
    '[{"question_id":1,"chosen_option_id":1},{"question_id":2,"chosen_option_id":5}]'::JSONB
);

-- Grade the exam
CALL CorrectExam(1);

-- Run report
BEGIN;
  CALL Report_StudentGrades(1, 'my_cursor');
  FETCH ALL FROM my_cursor;
COMMIT;
```
