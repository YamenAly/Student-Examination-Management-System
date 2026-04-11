-- Course (CourseID, CourseName TEXT, MinDegree INT, MaxDegree INT)
CREATE TABLE Course(
	CourseID   SERIAL PRIMARY KEY,
	CourseName TEXT,
	MinDegree INT,
	MaxDegree INT
	
);
---------------------------------------------------------

ALTER TABLE Course
ADD COLUMN TrackID INT not null --fk;

ALTER TABLE Course
ADD CONSTRAINT fk_trackid
FOREIGN KEY (TrackID) REFERENCES Track(TrackID) ON DELETE CASCADE;

-- index for trackid
CREATE INDEX idx_course_trackid ON Course(TrackID);

-- ##################################################################################################
--create insertCourse procedure
--the validation in four edeges :1.if CourseName is NULL or empty 
-- 2.check if Mindegree is negative
--3.if MaxDegree is less than MinDegree
--4.if track id exitis or not
-- after these validation it will add the values successfully

CREATE OR REPLACE PROCEDURE InsertCourse
(
    IN p_CourseName TEXT,
    IN p_MinDegree INT,
    IN p_MaxDegree INT,
    IN p_TrackID INT
)
LANGUAGE plpgsql
AS $$
BEGIN
    -- Check if CourseName is NULL or empty
    IF p_CourseName IS NULL OR TRIM(p_CourseName) = '' 
	THEN
        RAISE EXCEPTION 'CourseName cannot be NULL or empty.';

    -- check if Mindegree is negative
    ELSIF p_MinDegree < 0 
	THEN
        RAISE EXCEPTION 'MinDegree cannot be negative.';

    --  if MaxDegree is less than MinDegree
    ELSIF p_MaxDegree < p_MinDegree 
	THEN
        RAISE EXCEPTION 'MaxDegree % cannot be less than MinDegree %.', p_MaxDegree, p_MinDegree;

    -- Check if TrackID exists
    ELSIF NOT EXISTS (SELECT 1 FROM Track WHERE TrackID = p_TrackID) THEN
        RAISE EXCEPTION 'TrackID % does not exist.', p_TrackID;

    ELSE
		INSERT INTO Course(CourseName, MinDegree, MaxDegree, TrackID)
		VALUES (p_CourseName, p_MinDegree, p_MaxDegree, p_TrackID);

        RAISE NOTICE 'Course inserted successfully.';
    END IF;

END;
$$;

CALL InsertCourse('HTML & CSS',          50, 100, 1);  -- Frontend Development
CALL InsertCourse('JavaScript',          50, 100, 1);  -- Frontend Development
CALL InsertCourse('Python Basics',       50, 100, 3);  -- Data Analysis
CALL InsertCourse('SQL & Databases',     50, 100, 3);  -- Data Analysis
CALL InsertCourse('Linux Fundamentals',  50, 100, 5);  -- Network Security
CALL InsertCourse('Network Basics',      50, 100, 5);  -- Network Security
CALL InsertCourse('Kotlin Basics',       50, 100, 7);  -- Android Development
CALL InsertCourse('Swift Basics',        50, 100, 8);  -- IOS Development
CALL InsertCourse('Flutter & Dart',      50, 100, 7);  -- Android Development
CALL InsertCourse('Cloud Fundamentals',  50, 100, 9);  -- AWS Cloud
CALL InsertCourse('Docker & Kubernetes', 50, 100, 10); -- DevOps
CALL InsertCourse('CI/CD Pipelines',     50, 100, 10); -- DevOps


-- #############################################################################################

--create update procedure 
-- it's the same logic of inert procedures but first we should check the course id then we check:
--1.if CourseName is NULL or empty 
-- 2.check if Mindegree is negative
--3.if MaxDegree is less than MinDegree
--4.if track id exitis or not
-- then we updatethe feild using set keyword where the CourseID = p_CourseID 
-- after that we raise the notice that the filed had been updated sussefully

