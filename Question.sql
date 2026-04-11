CREATE TABLE Questions(
    
    QuestionID SERIAL PRIMARY KEY,
    CourseID INT NOT NULL, -- fk
    QuestionText TEXT NOT NULL,
    QuestionType TEXT CHECK (QuestionType IN ('MCQ', 'TF')),
    Points INT NOT NULL,

    CONSTRAINT fk_course FOREIGN KEY (CourseID) REFERENCES Course(CourseID) ON DELETE CASCADE;

);

CREATE INDEX question_course_idx ON Questions(CourseID);
