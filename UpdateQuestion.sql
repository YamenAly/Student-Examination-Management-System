CREATE OR REPLACE PROCEDURE UpdateQuestion
(
    IN CourseID INT,
    IN QuestionText TEXT,
    IN QuestionType TEXT,
    IN Points INT
)
LANGUAGE plpgsql
AS $BODY$
    BEGIN
        UPDATE Questions 
        SET
            CourseID = CourseID,
            QuestionText = QuestionText,
            QuestionType = QuestionType,
            Points = Points
        VALUES QuestionID = QuestionID;
    END
$BODY$;
