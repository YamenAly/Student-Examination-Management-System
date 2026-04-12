--StudentAnswer table creation
CREATE TABLE StudentAnswer (
StudentAnswerID SERIAL PRIMARY KEY,
StudentExamID INT NOT NULL, --FK
QuestionID INT NOT NULL,    --FK
ChosenOptionID INT NOT NULL --FK
);
-------------------------------------------------------------
--Add Foreign key constraint
ALTER TABLE StudentAnswer ADD CONSTRAINT sa_exam_fk FOREIGN KEY (StudentExamID) REFERENCES StudentExam(StudentExamID) 
ON DELETE CASCADE; 
ALTER TABLE StudentAnswer ADD CONSTRAINT sa_question_fk FOREIGN KEY (QuestionID) REFERENCES Question(QuestionID) 
ON DELETE CASCADE;
ALTER TABLE StudentAnswer ADD CONSTRAINT sa_option_fk FOREIGN KEY (ChosenOptionID) REFERENCES Option(OptionID) 
ON DELETE CASCADE;
-------------------------------------------------------------
--Create index for foreign key column
CREATE INDEX sa_exam_idx ON StudentAnswer(StudentExamID);
CREATE INDEX sa_question_idx ON StudentAnswer(QuestionID);
CREATE INDEX sa_option_idx ON StudentAnswer(ChosenOptionID);


