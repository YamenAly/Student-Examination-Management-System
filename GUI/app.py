from flask import Flask, render_template, request, jsonify, redirect, url_for, session
import psycopg2
import psycopg2.extras
from psycopg2.extras import Json as PgJson   # ← wraps Python dict/list as JSONB
import json
import os
from datetime import datetime

app = Flask(__name__)
app.secret_key = os.getenv('SECRET_KEY', 'exam-system-secret-2024')

DB_CONFIG = {
    'host':     os.getenv('DB_HOST', 'localhost'),
    'port':     int(os.getenv('DB_PORT', 5432)),
    'database': os.getenv('DB_NAME', 'examdb'),
    'user':     os.getenv('DB_USER', 'postgres'),
    'password': os.getenv('DB_PASSWORD', 'postgres'),
}

def get_db():
    conn = psycopg2.connect(**DB_CONFIG)
    conn.autocommit = False
    return conn

def query(sql, params=None, fetch='all'):
    """Run a SELECT query and return rows."""
    conn = get_db()
    try:
        cur = conn.cursor(cursor_factory=psycopg2.extras.RealDictCursor)
        cur.execute(sql, params or [])
        conn.commit()
        if fetch == 'all':
            return cur.fetchall()
        elif fetch == 'one':
            return cur.fetchone()
        return None
    except psycopg2.Error as e:
        conn.rollback()
        raise e
    finally:
        conn.close()

def execute_proc(proc_name, params):
    """Call a stored procedure with regular params."""
    conn = get_db()
    try:
        cur = conn.cursor()
        placeholders = ', '.join(['%s'] * len(params))
        cur.execute(f"CALL {proc_name}({placeholders})", params)
        conn.commit()
        return {'success': True}
    except psycopg2.Error as e:
        conn.rollback()
        # Extract the human-readable message from the exception
        msg = e.diag.message_primary if e.diag and e.diag.message_primary else str(e)
        return {'success': False, 'error': msg}
    finally:
        conn.close()

def execute_proc_with_jsonb(proc_name, regular_params, jsonb_value):
    """
    Call a stored procedure where the LAST parameter is JSONB.
    Uses psycopg2.extras.Json so PostgreSQL receives it as proper JSONB,
    not a plain text string — which is what SubmitExamAnswers needs.
    """
    conn = get_db()
    try:
        cur = conn.cursor()
        # All params including the JSONB one
        params = list(regular_params) + [PgJson(jsonb_value)]
        placeholders = ', '.join(['%s'] * len(params))
        cur.execute(f"CALL {proc_name}({placeholders})", params)
        conn.commit()
        return {'success': True}
    except psycopg2.Error as e:
        conn.rollback()
        msg = e.diag.message_primary if e.diag and e.diag.message_primary else str(e)
        return {'success': False, 'error': msg}
    finally:
        conn.close()

# ─── Landing ───────────────────────────────────────────────────────────────────

@app.route('/')
def index():
    students = query("SELECT StudentID, Name, Email FROM Student ORDER BY Name")
    instructors = query("SELECT InstructorID, Name FROM Instructor ORDER BY Name")
    departments = query("SELECT DepartmentID, DepartementName FROM Department ORDER BY DepartementName")
    return render_template('index.html', students=students, instructors=instructors, departments=departments)

# ─── Student Routes ─────────────────────────────────────────────────────────────

@app.route('/student/<int:student_id>')
def student_dashboard(student_id):
    student = query("SELECT * FROM Student WHERE StudentID = %s", [student_id], fetch='one')
    if not student:
        return "Student not found", 404

    # Exams available (not yet taken) for this student's courses via their tracks
    available_exams = query("""
        SELECT DISTINCT e.ExamID, e.ExamName, e.TotalQuestions, e.CreatedDate,
               c.CourseName, c.MaxDegree, t.TrackName
        FROM Exam e
        JOIN Course c ON e.CourseID = c.CourseID
        JOIN Track_Course tc ON c.CourseID = tc.CourseID
        JOIN Student_Track st ON tc.TrackID = st.TrackID
        JOIN Track t ON t.TrackID = st.TrackID
        WHERE st.StudentID = %s
          AND NOT EXISTS (
              SELECT 1 FROM StudentExam se
              WHERE se.StudentID = %s AND se.ExamID = e.ExamID
          )
        ORDER BY e.CreatedDate DESC
    """, [student_id, student_id])

    # Exams already taken
    taken_exams = query("""
        SELECT se.StudentExamID, se.ExamID, se.StartTime, se.EndTime,
               se.TotalGrade, e.ExamName, c.CourseName, c.MaxDegree,
               ROUND((se.TotalGrade::NUMERIC / NULLIF(c.MaxDegree, 0)) * 100, 1) AS Percentage
        FROM StudentExam se
        JOIN Exam e ON se.ExamID = e.ExamID
        JOIN Course c ON e.CourseID = c.CourseID
        WHERE se.StudentID = %s
        ORDER BY se.StartTime DESC
    """, [student_id])

    return render_template('student_dashboard.html',
                           student=student,
                           available_exams=available_exams,
                           taken_exams=taken_exams)

