CREATE TABLE Choice(

    OptionID SERIAL PRIMARY KEY,
    QuestionID INT NOT NULL, --fk 
    OptionText TEXT NOT NULL,
    OptionOrder INT NOT NULL,

    CONSTRAINT fk_question FOREIGN KEY (QuestionID) REFERENCES Questions(QuestionID) ON DELETE CASCADE;
);

CREATE INDEX question_option_idx ON Choice(QuestionID);