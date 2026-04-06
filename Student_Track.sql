

CREATE TABLE IF NOT EXISTS Student_Track (
    StudentID  INT,
    TrackID    INT,
    PRIMARY KEY (StudentID, TrackID)
  
);

-- Student_Track: 2 students per track (tracks 1-10)
INSERT INTO Student_Track (StudentID, TrackID) VALUES
(1,  1),  -- Amal       -> Frontend Development
(2,  2),  -- Nada       -> Backend Development
(3,  3),  -- Mariam     -> Data Analysis
(4,  4),  -- Reem       -> Machine Learning
(5,  5),  -- Fatma      -> Network Security
(6,  6),  -- Eman       -> Ethical Hacking
(7,  7),  -- Mona       -> Android Development
(8,  8),  -- Noha       -> IOS Development
(9,  9),  -- Narmeen    -> AWS Cloud
(10, 10), -- Nasreen    -> DevOps
(11, 1),  -- Ahmed      -> Frontend Development
(12, 2),  -- Mohamed    -> Backend Development
(13, 3),  -- Omar       -> Data Analysis
(14, 4),  -- Ali        -> Machine Learning
(15, 5),  -- Osama      -> Network Security
(16, 6),  -- Mostafa    -> Ethical Hacking
(17, 7),  -- Yamen      -> Android Development
(18, 8),  -- Alaa       -> IOS Development
(19, 9),  -- Kareem     -> AWS Cloud
(20, 10); -- Mahmoud    -> DevOps



-- Student_Track -> Student
-- ALTER TABLE Student_Track
    -- ADD CONSTRAINT fk_st_student
    -- FOREIGN KEY (StudentID) REFERENCES Student(StudentID);

-- Student_Track -> Track
-- ALTER TABLE Student_Track
    -- ADD CONSTRAINT fk_st_track
    -- FOREIGN KEY (TrackID) REFERENCES Track(TrackID);
