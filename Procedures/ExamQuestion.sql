--ExamQuestion table creation
CREATE TABLE ExamQuestion (
ExamID INT NOT NULL,      --FK
QuestionID INT NOT NULL,  --FK
OrderNo INT NOT NULL,
PRIMARY KEY (ExamID, QuestionID)
);
-------------------------------------------------------------
--Add Foreign key constraint
ALTER TABLE ExamQuestion ADD CONSTRAINT eq_exam_fk FOREIGN KEY (ExamID) REFERENCES Exam(ExamID) ON DELETE CASCADE; 
ALTER TABLE ExamQuestion ADD CONSTRAINT eq_question_fk FOREIGN KEY (QuestionID) REFERENCES Question(QuestionID) 
ON DELETE CASCADE;
-------------------------------------------------------------
--Create index for foreign key column
CREATE INDEX eq_question_idx ON ExamQuestion(QuestionID);


