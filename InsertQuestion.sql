CREATE OR REPLACE PROCEDURE InsertQuestion
(
    IN CourseID INT,
    IN QuestionText TEXT,
    IN QuestionType TEXT,
    IN Points INT
)
LANGUAGE plpgsql
AS $BODY$
    BEGIN
    INSERT INTO Questions (CourseID, QuestionText, QuestionType, Points) 
    VALUES (CourseID, QuestionText, QuestionType, Points);
    END
$BODY$;