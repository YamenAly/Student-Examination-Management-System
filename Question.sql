CREATE TABLE Questions(
    
    QuestionID INT PRIMARY KEY,
    CourseID INT NOT NULL,
    QuestionText TEXT NOT NULL,
    QuestionType TEXT CHECK (QuestionType IN ('MCQ', 'TF'))
    Points INT NOT NULL,

    CONSTRAINT fk_course FOREIGN KEY (CourseID) REFERENCE Course(CourseID)

);
