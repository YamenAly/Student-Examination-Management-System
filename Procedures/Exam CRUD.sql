--Exam table creation
CREATE TABLE Exam (
ExamID SERIAL PRIMARY KEY,
ExamName TEXT NOT NULL,
CourseID INT NOT NULL --FK, 
CreatedDate TIMESTAMP DEFAULT NOW(),
TotalQuestions INT NOT NULL,
CHECK (TotalQuestions > 0)
);
-------------------------------------------------------------
--Add Foreign key constraint
ALTER TABLE Exam ADD CONSTRAINT course_exam_fk FOREIGN KEY (CourseID) REFERENCES Course(CourseID) ON DELETE CASCADE; 
-------------------------------------------------------------
--Create index for foreign key column
CREATE INDEX course_exam_idx ON Exam(CourseID);


