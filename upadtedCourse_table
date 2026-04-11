-- Course (CourseID, CourseName TEXT, MinDegree INT, MaxDegree INT)

CREATE TABLE IF NOT EXISTS Course (
    CourseID   SERIAL PRIMARY KEY,
    CourseName TEXT NOT NULL,
    MinDegree  INT,
    MaxDegree  INT,
    CONSTRAINT course_degree_chk
        CHECK (
            (MinDegree IS NULL OR MaxDegree IS NULL)
            OR (MinDegree <= MaxDegree)
        )
);
---------------------------------------------------------

-- ALTER TABLE Course
-- ADD COLUMN TrackID INT not null --fk;

-- ALTER TABLE Course
-- ADD CONSTRAINT fk_trackid
-- FOREIGN KEY (TrackID) REFERENCES Track(TrackID) ON DELETE CASCADE;

-- -- index for trackid
-- CREATE INDEX idx_course_trackid ON Course(TrackID);

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
    IN p_MaxDegree INT
)
LANGUAGE plpgsql
AS $$
BEGIN
    IF p_CourseName IS NULL OR TRIM(p_CourseName) = '' THEN
        RAISE EXCEPTION 'CourseName cannot be NULL or empty.';
    ELSIF p_MinDegree < 0 THEN
        RAISE EXCEPTION 'MinDegree cannot be negative.';
    ELSIF p_MaxDegree < p_MinDegree THEN
        RAISE EXCEPTION 'MaxDegree % cannot be less than MinDegree %.', p_MaxDegree, p_MinDegree;
    ELSE
        INSERT INTO Course(CourseName, MinDegree, MaxDegree)
        VALUES (p_CourseName, p_MinDegree, p_MaxDegree);

        RAISE NOTICE 'Course inserted successfully.';
    END IF;
END;
$$;


-- CALL InsertCourse('HTML & CSS', 50, 100);
CALL InsertCourse('HTML & CSS',          50, 100);  -- Frontend Development
CALL InsertCourse('JavaScript',          50, 100);  -- Frontend Development
CALL InsertCourse('Python Basics',       50, 100);  -- Data Analysis
CALL InsertCourse('SQL & Databases',     50, 100);  -- Data Analysis
CALL InsertCourse('Linux Fundamentals',  50, 100);  -- Network Security
CALL InsertCourse('Network Basics',      50, 100);  -- Network Security
CALL InsertCourse('Kotlin Basics',       50, 100);  -- Android Development
CALL InsertCourse('Swift Basics',        50, 100);  -- IOS Development
CALL InsertCourse('Flutter & Dart',      50, 100);  -- Android Development
CALL InsertCourse('Cloud Fundamentals',  50, 100);  -- AWS Cloud
CALL InsertCourse('Docker & Kubernetes', 50, 100); -- DevOps
CALL InsertCourse('CI/CD Pipelines',     50, 100); -- DevOps


-----------------------------------------
--insert course to track using track_course
CREATE OR REPLACE PROCEDURE AddCourseToTrack
(
    IN p_CourseID INT,
    IN p_TrackID  INT
)
LANGUAGE plpgsql
AS $$
BEGIN
    IF NOT EXISTS (SELECT 1 FROM Course WHERE CourseID = p_CourseID) THEN
        RAISE EXCEPTION 'CourseID % does not exist.', p_CourseID;
    ELSIF NOT EXISTS (SELECT 1 FROM Track WHERE TrackID = p_TrackID) THEN
        RAISE EXCEPTION 'TrackID % does not exist.', p_TrackID;
    ELSE
        INSERT INTO Track_Course (TrackID, CourseID)
        VALUES (p_TrackID, p_CourseID)
        ON CONFLICT DO NOTHING;  -- avoids duplicate (TrackID, CourseID)

        RAISE NOTICE 'Course % assigned to Track %.', p_CourseID, p_TrackID;
    END IF;
END;
$$;

------------------------------------------------------------------
CALL AddCourseToTrack(1, 1);   -- Frontend  -> HTML & CSS
CALL AddCourseToTrack(2, 1);   -- Frontend  -> JavaScript

