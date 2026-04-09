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