@app.route('/exam/<int:exam_id>/take/<int:student_id>')
def take_exam(exam_id, student_id):
    exam = query("SELECT * FROM Exam WHERE ExamID = %s", [exam_id], fetch='one')
    student = query("SELECT * FROM Student WHERE StudentID = %s", [student_id], fetch='one')
    if not exam or not student:
        return "Not found", 404

    # Check already taken
    already = query("SELECT 1 FROM StudentExam WHERE StudentID=%s AND ExamID=%s",
                    [student_id, exam_id], fetch='one')
    if already:
        return redirect(url_for('student_dashboard', student_id=student_id))

    questions = query("""
        SELECT q.QuestionID, q.QuestionText, q.QuestionType, q.Points,
               eq.OrderNo
        FROM ExamQuestion eq
        JOIN Questions q ON eq.QuestionID = q.QuestionID
        WHERE eq.ExamID = %s
        ORDER BY eq.OrderNo
    """, [exam_id])

    # Get choices for each question
    questions_with_choices = []
    for qrow in questions:
        qdict = dict(qrow)
        choices = query("""
            SELECT OptionID, OptionText, OptionOrder
            FROM Choice WHERE QuestionID = %s ORDER BY OptionOrder
        """, [qrow['questionid']])
        qdict['choices'] = [dict(c) for c in choices]
        questions_with_choices.append(qdict)

    return render_template('exam.html', exam=exam, student=student,
                           questions=questions_with_choices)

@app.route('/api/submit_exam', methods=['POST'])
def submit_exam():
    data = request.json
    student_id  = data.get('student_id')
    exam_id     = data.get('exam_id')
    start_time  = data.get('start_time')
    end_time    = datetime.now().isoformat()
    answers     = data.get('answers', [])   # [{question_id, chosen_option_id}, ...]

    # answers is already a Python list of dicts — pass it directly as JSONB
    # execute_proc_with_jsonb wraps it with psycopg2.extras.Json so PostgreSQL
    # receives proper JSONB, not a plain text string
    result = execute_proc_with_jsonb(
        'student.SubmitExamAnswers',
        [student_id, exam_id, start_time, end_time],  # regular params
        answers                                         # JSONB param (list of dicts)
    )
    if not result['success']:
        return jsonify({'success': False, 'error': result['error']}), 400

    # Get the new StudentExamID
    se = query("SELECT StudentExamID FROM StudentExam WHERE StudentID=%s AND ExamID=%s",
               [student_id, exam_id], fetch='one')

    if se:
        # Auto-correct immediately
        correct_result = execute_proc('instructor.CorrectExam', [se['studentexamid']])
        if not correct_result['success']:
            return jsonify({'success': False, 'error': correct_result['error']}), 400
        return jsonify({'success': True, 'student_exam_id': se['studentexamid']})

    return jsonify({'success': False, 'error': 'Could not retrieve exam record'}), 500

@app.route('/result/<int:student_exam_id>')
def result(student_exam_id):
    se = query("""
        SELECT se.*, e.ExamName, c.CourseName, c.MaxDegree, s.Name AS StudentName,
               ROUND((se.TotalGrade::NUMERIC / NULLIF(c.MaxDegree,0))*100,1) AS Percentage
        FROM StudentExam se
        JOIN Exam e ON se.ExamID = e.ExamID
        JOIN Course c ON e.CourseID = c.CourseID
        JOIN Student s ON se.StudentID = s.StudentID
        WHERE se.StudentExamID = %s
    """, [student_exam_id], fetch='one')
    if not se:
        return "Not found", 404

    answers = query("""
        SELECT sa.QuestionID, q.QuestionText, q.QuestionType, q.Points,
               ch.OptionText AS ChosenAnswer,
               ma_ch.OptionText AS CorrectAnswer,
               CASE WHEN sa.ChosenOptionID = ma.CorrectOptionID THEN true ELSE false END AS IsCorrect
        FROM StudentAnswer sa
        JOIN Questions q ON sa.QuestionID = q.QuestionID
        JOIN Choice ch ON sa.ChosenOptionID = ch.OptionID
        LEFT JOIN ModelAnswer ma ON ma.QuestionID = q.QuestionID
        LEFT JOIN Choice ma_ch ON ma_ch.OptionID = ma.CorrectOptionID
        WHERE sa.StudentExamID = %s
        ORDER BY q.QuestionID
    """, [student_exam_id])

    return render_template('result.html', se=se, answers=answers)

# ─── Reports Routes ─────────────────────────────────────────────────────────────

@app.route('/reports')
def reports():
    students = query("SELECT StudentID, Name FROM Student ORDER BY Name")
    instructors = query("SELECT InstructorID, Name FROM Instructor ORDER BY Name")
    departments = query("SELECT DepartmentID, DepartementName FROM Department ORDER BY DepartementName")
    return render_template('reports.html', students=students,
                           instructors=instructors, departments=departments)

