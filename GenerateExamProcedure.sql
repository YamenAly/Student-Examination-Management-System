-- Create GenerateExam procedure (generates new exam and random questions)
-- Make sure the course already exists, passed numbers of questions not negative 
-- and the number of available questions is sufficient 
CREATE OR REPLACE PROCEDURE GenerateExam(p_course_id INT, p_exam_name TEXT, p_mcq_num INT, p_tf_num INT)
LANGUAGE plpgsql AS 
$$
DECLARE
    new_exam_id INT;
BEGIN
	IF NOT EXISTS (SELECT * FROM Course WHERE CourseID = p_course_id)
        THEN RAISE EXCEPTION 'This course does not exist';
    END IF;

	IF p_mcq_num < 0 OR p_tf_num < 0
        THEN RAISE EXCEPTION 'The number of the questions cannot be less than 0';
    END IF;
    
    IF (SELECT COUNT(*) FROM Questions WHERE CourseID = p_course_id AND QuestionType = 'MCQ') < p_mcq_num
        THEN RAISE EXCEPTION 'The number of msq questions is not enough';
    END IF;
    
    IF (SELECT COUNT(*) FROM Questions WHERE CourseID = p_course_id AND QuestionType = 'TF') < p_tf_num
        THEN RAISE EXCEPTION 'The number of t/f questions is not enough';
    END IF;

    INSERT INTO Exam(ExamName, CourseID, TotalQuestions) VALUES (p_exam_name, p_course_id, p_mcq_num + p_tf_num)
    RETURNING ExamID INTO new_exam_id;


	INSERT INTO ExamQuestion(ExamID, QuestionID, OrderNo)
	SELECT new_exam_id, QuestionID, ROW_NUMBER() OVER ()
	FROM (SELECT QuestionID FROM Questions WHERE CourseID = p_course_id AND QuestionType = 'MCQ'
		  ORDER BY random() LIMIT p_mcq_num) AS mcq_questions;

	INSERT INTO ExamQuestion(ExamID, QuestionID, OrderNo)
	SELECT new_exam_id, QuestionID, ROW_NUMBER() OVER () + p_mcq_num
	FROM (SELECT QuestionID FROM Questions WHERE CourseID = p_course_id AND QuestionType = 'TF'
		  ORDER BY random() LIMIT p_tf_num) AS tf_questions;
END;
$$;
