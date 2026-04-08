CREATE OR REPLACE PROCEDURE InsertChoice
(
    IN QuestionID INT,
    IN OptionText TEXT,
    IN OptionOrder INT    
)
LANGUAGE plpgsql
AS $BODY$
    BEGIN
        INSERT INTO Choice ( QuestionID, OptionText, OptionOrder) 
        VALUES ( QuestionID, OptionText, OptionOrder);
    END
$BODY$;