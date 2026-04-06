CREATE TABLE IF NOT EXISTS Instructor_Course (
    InstructorID  INT,
    CourseID      INT,
    PRIMARY KEY (InstructorID, CourseID)
   
);

INSERT INTO Instructor_Course (InstructorID, CourseID) VALUES
(1,  1), (1,  2),
(2,  2), (2,  3),
(3,  1), (3,  4),
(16, 9), (16, 2),

-- Dept 2 (Data Eng) -> courses: 3=Python, 4=SQL, 5=Linux
(4,  3), (4,  4),
(5,  4), (5,  5),
(6,  3), (6,  5),
(17, 4), (17, 3),

-- Dept 3 (Cyber Sec) -> courses: 5=Linux, 6=Network Basics
(7,  5), (7,  6),
(8,  5), (8,  6),
(9,  6), (9,  5),
(18, 6), (18, 5),

-- Dept 4 (Mobile) -> courses: 7=Kotlin, 8=Swift, 9=Flutter
(10, 7), (10, 9),
(11, 8), (11, 9),
(12, 7), (12, 8),

-- Dept 5 (Cloud) -> courses: 10=Cloud Fund, 11=Docker, 12=CI/CD
(13, 10), (13, 11),
(14, 11), (14, 12),
(15, 10), (15, 12);

-- ALTER TABLE Instructor_Course
    -- ADD CONSTRAINT fk_ic_instructor
    -- FOREIGN KEY (InstructorID) REFERENCES Instructor(InstructorID);
-- ALTER TABLE Instructor_Course
    -- ADD CONSTRAINT fk_ic_course
    -- FOREIGN KEY (CourseID) REFERENCES Course(CourseID);