CREATE OR REPLACE PROCEDURE DeleteQuestion
(
    IN QuestionID INT
)
LANGUAGE plpgsql
AS $BODY$
    BEGIN
        DELETE FROM Questions *
        WHERE QuestionID = QuestionID
    END
$BODY$;