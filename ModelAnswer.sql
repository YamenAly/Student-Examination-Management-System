CREATE TABLE ModelAnswer(

    QuestionID INT UNIQUE NOT NULL,
    CorrectOptionID INT NOT NULL,

    CONSTRAINT fk_question FOREIGN KEY (QuestionID) REFERENCES Questions(QuestionID) ON DELETE CASCADE,
    CONSTRAINT fk_option FOREIGN KEY (CorrectOptionID) REFERENCES Choice(OptionID) ON DELETE CASCADE;
);

CREATE INDEX ModelAnswer_idx ON ModelAnswer(QuestionID);