CREATE OR REPLACE PROCEDURE UpdateCourse
(
    IN p_CourseID INT,
    IN p_CourseName TEXT,
    IN p_MinDegree INT,
    IN p_MaxDegree INT,
    IN p_TrackID INT
)
LANGUAGE plpgsql
AS $$
BEGIN
    -- Check if CourseID exists
    IF NOT EXISTS (SELECT 1 FROM Course WHERE CourseID = p_CourseID) THEN
        RAISE EXCEPTION 'CourseID % does not exist.', p_CourseID;

    -- Check if CourseName is NULL or empty
    ELSIF p_CourseName IS NULL OR TRIM(p_CourseName) = '' THEN
        RAISE EXCEPTION 'CourseName cannot be NULL or empty.';

    -- Check if MinDegree is negative
    ELSIF p_MinDegree < 0 THEN
        RAISE EXCEPTION 'MinDegree cannot be negative.';

    -- Check if MaxDegree is less than MinDegree
    ELSIF p_MaxDegree < p_MinDegree THEN
        RAISE EXCEPTION 'MaxDegree % cannot be less than MinDegree %.', p_MaxDegree, p_MinDegree;

    -- Check if TrackID exists
    ELSIF NOT EXISTS (SELECT 1 FROM Track WHERE TrackID = p_TrackID) THEN
        RAISE EXCEPTION 'TrackID % does not exist.', p_TrackID;

    ELSE
        UPDATE Course
        SET CourseName = p_CourseName,
            MinDegree  = p_MinDegree,
            MaxDegree  = p_MaxDegree,
            TrackID    = p_TrackID
        WHERE CourseID = p_CourseID;

        RAISE NOTICE 'Course % updated successfully.', p_CourseID;
    END IF;

END;
$$;
CALL UpdateCourse(2, 'Advanced Python', 60, 100, 3);

-- ###################################################################################3
-- create deletecourse prosedure 
-- the validtion in this procedure is just to check on coure id as it's the unique value

CREATE OR REPLACE PROCEDURE DeleteCourse
(
    IN p_CourseID INT
)
LANGUAGE plpgsql
AS $$
BEGIN
    -- Check if CourseID exists
    IF NOT EXISTS (SELECT 1 FROM Course WHERE CourseID = p_CourseID) THEN
        RAISE EXCEPTION 'CourseID % does not exist.', p_CourseID;

    ELSE
        DELETE FROM Course
        WHERE CourseID = p_CourseID;

        RAISE NOTICE 'Course % deleted successfully.', p_CourseID;
    END IF;

END;
$$;

CALL DeleteCourse(1);
------------------------------------------------------------------------------------------
-- selectcourse procedure by track id
-- the parameter is inout not un or out parameter to send and recive value a procedure not as function it has return value
-- since the selction depentin track id so it should taking the value of id and the remain values doesn't matter
-- the selection view is inner join with track and course table where trackid is equal to p_trackid in the procedure




CREATE OR REPLACE PROCEDURE SelectCoursesByTrack
(
    IN    p_TrackID INT,
    INOUT p_Cursor  REFCURSOR DEFAULT NULL 'cur_Courses'
)
LANGUAGE plpgsql
AS $$
BEGIN
--check if TrackID exists
IF NOT EXISTS (SELECT 1 FROM Track WHERE TrackID = p_TrackID) 
THEN
	RAISE EXCEPTION 'TrackID % does not exist.', p_TrackID;
END IF;

-- open cursor to return all courses in the track
OPEN p_Cursor FOR
	SELECT  Course.CourseName,
			Course.MinDegree,
			Course.MaxDegree
	FROM    Course
	INNER JOIN Track ON Course.TrackID = Track.TrackID
	WHERE   Course.TrackID = p_TrackID;

 --catch the exception so transaction doesn't abort
EXCEPTION
    WHEN OTHERS THEN
        RAISE NOTICE 'Error: %', SQLERRM;  --prints the error
END;
$$;


BEGIN;
    CALL SelectCoursesByTrack(3);
    FETCH ALL FROM cur_Courses;
END;

