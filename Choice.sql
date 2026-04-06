CREATE TABLE Choice(

    OptionID INT PRIMARY KEY,
    QuestionID INT NOT NULL,
    OptionText TEXT NOT NULL,
    OptionOrder INT NOT NULL,

    CONSTRAINT fk_question FOREIGN KEY (QuestionID) REFERENCE Questions(QuestionID)

);