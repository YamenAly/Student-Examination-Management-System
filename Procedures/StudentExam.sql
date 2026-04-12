--StudentExam table creation
CREATE TABLE StudentExam (
StudentExamID SERIAL PRIMARY KEY,
StudentID INT NOT NULL, --FK
ExamID INT NOT NULL,    --FK
StartTime TIMESTAMP DEFAULT NOW(),
EndTime TIMESTAMP,
TotalGrade INT DEFAULT 0
);
-------------------------------------------------------------
--Add Foreign key constraint
ALTER TABLE StudentExam ADD CONSTRAINT se_exam_fk FOREIGN KEY (ExamID) REFERENCES Exam(ExamID) ON DELETE CASCADE; 
ALTER TABLE StudentExam ADD CONSTRAINT se_student_fk FOREIGN KEY (StudentID) REFERENCES Student(StudentID) 
ON DELETE CASCADE;
-------------------------------------------------------------
--Create index for foreign key column
CREATE INDEX se_student_idx ON StudentExam(StudentID);
CREATE INDEX se_exam_idx ON StudentExam(ExamID);

