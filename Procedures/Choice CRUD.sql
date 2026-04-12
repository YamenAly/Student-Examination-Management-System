-- create choice table (optionID(PK), QuestionID(FK), OptionText, OptionOrder)

CREATE TABLE Choice(

    OptionID SERIAL PRIMARY KEY,
    QuestionID INT NOT NULL, --fk 
    OptionText TEXT NOT NULL,
    OptionOrder INT NOT NULL,

    CONSTRAINT fk_question FOREIGN KEY (QuestionID) REFERENCES Questions(QuestionID) ON DELETE CASCADE;
);

CREATE INDEX question_option_idx ON Choice(QuestionID);

-------------------------------------------------------------------------------------------------------------------------------------

-- Insert Choice Procedure

CREATE OR REPLACE PROCEDURE InsertChoice
(
    IN c_QuestionID INT,
    IN c_OptionText TEXT,
    IN c_OptionOrder INT    
)
LANGUAGE plpgsql
AS $$
    BEGIN
        INSERT INTO Choice ( QuestionID, OptionText, OptionOrder) VALUES ( c_QuestionID, c_OptionText, c_OptionOrder);

        EXCEPTION
        WHEN foreign_key_violation THEN
        RAISE EXCEPTION 'QuestionID invalid';
        
        WHEN not_null_violation THEN
        RAISE EXCEPTION 'Null Values not alloweds';           
    END;
$$;

-------------------------------------------------------------------------------------------------------------------------------------

--Update Choice

CREATE OR REPLACE PROCEDURE UpdateChoice
(
    IN c_OptionID INT,
    IN c_OptionText TEXT,
    IN c_OptionOrder INT    
)
LANGUAGE plpgsql
AS $$
    BEGIN
        UPDATE Choice 
        SET
            OptionText = c_OptionText,
            OptionOrder = c_OptionOrder
        WHERE 
            OptionID = c_OptionID;
        EXCEPTION
        WHEN foreign_key_violation THEN
        RAISE EXCEPTION 'OptionID invalid';
        EXCEPTION
        WHEN not_null_violation THEN
        RAISE EXCEPTION 'Null Values not alloweds';    
    END
$$;

-------------------------------------------------------------------------------------------------------------------------------------

--Delete Choice

CREATE OR REPLACE PROCEDURE DeleteChoice
(
    IN OptionID INT
)
LANGUAGE plpgsql
AS $$
    BEGIN
        DELETE FROM Choice *
        WHERE OptionID = OptionID;

        IF NOT FOUND THEN
        RAISE EXCEPTION 'Choice not founc'
        END IF;

        EXCEPTION
            WHEN foreign_key_violation THEN
                RAISE EXCEPTION 'OptionID invalid';
    END;
$$;
