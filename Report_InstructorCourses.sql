CREATE OR  REPLACE PROCEDURE Report_InstructorCourses(
    IN p_InstructorID INT
    OUT ref           refcursor
)
RETURNS TABLE(
    CourseName TEXT,
    TrackName TEXT,
    StudentCount INT
)
LANGUAGE plpgsql
AS $$ 
DECLARE
    s_count INT;
BEGIN
    SELECT count(*) into s_count;
    FROM Instructor
    WHERE InstructorID = p_InstructorID;

    IF s_count = 0 then
        RAISE EXCEPTION 'This instructo does not exist'
    END IF;
    
    OPEN ref FOR
    SELECT c.CourseName, t.TrackName, count(st.StudentID) AS StudentCount
    FROM Instructor_Course ic
    JOIN Course c ON c.CourseID = ic.CourseID
    JOIN Track_Course tc ON tc.CourseID = c.CourseID
    JOIN Track t on t.TrackID = tc.TrackID
    LEFT JOIN Student_Track st on st.TrackID = t.TrackID --so courses that have 0 students show
    WHERE ic.InstructorID = p_InstructorID
    GROUP BY c.CourseName, t.TrackName;
END:
$$;