CREATE OR REPLACE PROCEDURE UpdateChoice
(
    IN OptionID INT,
    IN OptionText TEXT,
    IN OptionOrder INT    
)
LANGUAGE plpgsql
AS $BODY$
    BEGIN
        UPDATE Choice 
        SET
            OptionText = OptionText,
            OptionOrder = OptionOrder
        WHERE 
            OptionID = OptionID;
    END
$BODY$;