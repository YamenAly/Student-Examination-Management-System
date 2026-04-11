CREATE OR REPLACE PROCEDURE InsertQuestion
(
    IN q_CourseID INT,
    IN q_QuestionText TEXT,
    IN q_QuestionType TEXT,
    IN q_Points INT
)
LANGUAGE plpgsql
AS $$
    BEGIN
    INSERT INTO Questions (CourseID, QuestionText, QuestionType, Points) 
    VALUES (q_CourseID, q_QuestionText, q_QuestionType, q_Points);

    EXCEPTION
        WHEN foreign_key_violation THEN
        RAISE EXCEPTION 'CourseID invalid';
        
        WHEN check_violation THEN
        RAISE EXCEPTION 'Invalid question type';

        WHEN not_null_violation THEN
        RAISE EXCEPTION 'null values are not allowed';

    END;

$$;