-- Create Questions Table(QuestionID(PK), CourseID(FK), QuestionText, QuestionType, Points)

CREATE TABLE Questions(
    
    QuestionID SERIAL PRIMARY KEY,
    CourseID INT NOT NULL, -- fk
    QuestionText TEXT NOT NULL,
    QuestionType TEXT CHECK (QuestionType IN ('MCQ', 'TF')),
    Points INT NOT NULL,

    CONSTRAINT fk_course FOREIGN KEY (CourseID) REFERENCES Course(CourseID) ON DELETE CASCADE;

);

CREATE INDEX question_course_idx ON Questions(CourseID);


-------------------------------------------------------------------------------------------------------------------------------------

--Insert Question

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

-------------------------------------------------------------------------------------------------------------------------------------

--Update Question

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
        WHEN not_null_violation THEN
        RAISE EXCEPTION 'Null Values not alloweds';
    END;

$$;


-------------------------------------------------------------------------------------------------------------------------------------

--Delete Question

CREATE OR REPLACE PROCEDURE DeleteQuestion
(
    IN p_QuestionID INT
)
LANGUAGE plpgsql
AS $$
    BEGIN
        DELETE FROM Questions * WHERE QuestionID = p_QuestionID;
    
    IF NOT FOUND THEN
    RAISE EXCEPTION 'Question not found';
    END IF;
    EXCEPTION
            WHEN foreign_key_violation THEN
                RAISE EXCEPTION 'QuestionID invalid';
END;
$$;
