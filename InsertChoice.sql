CREATE OR REPLACE PROCEDURE InsertChoice
(
    IN c_QuestionID INT,
    IN c_OptionText TEXT,
    IN c_OptionOrder INT    
)
LANGUAGE plpgsql
AS $$
    BEGIN
        INSERT INTO Choice ( QuestionID, OptionText, OptionOrder) 
        VALUES ( c_QuestionID, c_OptionText, c_OptionOrder);

        EXCEPTION
        WHEN foreign_key_violation THEN
        RAISE EXCEPTION 'QuestionID invalid';
        EXCEPTION
        WHEN not_null_violation THEN
        RAISE EXCEPTION 'Null Values not alloweds';           
    END;
$$;