@app.route('/api/report/students_by_department/<int:dept_id>')
def report_students_by_dept(dept_id):
    rows = query("""
        SELECT s.StudentID, s.Name, s.Email, s.Phone, t.TrackName, d.DepartementName AS BranchName
        FROM Student s
        JOIN Student_Track st ON s.StudentID = st.StudentID
        JOIN Track t ON st.TrackID = t.TrackID
        JOIN Department d ON t.DepartmentID = d.DepartmentID
        WHERE d.DepartmentID = %s
        ORDER BY s.Name
    """, [dept_id])
    return jsonify([dict(r) for r in rows])

@app.route('/api/report/student_grades/<int:student_id>')
def report_student_grades(student_id):
    rows = query("""
        SELECT c.CourseName, e.ExamName, se.TotalGrade, c.MaxDegree,
               ROUND((se.TotalGrade::NUMERIC / NULLIF(c.MaxDegree,0))*100,1) AS Percentage
        FROM StudentExam se
        JOIN Exam e ON se.ExamID = e.ExamID
        JOIN Course c ON e.CourseID = c.CourseID
        WHERE se.StudentID = %s
        ORDER BY se.StartTime DESC
    """, [student_id])
    return jsonify([dict(r) for r in rows])

@app.route('/api/report/instructor_courses/<int:instructor_id>')
def report_instructor_courses(instructor_id):
    rows = query("""
        SELECT c.CourseName, t.TrackName,
               COUNT(DISTINCT st.StudentID) AS StudentCount
        FROM Instructor_Course ic
        JOIN Course c ON ic.CourseID = c.CourseID
        JOIN Track_Course tc ON c.CourseID = tc.CourseID
        JOIN Track t ON tc.TrackID = t.TrackID
        LEFT JOIN Student_Track st ON st.TrackID = t.TrackID
        WHERE ic.InstructorID = %s
        GROUP BY c.CourseName, t.TrackName
        ORDER BY c.CourseName
    """, [instructor_id])
    return jsonify([dict(r) for r in rows])

@app.route('/api/report/exam_questions/<int:exam_id>')
def report_exam_questions(exam_id):
    exam = query("SELECT ExamName FROM Exam WHERE ExamID=%s", [exam_id], fetch='one')
    questions = query("""
        SELECT q.QuestionID, q.QuestionText, q.QuestionType, q.Points, eq.OrderNo
        FROM ExamQuestion eq
        JOIN Questions q ON eq.QuestionID = q.QuestionID
        WHERE eq.ExamID = %s ORDER BY eq.OrderNo
    """, [exam_id])
    result = []
    for qrow in questions:
        qdict = dict(qrow)
        choices = query("""
            SELECT ch.OptionText, ch.OptionOrder,
                   CASE WHEN ma.CorrectOptionID = ch.OptionID THEN true ELSE false END AS IsCorrect
            FROM Choice ch
            LEFT JOIN ModelAnswer ma ON ma.QuestionID = ch.QuestionID
            WHERE ch.QuestionID = %s ORDER BY ch.OptionOrder
        """, [qrow['questionid']])
        qdict['choices'] = [dict(c) for c in choices]
        result.append(qdict)
    return jsonify({'exam': dict(exam) if exam else {}, 'questions': result})

# ─── Admin / Generator ──────────────────────────────────────────────────────────

@app.route('/admin')
def admin():
    courses = query("SELECT CourseID, CourseName FROM Course ORDER BY CourseName")
    exams   = query("""
        SELECT e.ExamID, e.ExamName, e.TotalQuestions, e.CreatedDate, c.CourseName
        FROM Exam e JOIN Course c ON e.CourseID = c.CourseID
        ORDER BY e.CreatedDate DESC
    """)
    return render_template('admin.html', courses=courses, exams=exams)

@app.route('/api/generate_exam', methods=['POST'])
def generate_exam():
    data = request.json
    result = execute_proc('instructor.GenerateExam', [
        data['course_id'], data['exam_name'],
        data['num_mcq'], data['num_tf']
    ])
    return jsonify(result)

@app.route('/api/correct_exam', methods=['POST'])
def correct_exam():
    data = request.json
    result = execute_proc('instructor.CorrectExam', [data['student_exam_id']])
    return jsonify(result)

@app.route('/api/exams')
def get_exams():
    exams = query("""
        SELECT e.ExamID, e.ExamName, c.CourseName FROM Exam e
        JOIN Course c ON e.CourseID=c.CourseID ORDER BY e.ExamName
    """)
    return jsonify([dict(r) for r in exams])

@app.route('/api/student_exams_pending')
def student_exams_pending():
    rows = query("""
        SELECT se.StudentExamID, s.Name AS StudentName, e.ExamName, se.TotalGrade
        FROM StudentExam se
        JOIN Student s ON se.StudentID=s.StudentID
        JOIN Exam e ON se.ExamID=e.ExamID
        ORDER BY se.StartTime DESC LIMIT 50
    """)
    return jsonify([dict(r) for r in rows])

if __name__ == '__main__':
    app.run(debug=True, port=5000)
