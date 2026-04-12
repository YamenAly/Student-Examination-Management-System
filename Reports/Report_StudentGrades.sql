CREATE OR REPLACE PROCEDURE Report_StudentGrades(IN  p_StudentID INT, INOUT p_cursor  REFCURSOR DEFAULT 'rpt_student_grades'
)
LANGUAGE plpgsql AS $$
BEGIN
    OPEN p_cursor FOR
        SELECT c.CourseName, e.ExamName, se.TotalGrade, c.MaxDegree,
            ROUND((se.TotalGrade::FLOAT / NULLIF(c.MaxDegree, 0) * 100)::NUMERIC, 2) AS Percentage
        FROM StudentExam se
        JOIN Exam e ON se.ExamID = e.ExamID
        JOIN Course c ON e.CourseID = c.CourseID
        WHERE se.StudentID = p_StudentID
        ORDER BY c.CourseName, e.ExamName;
END;
$$; 

CALL Report_StudentGrades(2, 'cur2');
FETCH ALL FROM cur2;
