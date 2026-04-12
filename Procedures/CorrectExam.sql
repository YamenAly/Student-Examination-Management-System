-- 3.4 CorrectExam – REQ-11 (CRITICAL)
-- Input: @StudentExamID INT
-- Logic:
-- • For each StudentAnswer: compare ChosenOptionID with ModelAnswer → add Points or 0
-- • Use transaction – ROLLBACK on error
-- • UPDATE StudentExam SET TotalGrade = calculated sum

------------------
-- correct exam procedure

/*
  PURPOSE: Grade a student's exam by comparing their answers to model answers
  PARAMETER: p_StudentExamID – the ID of the StudentExam record to grade
  RETURNS: Nothing (updates StudentExam.TotalGrade in place)
  EXCEPTIONS: Raises if StudentExamID not found or no answers exist
*/
	
-- first how the tables connect
-- StudentExam (StudentExamID) ->StudentAnswer (StudentExamID FK -> QuestionID, ChosenOptionID) ->ModelAnswer (QuestionID -> CorrectOptionID) ->Question (QuestionID → Points)
-- the logic:
-- 1.Accept a StudentExamID as input
--2. Start a transaction
-- 3.Check that the StudentExamID actually exists ->raise exception if not
-- 4.For each answer the student submitted:
	-- a.look up the correct answer from ModelAnswer
	-- b.compare student's ChosenOptionID with CorrectOptionID
	-- c.If they match → earn the question's Points
	-- d.If they don't match → earn 0
-- 5.Sum all earned points
-- 6.Update StudentExam.TotalGrade with that sum
-- 7.Commit — or Rollback if anything went wrong

-- to make the procedure much faster I have used aggregiate function sum() insted of using for loop



CREATE OR REPLACE PROCEDURE CorrectExam (p_StudentExamID INT)
LANGUAGE plpgsql
AS $$
DECLARE
V_FINALSCORE INT ; -- THIS THE VAR TO HOLD THE TOTAL SUM (GRADE)IN IT
BEGIN
--1 CAL THE TOTAL GRADE
--We join the student's answers with the model answers and the question points
SELECT SUM(CASE 
 	WHEN sa.ChosenOptionID = ma.CorrectOptionID 
 	THEN q.Points 
 	ELSE 0 
 	END)
INTO V_FINALSCORE
FROM StudentAnswer sa
join Questions q on sa.QuestionID = q.QuestionID -- get the points for each questions
JOIN ModelAnswer ma ON sa.QuestionID = ma.QuestionID -- to get the correct ans
WHERE sa.StudentExamID = p_StudentExamID; -- for only this specific exam answer

-- 2.If no answers were found, v_FinalScore will be NULL
IF v_FinalScore IS NULL 
THEN
	RAISE EXCEPTION 'No answers found for StudentExamID %', p_StudentExamID;
END IF;
-- 3-Update the StudentExam table with the calculated total
    UPDATE StudentExam 
    SET TotalGrade = V_FINALSCORE 
    WHERE StudentExamID = p_StudentExamID;
-- 4. PRINT MSG when sucess
    RAISE NOTICE 'Success: StudentExam % graded. Total Score: %', p_StudentExamID, v_FinalScore;
EXCEPTION
    --  If anything fails,  ROLLBACK the transaction automatically rolls back as we don't need to explicet trancsactions or commit its impliced in procedure
    WHEN OTHERS THEN
        RAISE EXCEPTION 'The grading process failed. Please check the StudentExamID';
END;
$$;


CALL CorrectExam(1);


















