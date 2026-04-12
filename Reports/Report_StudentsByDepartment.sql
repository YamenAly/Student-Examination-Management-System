CREATE OR REPLACE PROCEDURE Report_StudentsByDepartment(
    IN  p_DepartmentNo INT,
    INOUT p_cursor REFCURSOR DEFAULT 'rpt_students_by_dept'
)
LANGUAGE plpgsql AS $$
BEGIN
    OPEN p_cursor FOR
        SELECT s.StudentID, s.Name, s.Email, s.Phone, t.TrackName, d.DepartementName AS BranchName
        FROM Student s
        JOIN Student_Track  st ON s.StudentID = st.StudentID
        JOIN Track t  ON st.TrackID = t.TrackID
        JOIN Department d  ON t.DepartmentID = d.DepartmentID
        WHERE d.DepartmentID = p_DepartmentNo ORDER BY s.Name;
END;
$$;

CALL Report_StudentsByDepartment(2, 'cur2');
FETCH ALL FROM cur2;
