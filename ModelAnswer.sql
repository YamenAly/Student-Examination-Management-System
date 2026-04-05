CREATE TABLE ModelAnswer(

    QuestionID INT UNIQUE NOT NULL,
    CorrectOptionID INT NOT NULL,

    CONSTRAINT fk_question FOREIGN KEY (QuestionID) REFERENCE Questions(QuestionID)
    CONSTRAINT fk_option FOREIGN KEY (CorrectOptionID) REFERENCE Choice(OptionID)
);