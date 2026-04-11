-- Create setModelAnswer procedure
CREATE OR REPLACE PROCEDURE setModelAnswer(p_question_id INT, p_coption_id INT)
LANGUAGE plpgsql AS 
$$
BEGIN
	IF EXISTS(SELECT * FROM ModelAnswer WHERE QuestionID =  p_question_id)
		THEN RAISE EXCEPTION 'This Model Answer already exists';
	END IF;
	IF NOT EXISTS(SELECT * FROM Choice WHERE QuestionID =  p_question_id AND OptionID = p_coption_id)
		THEN RAISE EXCEPTION 'This option does not exist';
	END IF;
	INSERT INTO ModelAnswer(QuestionID, CorrectOptionID) VALUES (p_question_id, p_coption_id);
END
$$
