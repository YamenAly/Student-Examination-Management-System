CREATE OR REPLACE PROCEDURE Report_InstructorCourses(
    IN  p_InstructorID INT,
    INOUT p_cursor REFCURSOR DEFAULT 'rpt_instructor_courses'
)
LANGUAGE plpgsql AS $$
BEGIN
    OPEN p_cursor FOR
        SELECT c.CourseName, t.TrackName, COUNT(DISTINCT st.StudentID) AS StudentCount
        FROM Instructor_Course ic
        JOIN Course c  ON ic.CourseID = c.CourseID
        JOIN Track_Course tc ON c.CourseID  = tc.CourseID
        JOIN Track t ON tc.TrackID  = t.TrackID
        LEFT JOIN Student_Track st ON t.TrackID = st.TrackID
        WHERE ic.InstructorID = p_InstructorID
        GROUP BY c.CourseName, t.TrackName
        ORDER BY c.CourseName, t.TrackName;
END;
$$;

CALL Report_InstructorCourses(2, 'cur2');
FETCH ALL FROM cur2;
