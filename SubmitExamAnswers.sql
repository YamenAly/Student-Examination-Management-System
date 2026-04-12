CREATE OR REPLACE PROCEDURE SubmitExamAnswers
(
    IN p_StudentID INT,
    IN p_ExamID INT,
    IN p_StartTime TimeSTAMP,
    IN p_EndTime TIMESTAMP,
    IN p_Answers JSONB
)
LANGUAGE plpgsql
AS $$
DECLARE
    v_StudentEXAMID  INT;
    v-CourseID INT;
    v_answer JSONB;
    v_QuestionID INT;
    v_OptionID INT;
    v_examCount INT;
    v_studentCount INT;
BEGIN
    SELECT count(*) INTO v_studentCount
    From Student
    Where StudentID = p_StudentID;

    --Check if sutdent exists
    IF v_studentCount = 0 THEN
        RAISE EXCEPTION 'Student does not exist';
    END IF;

    --Check if exam exists
    SELECT count(*) into v_examCount
    FROM EXAM
    WHERE EXAMID = p_EXAMID;

    IF v_examCount = 0 THEN
        RAISE EXCEPTION 'Exam does not exist';
    END IF;

    --get course id
    SELECT CourseID INTO v_CourseID
    FROM Exam
    WHERE ExamID = p_ExamID

    --get track id
    SELECT TrackID INTO v_TrackID
    FROM TRACK_Course
    WHERE CourseID = v_CourseID
    LIMIT 1;

    --check that student is enrolled  in this track
    SELECT count(*) INTO v_EnrollCount
    FROM Student_Track
    WHERE StudentID = p_StudentID AND TrackID = v_TrackID;

    IF v_EnrollCount = 0 THEN
        RAISE EXCEPTION
            'Student is not enrolled in this track'
    END IF

    --Check if student has submited the exam
    IF EXISTS(
        SELECT 1 FROM StudentExam
        WHERE StudentID = p_StudentID AND ExamID = p_ExamID
    )
	THEN
        RAISE EXCEPTION 'The student has already submited this exam';
    END IF;
    
    --Insert into studentexam the studentud and the examid and the start and end times
    INSERT INTO StudentExam (StudentID, ExamID, StartTime, EndTime, TotalGrade)
    VALUES (p_StudentID, p_ExamID, p_StartTime, p_EndTime, 0)
    RETURNING StudentExamID INTO v_StudentExamID;

    -- Insert into JSONB array
    FOR v_answer IN SELECT * FROM jsonb_array_elements(p_Answers)
    LOOP
        v_QuestionID := (v_answer->>'question_id')::INT;
        v_OptionID := (v_answer->>'chosen_option_id')::INT;

        INSERT INTO StudentAnswer (StudentExamID, QuestionID, ChosenOptionID)
        VALUES (v_StudentExamID, v_QuestionID, v_OptionID);
    END LOOP;

EXCEPTION
    WHEN foreign_key_violation THEN
        RAISE EXCEPTION 'One of the IDs is invalid, or one of them does not exist';
    WHEN not_null_violation THEN
        RAISE EXCEPTION 'No null values allowed';
END;
$$;