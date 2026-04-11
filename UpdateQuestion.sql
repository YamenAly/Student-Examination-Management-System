CREATE OR REPLACE PROCEDURE UpdateQuestion
(
    IN q_CourseID INT,
    IN q_QuestionText TEXT,
    IN q_QuestionType TEXT,
    IN q_Points INT
)
LANGUAGE plpgsql
AS $$
    BEGIN
        UPDATE Questions 
        SET
            CourseID = q_CourseID,
            QuestionText = q_QuestionText,
            QuestionType = q_QuestionType,
            Points = q_Points
        WHERE QuestionID = q_QuestionID;
        EXCEPTION
        WHEN foreign_key_violation THEN
        RAISE EXCEPTION 'OptionID invalid';
        EXCEPTION
        WHEN not_null_violation THEN
        RAISE EXCEPTION 'Null Values not alloweds';
    END;

$$;
