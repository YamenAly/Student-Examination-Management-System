CREATE OR REPLACE PROCEDURE Report_StudentGrades(
    p_StudentID  INT,
    INOUT p_cursor REFCURSOR DEFAULT 'student_grades'
)
LANGUAGE plpgsql
AS $$
/*
  PURPOSE    : Return all exam grades for a specific student
  PARAMETER  : p_StudentID – the student to report on
               p_cursor    – cursor name to fetch results from
  RETURNS    : CourseName, ExamName, TotalGrade, MaxDegree, Percentage
  EXCEPTIONS : Raises if StudentID does not exist
*/
DECLARE
    v_StudentExists INT;
BEGIN
--1: check student exists
	SELECT COUNT(*) INTO v_StudentExists
	FROM Student
	WHERE StudentID = p_StudentID;

	IF v_StudentExists = 0 
	THEN
        RAISE EXCEPTION 'StudentID % does not exist.', p_StudentID;
    END IF;

 -- 2: open cursor with the report query
OPEN p_cursor FOR
SELECT
	c.CourseName,
	e.ExamName,
	se.TotalGrade,
	c.MaxDegree,
	ROUND((se.TotalGrade::FLOAT/NULLIF(c.MaxDegree, 0)* 100)::NUMERIC,2) 
	AS Percentage
FROM  StudentExam se
JOIN  Exam  e  ON se.ExamID = e.ExamID
JOIN  Course c  ON e.CourseID = c.CourseID
WHERE se.StudentID = p_StudentID;

END;
$$;


--Cursors IN pg must be called inside a transaction block

BEGIN;
    CALL Report_StudentGrades(3);   --open the cursor
    FETCH ALL FROM student_grades;  --fetches allrows
COMMIT;