CALL AddCourseToTrack(2, 2);   -- Backend   -> JavaScript
CALL AddCourseToTrack(3, 2);   -- Backend   -> Python Basics
CALL AddCourseToTrack(4, 2);   -- Backend   -> SQL & Databases

CALL AddCourseToTrack(3, 3);   -- Data Analysis -> Python Basics
CALL AddCourseToTrack(4, 3);   -- Data Analysis -> SQL & Databases
CALL AddCourseToTrack(3, 4);   -- Machine Learning -> Python Basics

CALL AddCourseToTrack(5, 5);   -- Network Security -> Linux Fundamentals
CALL AddCourseToTrack(6, 5);   -- Network Security -> Network Basics
CALL AddCourseToTrack(5, 6);   -- Ethical Hacking  -> Linux Fundamentals
CALL AddCourseToTrack(6, 6);   -- Ethical Hacking  -> Network Basics

CALL AddCourseToTrack(7, 7);   -- Android -> Kotlin Basics
CALL AddCourseToTrack(9, 7);   -- Android -> Flutter & Dart
CALL AddCourseToTrack(8, 8);   -- IOS -> Swift Basics
CALL AddCourseToTrack(9, 8);   -- IOS -> Flutter & Dart

CALL AddCourseToTrack(10, 9);  -- AWS Cloud -> Cloud Fundamentals
CALL AddCourseToTrack(11, 9);  -- AWS Cloud -> Docker & Kubernetes
CALL AddCourseToTrack(11, 10); -- DevOps -> Docker & Kubernetes
CALL AddCourseToTrack(12, 10); -- DevOps -> CI/CD Pipelines



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
    IN p_MaxDegree INT
)
LANGUAGE plpgsql
AS $$
BEGIN
    IF NOT EXISTS (SELECT 1 FROM Course WHERE CourseID = p_CourseID) THEN
        RAISE EXCEPTION 'CourseID % does not exist.', p_CourseID;
    ELSIF p_CourseName IS NULL OR TRIM(p_CourseName) = '' THEN
        RAISE EXCEPTION 'CourseName cannot be NULL or empty.';
    ELSIF p_MinDegree < 0 THEN
        RAISE EXCEPTION 'MinDegree cannot be negative.';
    ELSIF p_MaxDegree < p_MinDegree THEN
        RAISE EXCEPTION 'MaxDegree % cannot be less than MinDegree %.', p_MaxDegree, p_MinDegree;
    ELSE
        UPDATE Course
        SET CourseName = p_CourseName,
            MinDegree  = p_MinDegree,
            MaxDegree  = p_MaxDegree
        WHERE CourseID = p_CourseID;

        RAISE NOTICE 'Course % updated successfully.', p_CourseID;
    END IF;
END;
$$;
CALL UpdateCourse(2, 'Advanced Python', 60, 100);

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
    INOUT p_Cursor  REFCURSOR DEFAULT 'cur_Courses'
)
LANGUAGE plpgsql
AS $$
BEGIN
    IF NOT EXISTS (SELECT 1 FROM Track WHERE TrackID = p_TrackID) THEN
        RAISE EXCEPTION 'TrackID % does not exist.', p_TrackID;
    END IF;

    OPEN p_Cursor FOR
        SELECT  c.CourseID,
                c.CourseName,
                c.MinDegree,
                c.MaxDegree
        FROM Track_Course tc
        JOIN Course c ON c.CourseID = tc.CourseID
        WHERE tc.TrackID = p_TrackID
        ORDER BY c.CourseName;

EXCEPTION
    WHEN OTHERS THEN
        RAISE NOTICE 'Error: %', SQLERRM;
END;
$$;

BEGIN;
    CALL SelectCoursesByTrack(3);
    FETCH ALL FROM cur_Courses;
END;

-- BEGIN;
--   CALL SelectCoursesByTrack(3);
--   FETCH ALL FROM cur_Courses;
-- COMMIT;
