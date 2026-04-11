CREATE OR REPLACE PROCEDURE DeleteQuestion
(
    IN QuestionID INT
)
LANGUAGE plpgsql
AS $$
    BEGIN
        DELETE FROM Questions *
        WHERE QuestionID = QuestionID
    END
    IF NOT FOUND THEN
    RAISE EXCEPTION "Question not found";
    END IF;
    EXCEPTION
            WHEN foreign_key_violation THEN
                RAISE EXCEPTION "QuestionID invalid";
$$;