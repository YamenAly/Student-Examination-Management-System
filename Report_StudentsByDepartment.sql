-- Create report for students by department (joining student, Student_Track, Track, Department tables)
CREATE OR REPLACE PROCEDURE Report_StudentsByDepartment(p_department_id INT, INOUT p_cursor REFCURSOR)
LANGUAGE plpgsql AS
$$
BEGIN
    OPEN p_cursor FOR
	SELECT s.StudentID, s.Name, s.Email, s.Phone, t.TrackName, d.DeptLocation AS BranchName 
	FROM Student s 
	JOIN Student_Track st ON s.StudentID = st.StudentID
	JOIN Track t ON st.TrackID = t.TrackID
	JOIN Department d ON t.DepartmentID = d.DepartmentID
	WHERE d.DepartmentID = p_department_id;
END;
$$;

BEGIN;
CALL Report_StudentsByDepartment(1, 'my_cursor');
FETCH ALL FROM my_cursor;
COMMIT;
