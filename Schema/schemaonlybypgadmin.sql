--
-- PostgreSQL database dump
--

\restrict HoFuQESzYAiGTZdNOLB0mVzzW95ehaaxR6hCC08M88N7tXxwnQdxYJtHSda0fIV

-- Dumped from database version 13.23
-- Dumped by pg_dump version 13.23

-- Started on 2026-04-12 22:00:21

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 4 (class 2615 OID 16902)
-- Name: adm; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA adm;


ALTER SCHEMA adm OWNER TO postgres;

--
-- TOC entry 7 (class 2615 OID 16903)
-- Name: instructor; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA instructor;


ALTER SCHEMA instructor OWNER TO postgres;

--
-- TOC entry 3 (class 2615 OID 2200)
-- Name: public; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA public;


ALTER SCHEMA public OWNER TO postgres;

--
-- TOC entry 3193 (class 0 OID 0)
-- Dependencies: 3
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON SCHEMA public IS 'standard public schema';


--
-- TOC entry 8 (class 2615 OID 16904)
-- Name: student; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA student;


ALTER SCHEMA student OWNER TO postgres;

--
-- TOC entry 247 (class 1255 OID 17039)
-- Name: assigninstructortocourse(integer, integer); Type: PROCEDURE; Schema: adm; Owner: postgres
--

CREATE PROCEDURE adm.assigninstructortocourse(new_instructorid integer, new_courseid integer)
    LANGUAGE plpgsql SECURITY DEFINER
    SET search_path TO 'public'
    AS $$
    BEGIN
		INSERT INTO Instructor_Course (InstructorID,CourseID) VALUES (new_InstructorID,new_CourseID);
	
		EXCEPTION
			WHEN foreign_key_violation THEN
				RAISE EXCEPTION 'Invalid InstructorID or CourseID';

    END;
$$;


ALTER PROCEDURE adm.assigninstructortocourse(new_instructorid integer, new_courseid integer) OWNER TO postgres;

--
-- TOC entry 248 (class 1255 OID 17035)
-- Name: assignstudenttotrack(integer, integer); Type: PROCEDURE; Schema: adm; Owner: postgres
--

CREATE PROCEDURE adm.assignstudenttotrack(new_studentid integer, new_trackid integer)
    LANGUAGE plpgsql SECURITY DEFINER
    SET search_path TO 'public'
    AS $$
    BEGIN
		INSERT INTO Student_Track (StudentID,TrackID) VALUES (new_StudentID,new_TrackID);
		EXCEPTION
			WHEN foreign_key_violation THEN
				RAISE EXCEPTION 'StudentID or TrackID invalid';

    END;
$$;


ALTER PROCEDURE adm.assignstudenttotrack(new_studentid integer, new_trackid integer) OWNER TO postgres;

--
-- TOC entry 253 (class 1255 OID 17087)
-- Name: deletecourse(integer); Type: PROCEDURE; Schema: adm; Owner: postgres
--

CREATE PROCEDURE adm.deletecourse(p_courseid integer)
    LANGUAGE plpgsql SECURITY DEFINER
    SET search_path TO 'public'
    AS $$
BEGIN
    IF NOT EXISTS (SELECT 1 FROM Course WHERE CourseID = p_CourseID) THEN
        RAISE EXCEPTION 'CourseID % does not exist.', p_CourseID;
    ELSE
        DELETE FROM Course
        WHERE CourseID = p_CourseID;

        RAISE NOTICE 'Course % deleted successfully.', p_CourseID;
    END IF;
END;
$$;


ALTER PROCEDURE adm.deletecourse(p_courseid integer) OWNER TO postgres;

--
-- TOC entry 246 (class 1255 OID 16913)
-- Name: deletedepartment(integer); Type: PROCEDURE; Schema: adm; Owner: postgres
--

CREATE PROCEDURE adm.deletedepartment(p_dept_id integer)
    LANGUAGE plpgsql SECURITY DEFINER
    SET search_path TO 'public'
    AS $$
BEGIN
	IF NOT EXISTS(SELECT * FROM Department WHERE DepartmentID =  p_dept_id)
		THEN RAISE EXCEPTION 'This department does not exist';
	END IF;
	DELETE FROM Department WHERE DepartmentID = p_dept_id;
END;
$$;


ALTER PROCEDURE adm.deletedepartment(p_dept_id integer) OWNER TO postgres;

--
-- TOC entry 249 (class 1255 OID 17037)
-- Name: deleteinstructor(integer); Type: PROCEDURE; Schema: adm; Owner: postgres
--

CREATE PROCEDURE adm.deleteinstructor(instructor_id integer)
    LANGUAGE plpgsql SECURITY DEFINER
    SET search_path TO 'public'
    AS $$
    BEGIN
	
    DELETE FROM Instructor WHERE InstructorID = Instructor_id;
	--check if the instructor_id not exist 
    IF NOT FOUND THEN
        RAISE EXCEPTION 'Instructor not found';
    END IF;
	--check if the instructor is connected to a course cannot be delete.
	EXCEPTION		
		WHEN foreign_key_violation THEN
			RAISE EXCEPTION 'Cannot delete Instructor linked to course';
    END;
$$;


ALTER PROCEDURE adm.deleteinstructor(instructor_id integer) OWNER TO postgres;

--
-- TOC entry 250 (class 1255 OID 17033)
-- Name: deletestudent(integer); Type: PROCEDURE; Schema: adm; Owner: postgres
--

CREATE PROCEDURE adm.deletestudent(student_id integer)
    LANGUAGE plpgsql SECURITY DEFINER
    SET search_path TO 'public'
    AS $$
    BEGIN
	
    DELETE FROM Student WHERE StudentID = student_id;
	--If student id doesn't exists.
    IF NOT FOUND THEN
        RAISE EXCEPTION 'Student not found';
    END IF;
	--There are only one table related to student id is the student_track is connected to student id . 
	EXCEPTION		
		WHEN foreign_key_violation THEN
			RAISE EXCEPTION 'Cannot delete student linked to track';
    END;
$$;


ALTER PROCEDURE adm.deletestudent(student_id integer) OWNER TO postgres;

--
-- TOC entry 228 (class 1255 OID 16984)
-- Name: deletetrack(integer); Type: PROCEDURE; Schema: adm; Owner: postgres
--

CREATE PROCEDURE adm.deletetrack(p_trackid integer)
    LANGUAGE plpgsql SECURITY DEFINER
    SET search_path TO 'public'
    AS $$
BEGIN
	-- Check if TrackID exists
 IF NOT EXISTS (SELECT 1 FROM Track WHERE TrackID = p_TrackID) THEN
	RAISE EXCEPTION 'TrackID % does not exist.', p_TrackID;

ELSE
	DELETE FROM Track
	WHERE TrackID = p_TrackID;

	RAISE NOTICE 'Track % deleted successfully.', p_TrackID;
END IF;

END;
$$;


ALTER PROCEDURE adm.deletetrack(p_trackid integer) OWNER TO postgres;

--
-- TOC entry 254 (class 1255 OID 16978)
-- Name: insert_track(text, integer); Type: PROCEDURE; Schema: adm; Owner: postgres
--

CREATE PROCEDURE adm.insert_track(p_trackname text, p_departmentid integer)
    LANGUAGE plpgsql SECURITY DEFINER
    SET search_path TO 'public'
    AS $$
begin
	-- if the name of track is null or empty
	IF p_TrackName is NULL or trim (p_TrackName)=''
	THEN
		RAISE EXCEPTION 'the track name can not be null or Empty' ;

		
	-- seconed if the the departement id already exists in departement table
	ELSif not exists (select 1 from Department WHERE DepartmentID = p_DepartmentID)
		THEN
		RAISE EXCEPTION 'Departement id % does not exists' , p_DepartmentID ;

	ELSE 
		INSERT INTO Track(TrackName, DepartmentID) VALUES (p_TrackName, p_DepartmentID) ;

		raise notice 'track inserted successfully.' ;

	END IF ;

end ;
$$;


ALTER PROCEDURE adm.insert_track(p_trackname text, p_departmentid integer) OWNER TO postgres;

--
-- TOC entry 268 (class 1255 OID 17002)
-- Name: insertcourse(text, integer, integer); Type: PROCEDURE; Schema: adm; Owner: postgres
--

CREATE PROCEDURE adm.insertcourse(p_coursename text, p_mindegree integer, p_maxdegree integer)
    LANGUAGE plpgsql SECURITY DEFINER
    SET search_path TO 'public'
    AS $$
BEGIN
    IF p_CourseName IS NULL OR TRIM(p_CourseName) = '' THEN
        RAISE EXCEPTION 'CourseName cannot be NULL or empty.';
    ELSIF p_MinDegree < 0 THEN
        RAISE EXCEPTION 'MinDegree cannot be negative.';
    ELSIF p_MaxDegree < p_MinDegree THEN
        RAISE EXCEPTION 'MaxDegree % cannot be less than MinDegree %.', p_MaxDegree, p_MinDegree;
    ELSE
        INSERT INTO Course(CourseName, MinDegree, MaxDegree)
        VALUES (p_CourseName, p_MinDegree, p_MaxDegree);

        RAISE NOTICE 'Course inserted successfully.';
    END IF;
END;
$$;


ALTER PROCEDURE adm.insertcourse(p_coursename text, p_mindegree integer, p_maxdegree integer) OWNER TO postgres;

--
-- TOC entry 241 (class 1255 OID 16911)
-- Name: insertdepartment(text, text); Type: PROCEDURE; Schema: adm; Owner: postgres
--

CREATE PROCEDURE adm.insertdepartment(p_dept_name text, p_dept_loc text)
    LANGUAGE plpgsql SECURITY DEFINER
    SET search_path TO 'public'
    AS $$
BEGIN
	INSERT INTO Department(DepartmentName, DeptLocation) VALUES (p_dept_name, p_dept_loc);
END;
$$;


ALTER PROCEDURE adm.insertdepartment(p_dept_name text, p_dept_loc text) OWNER TO postgres;

--
-- TOC entry 242 (class 1255 OID 17036)
-- Name: insertinstructor(text, text, integer); Type: PROCEDURE; Schema: adm; Owner: postgres
--

CREATE PROCEDURE adm.insertinstructor(new_name text, new_email text, new_departmentno integer)
    LANGUAGE plpgsql SECURITY DEFINER
    SET search_path TO 'public'
    AS $_$
 BEGIN
		if new_Email Is not null and  new_Email !~ '^[A-z0-9._-]+@[A-z0-9.-]+\.[A-z]{2,}$' THEN
			RAISE EXCEPTION 'Invalid Email format';
		end if;
	
		INSERT INTO Instructor (Name,Email,DepartmentNo) VALUES (new_Name,new_Email,new_DepartmentNo);

		EXCEPTION
			WHEN foreign_key_violation THEN
				RAISE EXCEPTION'Department number invalid';
	END;
$_$;


ALTER PROCEDURE adm.insertinstructor(new_name text, new_email text, new_departmentno integer) OWNER TO postgres;

--
-- TOC entry 243 (class 1255 OID 17032)
-- Name: insertstudent(text, text, text); Type: PROCEDURE; Schema: adm; Owner: postgres
--

CREATE PROCEDURE adm.insertstudent(new_name text, new_email text, new_phone text)
    LANGUAGE plpgsql SECURITY DEFINER
    SET search_path TO 'public'
    AS $_$
    BEGIN
	if new_Phone Is not null and  new_Phone !~ '^\+?201[0125][0-9]{8}$' THEN
		RAISE EXCEPTION 'Invalid Phone number';
	end if;
	if new_Email Is not null and  new_Email !~ '^[A-z0-9._-]+@[A-z0-9.-]+\.[A-z]{2,}$' THEN
		RAISE EXCEPTION 'Invalid Email format';
	end if;
	
	INSERT INTO Student (Name,Email,Phone) VALUES (new_Name,new_Email,new_Phone);

	EXCEPTION		
		WHEN unique_violation THEN
			RAISE EXCEPTION 'Email Already EXISTS';
    END;
$_$;


ALTER PROCEDURE adm.insertstudent(new_name text, new_email text, new_phone text) OWNER TO postgres;

--
-- TOC entry 256 (class 1255 OID 17010)
-- Name: selectcoursesbytrack(integer, refcursor); Type: PROCEDURE; Schema: adm; Owner: postgres
--

CREATE PROCEDURE adm.selectcoursesbytrack(p_trackid integer, INOUT p_cursor refcursor)
    LANGUAGE plpgsql SECURITY DEFINER
    SET search_path TO 'public'
    AS $$
BEGIN
    IF NOT EXISTS (SELECT 1 FROM Track WHERE TrackID = p_TrackID) THEN
        RAISE EXCEPTION 'TrackID % does not exist.', p_TrackID;
    END IF;

    OPEN p_Cursor FOR
        SELECT  c.CourseID,
                c.CourseName,
                c.MinDegree,
                c.MaxDegree
        FROM Track_Course tc
        JOIN Course c ON c.CourseID = tc.CourseID
        WHERE tc.TrackID = p_TrackID
        ORDER BY c.CourseName;

EXCEPTION
    WHEN OTHERS THEN
        RAISE NOTICE 'Error: %', SQLERRM;
END;
$$;


ALTER PROCEDURE adm.selectcoursesbytrack(p_trackid integer, INOUT p_cursor refcursor) OWNER TO postgres;

--
-- TOC entry 244 (class 1255 OID 16986)
-- Name: selectdepartment(integer, refcursor); Type: PROCEDURE; Schema: adm; Owner: postgres
--

CREATE PROCEDURE adm.selectdepartment(INOUT dept_id integer, INOUT p_cursor refcursor)
    LANGUAGE plpgsql SECURITY DEFINER
    SET search_path TO 'public'
    AS $$
BEGIN
	IF dept_id IS NULL THEN
	OPEN p_cursor FOR
		SELECT * FROM Department;
	ELSE
	OPEN p_cursor FOR
    SELECT * FROM Department WHERE DepartmentID = dept_id;
	END IF;
END;
$$;


ALTER PROCEDURE adm.selectdepartment(INOUT dept_id integer, INOUT p_cursor refcursor) OWNER TO postgres;

--
-- TOC entry 257 (class 1255 OID 16994)
-- Name: selecttrack(integer, refcursor); Type: PROCEDURE; Schema: adm; Owner: postgres
--

CREATE PROCEDURE adm.selecttrack(p_departmentid integer, INOUT p_cursor refcursor)
    LANGUAGE plpgsql SECURITY DEFINER
    SET search_path TO 'public'
    AS $$
BEGIN
-- check if DepartmentID exists
IF NOT EXISTS (SELECT 1 FROM Track WHERE DepartmentID = p_DepartmentID) 
THEN
	RAISE EXCEPTION 'DepartmentID % does not exist.', p_DepartmentID;
END IF;

--open cursor to return all tracks in the dep
OPEN p_Cursor FOR
	SELECT  Track.TrackID,
			Track.TrackName,
			Track.DepartmentID
	FROM    Track
	WHERE   Track.DepartmentID = p_DepartmentID;
	
EXCEPTION
    WHEN OTHERS THEN
        RAISE NOTICE 'Error in SelectTrack: %', SQLERRM;
END;
$$;


ALTER PROCEDURE adm.selecttrack(p_departmentid integer, INOUT p_cursor refcursor) OWNER TO postgres;

--
-- TOC entry 258 (class 1255 OID 16997)
-- Name: selecttrackbydeparmentid(integer, refcursor); Type: PROCEDURE; Schema: adm; Owner: postgres
--

CREATE PROCEDURE adm.selecttrackbydeparmentid(INOUT dept_id integer, INOUT p_cursor refcursor)
    LANGUAGE plpgsql SECURITY DEFINER
    SET search_path TO 'public'
    AS $$
BEGIN

	OPEN p_cursor FOR
    SELECT * FROM track WHERE Track.DepartmentID = dept_id;

END;
$$;


ALTER PROCEDURE adm.selecttrackbydeparmentid(INOUT dept_id integer, INOUT p_cursor refcursor) OWNER TO postgres;

--
-- TOC entry 259 (class 1255 OID 17092)
-- Name: updatecourse(integer, text, integer, integer); Type: PROCEDURE; Schema: adm; Owner: postgres
--

CREATE PROCEDURE adm.updatecourse(p_courseid integer, p_coursename text, p_mindegree integer, p_maxdegree integer)
    LANGUAGE plpgsql SECURITY DEFINER
    SET search_path TO 'public'
    AS $$
BEGIN
    IF NOT EXISTS (SELECT 1 FROM Course WHERE CourseID = p_CourseID) THEN
        RAISE EXCEPTION 'CourseID % does not exist.', p_CourseID;
    ELSIF p_CourseName IS NULL OR TRIM(p_CourseName) = '' THEN
        RAISE EXCEPTION 'CourseName cannot be NULL or empty.';
    ELSIF p_MinDegree < 0 THEN
        RAISE EXCEPTION 'MinDegree cannot be negative.';
    ELSIF p_MaxDegree < p_MinDegree THEN
        RAISE EXCEPTION 'MaxDegree % cannot be less than MinDegree %.', p_MaxDegree, p_MinDegree;
    ELSE
        UPDATE Course
        SET CourseName = p_CourseName,
            MinDegree  = p_MinDegree,
            MaxDegree  = p_MaxDegree
        WHERE CourseID = p_CourseID;

        RAISE NOTICE 'Course % updated successfully.', p_CourseID;
    END IF;
END;
$$;


ALTER PROCEDURE adm.updatecourse(p_courseid integer, p_coursename text, p_mindegree integer, p_maxdegree integer) OWNER TO postgres;

--
-- TOC entry 260 (class 1255 OID 16912)
-- Name: updatedepartment(integer, text, text); Type: PROCEDURE; Schema: adm; Owner: postgres
--

CREATE PROCEDURE adm.updatedepartment(p_dept_id integer, p_dept_name text, p_dept_loc text)
    LANGUAGE plpgsql SECURITY DEFINER
    SET search_path TO 'public'
    AS $$
BEGIN
		IF NOT EXISTS(SELECT * FROM Department WHERE DepartmentID =  p_dept_id)
			THEN RAISE EXCEPTION 'This department does not exist';
		END IF;
	UPDATE Department SET DepartmentName = p_dept_name, DeptLocation = p_dept_loc 
	WHERE DepartmentID =  p_dept_id;
END;
$$;


ALTER PROCEDURE adm.updatedepartment(p_dept_id integer, p_dept_name text, p_dept_loc text) OWNER TO postgres;

--
-- TOC entry 261 (class 1255 OID 17038)
-- Name: updateinstructor(integer, text, text, integer); Type: PROCEDURE; Schema: adm; Owner: postgres
--

CREATE PROCEDURE adm.updateinstructor(instructor_id integer, new_name text, new_email text, new_departmentno integer)
    LANGUAGE plpgsql SECURITY DEFINER
    SET search_path TO 'public'
    AS $_$
    BEGIN

	-- validation the email address regex . 
	if new_Email Is not null and  new_Email !~ '^[A-z0-9._-]+@[A-z0-9.-]+\.[A-z]{2,}$' THEN
		RAISE EXCEPTION 'Invalid Email format';
	end if;
		
    UPDATE Instructor set Name = new_name, Email = new_Email,DepartmentNo=new_DepartmentNo  WHERE InstructorID = instructor_id;

    IF NOT FOUND THEN
        RAISE EXCEPTION 'Instructor not found';
    END IF;

	EXCEPTION		
		WHEN unique_violation THEN
			RAISE EXCEPTION 'Email Already EXISTS';

		WHEN foreign_key_violation THEN
			RAISE EXCEPTION 'Invalid Department ID';
    END;
$_$;


ALTER PROCEDURE adm.updateinstructor(instructor_id integer, new_name text, new_email text, new_departmentno integer) OWNER TO postgres;

--
-- TOC entry 269 (class 1255 OID 17034)
-- Name: updatestudent(integer, text, text, text); Type: PROCEDURE; Schema: adm; Owner: postgres
--

CREATE PROCEDURE adm.updatestudent(student_id integer, new_name text, new_email text, new_phone text)
    LANGUAGE plpgsql SECURITY DEFINER
    SET search_path TO 'public'
    AS $_$
    BEGIN
	--checks validations on the procedure as the user will use the procedure only so it's better to be here.
	if new_Phone Is not null and  new_Phone !~ '^\+?201[0125][0-9]{8}$' THEN
		RAISE EXCEPTION 'Invalid Phone number';
	end if;
	if new_Email Is not null and  new_Email !~ '^[A-z0-9._-]+@[A-z0-9.-]+\.[A-z]{2,}$' THEN
		RAISE EXCEPTION 'Invalid Email format';
	end if;
		
    UPDATE Student set Name = new_name, Email = new_Email,phone=new_phone  WHERE StudentID = student_id;

    IF NOT FOUND THEN
        RAISE EXCEPTION 'Student not found';
    END IF;
	-- unique key for emails will gives error.
	EXCEPTION		
		WHEN unique_violation THEN
			RAISE EXCEPTION 'Email Already EXISTS';
    END;
$_$;


ALTER PROCEDURE adm.updatestudent(student_id integer, new_name text, new_email text, new_phone text) OWNER TO postgres;

--
-- TOC entry 240 (class 1255 OID 16982)
-- Name: updatetrack(integer, text, integer); Type: PROCEDURE; Schema: adm; Owner: postgres
--

CREATE PROCEDURE adm.updatetrack(p_trackid integer, p_trackname text, p_departmentid integer)
    LANGUAGE plpgsql SECURITY DEFINER
    SET search_path TO 'public'
    AS $$
BEGIN
 	-- check if TrackID   exists
	IF NOT EXISTS (SELECT 1 FROM Track WHERE TrackID = p_TrackID) 
	THEN
		RAISE EXCEPTION 'TrackID % does not exist.', p_TrackID;

    -- if TrackName is NULL or empty
	ELSIF p_TrackName IS NULL OR TRIM(p_TrackName) = '' 
	THEN
		RAISE EXCEPTION 'TrackName cannot be NULL or empty.';

	-- Check if DepartmentID exists
	ELSIF NOT EXISTS (SELECT 1 FROM Department WHERE DepartmentID = p_DepartmentID) 
	THEN
		RAISE EXCEPTION 'DepartmentID % does not exist.', p_DepartmentID;

	ELSE
		UPDATE Track
		SET 
			TrackName = p_TrackName,
			DepartmentID = p_DepartmentID
        WHERE TrackID = p_TrackID;

		RAISE NOTICE 'Track % updated successfully.', p_TrackID;
    END IF;
END;
$$;


ALTER PROCEDURE adm.updatetrack(p_trackid integer, p_trackname text, p_departmentid integer) OWNER TO postgres;

--
-- TOC entry 265 (class 1255 OID 17083)
-- Name: correctexam(integer); Type: PROCEDURE; Schema: instructor; Owner: postgres
--

CREATE PROCEDURE instructor.correctexam(p_studentexamid integer)
    LANGUAGE plpgsql SECURITY DEFINER
    SET search_path TO 'public'
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


ALTER PROCEDURE instructor.correctexam(p_studentexamid integer) OWNER TO postgres;

--
-- TOC entry 245 (class 1255 OID 17088)
-- Name: deletequestion(integer); Type: PROCEDURE; Schema: instructor; Owner: postgres
--

CREATE PROCEDURE instructor.deletequestion(p_questionid integer)
    LANGUAGE plpgsql SECURITY DEFINER
    SET search_path TO 'public'
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


ALTER PROCEDURE instructor.deletequestion(p_questionid integer) OWNER TO postgres;

--
-- TOC entry 267 (class 1255 OID 17084)
-- Name: generateexam(integer, text, integer, integer); Type: PROCEDURE; Schema: instructor; Owner: postgres
--

CREATE PROCEDURE instructor.generateexam(p_course_id integer, p_exam_name text, p_mcq_num integer, p_tf_num integer)
    LANGUAGE plpgsql SECURITY DEFINER
    SET search_path TO 'public'
    AS $$
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


ALTER PROCEDURE instructor.generateexam(p_course_id integer, p_exam_name text, p_mcq_num integer, p_tf_num integer) OWNER TO postgres;

--
-- TOC entry 251 (class 1255 OID 17085)
-- Name: insertchoice(integer, text, integer); Type: PROCEDURE; Schema: instructor; Owner: postgres
--

CREATE PROCEDURE instructor.insertchoice(c_questionid integer, c_optiontext text, c_optionorder integer)
    LANGUAGE plpgsql SECURITY DEFINER
    SET search_path TO 'public'
    AS $$
    BEGIN
        INSERT INTO Choice ( QuestionID, OptionText, OptionOrder) VALUES ( c_QuestionID, c_OptionText, c_OptionOrder);

        EXCEPTION
        WHEN foreign_key_violation THEN
        RAISE EXCEPTION 'QuestionID invalid';
        
        WHEN not_null_violation THEN
        RAISE EXCEPTION 'Null Values not alloweds';           
    END;
$$;


ALTER PROCEDURE instructor.insertchoice(c_questionid integer, c_optiontext text, c_optionorder integer) OWNER TO postgres;

--
-- TOC entry 252 (class 1255 OID 17086)
-- Name: insertquestion(integer, text, text, integer); Type: PROCEDURE; Schema: instructor; Owner: postgres
--

CREATE PROCEDURE instructor.insertquestion(q_courseid integer, q_questiontext text, q_questiontype text, q_points integer)
    LANGUAGE plpgsql SECURITY DEFINER
    SET search_path TO 'public'
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


ALTER PROCEDURE instructor.insertquestion(q_courseid integer, q_questiontext text, q_questiontype text, q_points integer) OWNER TO postgres;

--
-- TOC entry 263 (class 1255 OID 17089)
-- Name: report_instructorcourses(integer, refcursor); Type: PROCEDURE; Schema: instructor; Owner: postgres
--

CREATE PROCEDURE instructor.report_instructorcourses(p_instructorid integer, INOUT p_cursor refcursor DEFAULT 'rpt_instructor_courses'::refcursor)
    LANGUAGE plpgsql SECURITY DEFINER
    SET search_path TO 'public'
    AS $$
BEGIN
    OPEN p_cursor FOR
        SELECT
            c.CourseName,
            t.TrackName,
            COUNT(DISTINCT st.StudentID) AS StudentCount
        FROM Instructor_Course ic
        JOIN Course        c  ON ic.CourseID = c.CourseID
        JOIN Track_Course  tc ON c.CourseID  = tc.CourseID
        JOIN Track         t  ON tc.TrackID  = t.TrackID
        LEFT JOIN Student_Track st ON t.TrackID = st.TrackID
        WHERE ic.InstructorID = p_InstructorID
        GROUP BY c.CourseName, t.TrackName
        ORDER BY c.CourseName, t.TrackName;
END;
$$;


ALTER PROCEDURE instructor.report_instructorcourses(p_instructorid integer, INOUT p_cursor refcursor) OWNER TO postgres;

--
-- TOC entry 266 (class 1255 OID 17091)
-- Name: report_studentsbydepartment(integer, refcursor); Type: PROCEDURE; Schema: instructor; Owner: postgres
--

CREATE PROCEDURE instructor.report_studentsbydepartment(p_departmentno integer, INOUT p_cursor refcursor DEFAULT 'rpt_students_by_dept'::refcursor)
    LANGUAGE plpgsql SECURITY DEFINER
    SET search_path TO 'public'
    AS $$
BEGIN
    OPEN p_cursor FOR
        SELECT
            s.StudentID,
            s.Name,
            s.Email,
            s.Phone,
            t.TrackName,
            d.DepartementName AS BranchName
        FROM Student        s
        JOIN Student_Track  st ON s.StudentID    = st.StudentID
        JOIN Track          t  ON st.TrackID     = t.TrackID
        JOIN Department     d  ON t.DepartmentID = d.DepartmentID
        WHERE d.DepartmentID = p_DepartmentNo
        ORDER BY s.Name;
END;
$$;


ALTER PROCEDURE instructor.report_studentsbydepartment(p_departmentno integer, INOUT p_cursor refcursor) OWNER TO postgres;

--
-- TOC entry 262 (class 1255 OID 17130)
-- Name: setmodelanswer(integer, integer); Type: PROCEDURE; Schema: instructor; Owner: postgres
--

CREATE PROCEDURE instructor.setmodelanswer(p_question_id integer, p_coption_id integer)
    LANGUAGE plpgsql SECURITY DEFINER
    SET search_path TO 'public'
    AS $$
BEGIN
    IF NOT EXISTS (
        SELECT 1 FROM public.Choice
        WHERE QuestionID = p_question_id AND OptionID = p_coption_id
    ) THEN
        RAISE EXCEPTION 'Option % does not belong to Question %',
            p_coption_id, p_question_id;
    END IF;

    INSERT INTO public.ModelAnswer(QuestionID, CorrectOptionID)
    VALUES (p_question_id, p_coption_id)
    ON CONFLICT (QuestionID)                          -- if already exists
    DO UPDATE SET CorrectOptionID = EXCLUDED.CorrectOptionID;  -- just update it
END;
$$;


ALTER PROCEDURE instructor.setmodelanswer(p_question_id integer, p_coption_id integer) OWNER TO postgres;

--
-- TOC entry 271 (class 1255 OID 17160)
-- Name: updatechoice(integer, text, integer); Type: PROCEDURE; Schema: instructor; Owner: postgres
--

CREATE PROCEDURE instructor.updatechoice(c_optionid integer, c_optiontext text, c_optionorder integer)
    LANGUAGE plpgsql SECURITY DEFINER
    SET search_path TO 'public'
    AS $$
    BEGIN
        UPDATE Choice 
        SET
            OptionText = c_OptionText,
            OptionOrder = c_OptionOrder
        WHERE 
            OptionID = c_OptionID;
        EXCEPTION
        WHEN foreign_key_violation THEN
        RAISE EXCEPTION 'OptionID invalid';
        
        WHEN not_null_violation THEN
        RAISE EXCEPTION 'Null Values not alloweds';    
    END
$$;


ALTER PROCEDURE instructor.updatechoice(c_optionid integer, c_optiontext text, c_optionorder integer) OWNER TO postgres;

--
-- TOC entry 255 (class 1255 OID 17093)
-- Name: updatequestion(integer, text, text, integer); Type: PROCEDURE; Schema: instructor; Owner: postgres
--

CREATE PROCEDURE instructor.updatequestion(q_courseid integer, q_questiontext text, q_questiontype text, q_points integer)
    LANGUAGE plpgsql SECURITY DEFINER
    SET search_path TO 'public'
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


ALTER PROCEDURE instructor.updatequestion(q_courseid integer, q_questiontext text, q_questiontype text, q_points integer) OWNER TO postgres;

--
-- TOC entry 264 (class 1255 OID 17104)
-- Name: report_studentgrades(integer, refcursor); Type: PROCEDURE; Schema: student; Owner: postgres
--

CREATE PROCEDURE student.report_studentgrades(p_studentid integer, INOUT p_cursor refcursor)
    LANGUAGE plpgsql SECURITY DEFINER
    SET search_path TO 'public'
    AS $$
BEGIN
    OPEN p_cursor FOR
        SELECT
            c.CourseName,
            e.ExamName,
            se.TotalGrade,
            c.MaxDegree,
            ROUND(
                (se.TotalGrade::FLOAT / NULLIF(c.MaxDegree, 0) * 100)::NUMERIC,
                2
            ) AS Percentage
        FROM      public.StudentExam se
        JOIN      public.Exam         e  ON se.ExamID  = e.ExamID
        JOIN      public.Course       c  ON e.CourseID = c.CourseID
        WHERE     se.StudentID = p_StudentID
        ORDER BY  c.CourseName, e.ExamName;
END;
$$;


ALTER PROCEDURE student.report_studentgrades(p_studentid integer, INOUT p_cursor refcursor) OWNER TO postgres;

--
-- TOC entry 270 (class 1255 OID 17158)
-- Name: submitexamanswers(integer, integer, timestamp without time zone, timestamp without time zone, jsonb); Type: PROCEDURE; Schema: student; Owner: postgres
--

CREATE PROCEDURE student.submitexamanswers(p_studentid integer, p_examid integer, p_starttime timestamp without time zone, p_endtime timestamp without time zone, p_answers jsonb)
    LANGUAGE plpgsql SECURITY DEFINER
    SET search_path TO 'public'
    AS $$
DECLARE
    v_StudentEXAMID  INT;
    v_CourseID INT;
    v_answer JSONB;
    v_QuestionID INT;
    v_OptionID INT;
    v_examCount INT;
    v_studentCount INT;
	v_TrackID INT;
	v_EnrollCount INT;
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
    WHERE ExamID = p_ExamID;

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
            'Student is not enrolled in this track';
    END IF;

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


ALTER PROCEDURE student.submitexamanswers(p_studentid integer, p_examid integer, p_starttime timestamp without time zone, p_endtime timestamp without time zone, p_answers jsonb) OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 219 (class 1259 OID 16788)
-- Name: choice; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.choice (
    optionid integer NOT NULL,
    questionid integer NOT NULL,
    optiontext text NOT NULL,
    optionorder integer NOT NULL
);


ALTER TABLE public.choice OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 16786)
-- Name: choice_optionid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.choice_optionid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.choice_optionid_seq OWNER TO postgres;

--
-- TOC entry 3227 (class 0 OID 0)
-- Dependencies: 218
-- Name: choice_optionid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.choice_optionid_seq OWNED BY public.choice.optionid;


--
-- TOC entry 208 (class 1259 OID 16675)
-- Name: course; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.course (
    courseid integer NOT NULL,
    coursename text NOT NULL,
    mindegree integer,
    maxdegree integer,
    CONSTRAINT course_degree_chk CHECK (((mindegree IS NULL) OR (maxdegree IS NULL) OR (mindegree <= maxdegree)))
);


ALTER TABLE public.course OWNER TO postgres;

--
-- TOC entry 207 (class 1259 OID 16673)
-- Name: course_courseid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.course_courseid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.course_courseid_seq OWNER TO postgres;

--
-- TOC entry 3229 (class 0 OID 0)
-- Dependencies: 207
-- Name: course_courseid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.course_courseid_seq OWNED BY public.course.courseid;


--
-- TOC entry 204 (class 1259 OID 16647)
-- Name: department; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.department (
    departmentid integer NOT NULL,
    departementname text NOT NULL,
    deptlocation text
);


ALTER TABLE public.department OWNER TO postgres;

--
-- TOC entry 203 (class 1259 OID 16645)
-- Name: department_departmentid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.department_departmentid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.department_departmentid_seq OWNER TO postgres;

--
-- TOC entry 3231 (class 0 OID 0)
-- Dependencies: 203
-- Name: department_departmentid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.department_departmentid_seq OWNED BY public.department.departmentid;


--
-- TOC entry 222 (class 1259 OID 16821)
-- Name: exam; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.exam (
    examid integer NOT NULL,
    examname text NOT NULL,
    courseid integer NOT NULL,
    createddate timestamp without time zone DEFAULT now(),
    totalquestions integer NOT NULL,
    CONSTRAINT exam_totalquestions_check CHECK ((totalquestions > 0))
);


ALTER TABLE public.exam OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 16819)
-- Name: exam_examid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.exam_examid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.exam_examid_seq OWNER TO postgres;

--
-- TOC entry 3233 (class 0 OID 0)
-- Dependencies: 221
-- Name: exam_examid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.exam_examid_seq OWNED BY public.exam.examid;


--
-- TOC entry 223 (class 1259 OID 16838)
-- Name: examquestion; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.examquestion (
    examid integer NOT NULL,
    questionid integer NOT NULL,
    orderno integer NOT NULL
);


ALTER TABLE public.examquestion OWNER TO postgres;

--
-- TOC entry 214 (class 1259 OID 16734)
-- Name: instructor; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.instructor (
    instructorid integer NOT NULL,
    name text NOT NULL,
    email text NOT NULL,
    departmentno integer
);


ALTER TABLE public.instructor OWNER TO postgres;

--
-- TOC entry 215 (class 1259 OID 16751)
-- Name: instructor_course; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.instructor_course (
    instructorid integer NOT NULL,
    courseid integer NOT NULL
);


ALTER TABLE public.instructor_course OWNER TO postgres;

--
-- TOC entry 213 (class 1259 OID 16732)
-- Name: instructor_instructorid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.instructor_instructorid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.instructor_instructorid_seq OWNER TO postgres;

--
-- TOC entry 3237 (class 0 OID 0)
-- Dependencies: 213
-- Name: instructor_instructorid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.instructor_instructorid_seq OWNED BY public.instructor.instructorid;


--
-- TOC entry 220 (class 1259 OID 16803)
-- Name: modelanswer; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.modelanswer (
    questionid integer NOT NULL,
    correctoptionid integer NOT NULL
);


ALTER TABLE public.modelanswer OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 16770)
-- Name: questions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.questions (
    questionid integer NOT NULL,
    courseid integer NOT NULL,
    questiontext text NOT NULL,
    questiontype text,
    points integer NOT NULL,
    CONSTRAINT questions_questiontype_check CHECK ((questiontype = ANY (ARRAY['MCQ'::text, 'TF'::text])))
);


ALTER TABLE public.questions OWNER TO postgres;

--
-- TOC entry 216 (class 1259 OID 16768)
-- Name: questions_questionid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.questions_questionid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.questions_questionid_seq OWNER TO postgres;

--
-- TOC entry 3240 (class 0 OID 0)
-- Dependencies: 216
-- Name: questions_questionid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.questions_questionid_seq OWNED BY public.questions.questionid;


--
-- TOC entry 211 (class 1259 OID 16704)
-- Name: student; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.student (
    studentid integer NOT NULL,
    name text NOT NULL,
    email text NOT NULL,
    phone text NOT NULL
);


ALTER TABLE public.student OWNER TO postgres;

--
-- TOC entry 210 (class 1259 OID 16702)
-- Name: student_studentid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.student_studentid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.student_studentid_seq OWNER TO postgres;

--
-- TOC entry 3242 (class 0 OID 0)
-- Dependencies: 210
-- Name: student_studentid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.student_studentid_seq OWNED BY public.student.studentid;


--
-- TOC entry 212 (class 1259 OID 16715)
-- Name: student_track; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.student_track (
    studentid integer NOT NULL,
    trackid integer NOT NULL
);


ALTER TABLE public.student_track OWNER TO postgres;

--
-- TOC entry 227 (class 1259 OID 16878)
-- Name: studentanswer; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.studentanswer (
    studentanswerid integer NOT NULL,
    studentexamid integer NOT NULL,
    questionid integer NOT NULL,
    chosenoptionid integer NOT NULL
);


ALTER TABLE public.studentanswer OWNER TO postgres;

--
-- TOC entry 226 (class 1259 OID 16876)
-- Name: studentanswer_studentanswerid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.studentanswer_studentanswerid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.studentanswer_studentanswerid_seq OWNER TO postgres;

--
-- TOC entry 3245 (class 0 OID 0)
-- Dependencies: 226
-- Name: studentanswer_studentanswerid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.studentanswer_studentanswerid_seq OWNED BY public.studentanswer.studentanswerid;


--
-- TOC entry 225 (class 1259 OID 16856)
-- Name: studentexam; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.studentexam (
    studentexamid integer NOT NULL,
    studentid integer NOT NULL,
    examid integer NOT NULL,
    starttime timestamp without time zone DEFAULT now(),
    endtime timestamp without time zone,
    totalgrade integer DEFAULT 0
);


ALTER TABLE public.studentexam OWNER TO postgres;

--
-- TOC entry 224 (class 1259 OID 16854)
-- Name: studentexam_studentexamid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.studentexam_studentexamid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.studentexam_studentexamid_seq OWNER TO postgres;

--
-- TOC entry 3247 (class 0 OID 0)
-- Dependencies: 224
-- Name: studentexam_studentexamid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.studentexam_studentexamid_seq OWNED BY public.studentexam.studentexamid;


--
-- TOC entry 206 (class 1259 OID 16658)
-- Name: track; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.track (
    trackid integer NOT NULL,
    trackname text NOT NULL,
    departmentid integer NOT NULL
);


ALTER TABLE public.track OWNER TO postgres;

--
-- TOC entry 209 (class 1259 OID 16685)
-- Name: track_course; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.track_course (
    trackid integer NOT NULL,
    courseid integer NOT NULL
);


ALTER TABLE public.track_course OWNER TO postgres;

--
-- TOC entry 205 (class 1259 OID 16656)
-- Name: track_trackid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.track_trackid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.track_trackid_seq OWNER TO postgres;

--
-- TOC entry 3250 (class 0 OID 0)
-- Dependencies: 205
-- Name: track_trackid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.track_trackid_seq OWNED BY public.track.trackid;


--
-- TOC entry 2976 (class 2604 OID 17094)
-- Name: choice optionid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.choice ALTER COLUMN optionid SET DEFAULT nextval('public.choice_optionid_seq'::regclass);


--
-- TOC entry 2970 (class 2604 OID 17095)
-- Name: course courseid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.course ALTER COLUMN courseid SET DEFAULT nextval('public.course_courseid_seq'::regclass);


--
-- TOC entry 2968 (class 2604 OID 17096)
-- Name: department departmentid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.department ALTER COLUMN departmentid SET DEFAULT nextval('public.department_departmentid_seq'::regclass);


--
-- TOC entry 2978 (class 2604 OID 17097)
-- Name: exam examid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.exam ALTER COLUMN examid SET DEFAULT nextval('public.exam_examid_seq'::regclass);


--
-- TOC entry 2973 (class 2604 OID 17098)
-- Name: instructor instructorid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.instructor ALTER COLUMN instructorid SET DEFAULT nextval('public.instructor_instructorid_seq'::regclass);


--
-- TOC entry 2974 (class 2604 OID 17099)
-- Name: questions questionid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.questions ALTER COLUMN questionid SET DEFAULT nextval('public.questions_questionid_seq'::regclass);


--
-- TOC entry 2972 (class 2604 OID 17100)
-- Name: student studentid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.student ALTER COLUMN studentid SET DEFAULT nextval('public.student_studentid_seq'::regclass);


--
-- TOC entry 2983 (class 2604 OID 17101)
-- Name: studentanswer studentanswerid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.studentanswer ALTER COLUMN studentanswerid SET DEFAULT nextval('public.studentanswer_studentanswerid_seq'::regclass);


--
-- TOC entry 2982 (class 2604 OID 17102)
-- Name: studentexam studentexamid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.studentexam ALTER COLUMN studentexamid SET DEFAULT nextval('public.studentexam_studentexamid_seq'::regclass);


--
-- TOC entry 2969 (class 2604 OID 17103)
-- Name: track trackid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.track ALTER COLUMN trackid SET DEFAULT nextval('public.track_trackid_seq'::regclass);


--
-- TOC entry 3016 (class 2606 OID 16796)
-- Name: choice choice_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.choice
    ADD CONSTRAINT choice_pkey PRIMARY KEY (optionid);


--
-- TOC entry 2990 (class 2606 OID 16684)
-- Name: course course_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.course
    ADD CONSTRAINT course_pkey PRIMARY KEY (courseid);


--
-- TOC entry 2985 (class 2606 OID 16655)
-- Name: department department_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.department
    ADD CONSTRAINT department_pkey PRIMARY KEY (departmentid);


--
-- TOC entry 3023 (class 2606 OID 16831)
-- Name: exam exam_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.exam
    ADD CONSTRAINT exam_pkey PRIMARY KEY (examid);


--
-- TOC entry 3026 (class 2606 OID 16842)
-- Name: examquestion examquestion_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.examquestion
    ADD CONSTRAINT examquestion_pkey PRIMARY KEY (examid, questionid);


--
-- TOC entry 3011 (class 2606 OID 16755)
-- Name: instructor_course instructor_course_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.instructor_course
    ADD CONSTRAINT instructor_course_pkey PRIMARY KEY (instructorid, courseid);


--
-- TOC entry 3005 (class 2606 OID 16744)
-- Name: instructor instructor_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.instructor
    ADD CONSTRAINT instructor_email_key UNIQUE (email);


--
-- TOC entry 3007 (class 2606 OID 16742)
-- Name: instructor instructor_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.instructor
    ADD CONSTRAINT instructor_pkey PRIMARY KEY (instructorid);


--
-- TOC entry 3020 (class 2606 OID 16807)
-- Name: modelanswer modelanswer_questionid_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.modelanswer
    ADD CONSTRAINT modelanswer_questionid_key UNIQUE (questionid);


--
-- TOC entry 3014 (class 2606 OID 16779)
-- Name: questions questions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.questions
    ADD CONSTRAINT questions_pkey PRIMARY KEY (questionid);


--
-- TOC entry 2996 (class 2606 OID 16714)
-- Name: student student_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.student
    ADD CONSTRAINT student_email_key UNIQUE (email);


--
-- TOC entry 2998 (class 2606 OID 16712)
-- Name: student student_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.student
    ADD CONSTRAINT student_pkey PRIMARY KEY (studentid);


--
-- TOC entry 3002 (class 2606 OID 16719)
-- Name: student_track student_track_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.student_track
    ADD CONSTRAINT student_track_pkey PRIMARY KEY (studentid, trackid);


--
-- TOC entry 3035 (class 2606 OID 16883)
-- Name: studentanswer studentanswer_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.studentanswer
    ADD CONSTRAINT studentanswer_pkey PRIMARY KEY (studentanswerid);


--
-- TOC entry 3030 (class 2606 OID 16863)
-- Name: studentexam studentexam_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.studentexam
    ADD CONSTRAINT studentexam_pkey PRIMARY KEY (studentexamid);


--
-- TOC entry 2994 (class 2606 OID 16689)
-- Name: track_course track_course_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.track_course
    ADD CONSTRAINT track_course_pkey PRIMARY KEY (trackid, courseid);


--
-- TOC entry 2988 (class 2606 OID 16666)
-- Name: track track_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.track
    ADD CONSTRAINT track_pkey PRIMARY KEY (trackid);


--
-- TOC entry 3021 (class 1259 OID 16837)
-- Name: course_exam_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX course_exam_idx ON public.exam USING btree (courseid);


--
-- TOC entry 3024 (class 1259 OID 16853)
-- Name: eq_question_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX eq_question_idx ON public.examquestion USING btree (questionid);


--
-- TOC entry 3003 (class 1259 OID 16750)
-- Name: idx_instructor_department; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_instructor_department ON public.instructor USING btree (departmentno);


--
-- TOC entry 3008 (class 1259 OID 16766)
-- Name: idx_instructorcourse_course; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_instructorcourse_course ON public.instructor_course USING btree (courseid);


--
-- TOC entry 3009 (class 1259 OID 16767)
-- Name: idx_instructorcourse_instructor; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_instructorcourse_instructor ON public.instructor_course USING btree (instructorid);


--
-- TOC entry 2999 (class 1259 OID 16731)
-- Name: idx_studenttrack_student; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_studenttrack_student ON public.student_track USING btree (studentid);


--
-- TOC entry 3000 (class 1259 OID 16730)
-- Name: idx_studenttrack_track; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_studenttrack_track ON public.student_track USING btree (trackid);


--
-- TOC entry 2991 (class 1259 OID 16701)
-- Name: idx_track_course_courseid; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_track_course_courseid ON public.track_course USING btree (courseid);


--
-- TOC entry 2992 (class 1259 OID 16700)
-- Name: idx_track_course_trackid; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_track_course_trackid ON public.track_course USING btree (trackid);


--
-- TOC entry 2986 (class 1259 OID 16672)
-- Name: idx_track_departmentid; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_track_departmentid ON public.track USING btree (departmentid);


--
-- TOC entry 3018 (class 1259 OID 16818)
-- Name: modelanswer_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX modelanswer_idx ON public.modelanswer USING btree (questionid);


--
-- TOC entry 3012 (class 1259 OID 16785)
-- Name: question_course_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX question_course_idx ON public.questions USING btree (courseid);


--
-- TOC entry 3017 (class 1259 OID 16802)
-- Name: question_option_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX question_option_idx ON public.choice USING btree (questionid);


--
-- TOC entry 3031 (class 1259 OID 16899)
-- Name: sa_exam_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX sa_exam_idx ON public.studentanswer USING btree (studentexamid);


--
-- TOC entry 3032 (class 1259 OID 16901)
-- Name: sa_option_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX sa_option_idx ON public.studentanswer USING btree (chosenoptionid);


--
-- TOC entry 3033 (class 1259 OID 16900)
-- Name: sa_question_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX sa_question_idx ON public.studentanswer USING btree (questionid);


--
-- TOC entry 3027 (class 1259 OID 16875)
-- Name: se_exam_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX se_exam_idx ON public.studentexam USING btree (examid);


--
-- TOC entry 3028 (class 1259 OID 16874)
-- Name: se_student_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX se_student_idx ON public.studentexam USING btree (studentid);


--
-- TOC entry 3048 (class 2606 OID 16832)
-- Name: exam course_exam_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.exam
    ADD CONSTRAINT course_exam_fk FOREIGN KEY (courseid) REFERENCES public.course(courseid) ON DELETE CASCADE;


--
-- TOC entry 3049 (class 2606 OID 16843)
-- Name: examquestion eq_exam_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.examquestion
    ADD CONSTRAINT eq_exam_fk FOREIGN KEY (examid) REFERENCES public.exam(examid) ON DELETE CASCADE;


--
-- TOC entry 3050 (class 2606 OID 16848)
-- Name: examquestion eq_question_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.examquestion
    ADD CONSTRAINT eq_question_fk FOREIGN KEY (questionid) REFERENCES public.questions(questionid) ON DELETE CASCADE;


--
-- TOC entry 3044 (class 2606 OID 16780)
-- Name: questions fk_course; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.questions
    ADD CONSTRAINT fk_course FOREIGN KEY (courseid) REFERENCES public.course(courseid);


--
-- TOC entry 3038 (class 2606 OID 16695)
-- Name: track_course fk_course; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.track_course
    ADD CONSTRAINT fk_course FOREIGN KEY (courseid) REFERENCES public.course(courseid) ON DELETE CASCADE;


--
-- TOC entry 3036 (class 2606 OID 16667)
-- Name: track fk_depid; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.track
    ADD CONSTRAINT fk_depid FOREIGN KEY (departmentid) REFERENCES public.department(departmentid) ON DELETE CASCADE;


--
-- TOC entry 3041 (class 2606 OID 16745)
-- Name: instructor fk_instructor_dept; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.instructor
    ADD CONSTRAINT fk_instructor_dept FOREIGN KEY (departmentno) REFERENCES public.department(departmentid);


--
-- TOC entry 3043 (class 2606 OID 16761)
-- Name: instructor_course fk_instructorcourse_course; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.instructor_course
    ADD CONSTRAINT fk_instructorcourse_course FOREIGN KEY (courseid) REFERENCES public.course(courseid) ON DELETE CASCADE;


--
-- TOC entry 3042 (class 2606 OID 16756)
-- Name: instructor_course fk_instructorcourse_instructor; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.instructor_course
    ADD CONSTRAINT fk_instructorcourse_instructor FOREIGN KEY (instructorid) REFERENCES public.instructor(instructorid) ON DELETE CASCADE;


--
-- TOC entry 3047 (class 2606 OID 16813)
-- Name: modelanswer fk_option; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.modelanswer
    ADD CONSTRAINT fk_option FOREIGN KEY (correctoptionid) REFERENCES public.choice(optionid);


--
-- TOC entry 3045 (class 2606 OID 16797)
-- Name: choice fk_question; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.choice
    ADD CONSTRAINT fk_question FOREIGN KEY (questionid) REFERENCES public.questions(questionid);


--
-- TOC entry 3046 (class 2606 OID 16808)
-- Name: modelanswer fk_question; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.modelanswer
    ADD CONSTRAINT fk_question FOREIGN KEY (questionid) REFERENCES public.questions(questionid);


--
-- TOC entry 3039 (class 2606 OID 16720)
-- Name: student_track fk_studenttrack_student; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.student_track
    ADD CONSTRAINT fk_studenttrack_student FOREIGN KEY (studentid) REFERENCES public.student(studentid) ON DELETE CASCADE;


--
-- TOC entry 3040 (class 2606 OID 16725)
-- Name: student_track fk_studenttrack_track; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.student_track
    ADD CONSTRAINT fk_studenttrack_track FOREIGN KEY (trackid) REFERENCES public.track(trackid) ON DELETE CASCADE;


--
-- TOC entry 3037 (class 2606 OID 16690)
-- Name: track_course fk_track; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.track_course
    ADD CONSTRAINT fk_track FOREIGN KEY (trackid) REFERENCES public.track(trackid) ON DELETE CASCADE;


--
-- TOC entry 3053 (class 2606 OID 16884)
-- Name: studentanswer sa_exam_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.studentanswer
    ADD CONSTRAINT sa_exam_fk FOREIGN KEY (studentexamid) REFERENCES public.studentexam(studentexamid) ON DELETE CASCADE;


--
-- TOC entry 3055 (class 2606 OID 16894)
-- Name: studentanswer sa_option_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.studentanswer
    ADD CONSTRAINT sa_option_fk FOREIGN KEY (chosenoptionid) REFERENCES public.choice(optionid) ON DELETE CASCADE;


--
-- TOC entry 3054 (class 2606 OID 16889)
-- Name: studentanswer sa_question_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.studentanswer
    ADD CONSTRAINT sa_question_fk FOREIGN KEY (questionid) REFERENCES public.questions(questionid) ON DELETE CASCADE;


--
-- TOC entry 3051 (class 2606 OID 16864)
-- Name: studentexam se_exam_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.studentexam
    ADD CONSTRAINT se_exam_fk FOREIGN KEY (examid) REFERENCES public.exam(examid) ON DELETE CASCADE;


--
-- TOC entry 3052 (class 2606 OID 16869)
-- Name: studentexam se_student_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.studentexam
    ADD CONSTRAINT se_student_fk FOREIGN KEY (studentid) REFERENCES public.student(studentid) ON DELETE CASCADE;


--
-- TOC entry 3191 (class 0 OID 0)
-- Dependencies: 4
-- Name: SCHEMA adm; Type: ACL; Schema: -; Owner: postgres
--

GRANT USAGE ON SCHEMA adm TO adm_role;


--
-- TOC entry 3192 (class 0 OID 0)
-- Dependencies: 7
-- Name: SCHEMA instructor; Type: ACL; Schema: -; Owner: postgres
--

GRANT USAGE ON SCHEMA instructor TO instructor_role;
GRANT USAGE ON SCHEMA instructor TO adm_role;


--
-- TOC entry 3194 (class 0 OID 0)
-- Dependencies: 8
-- Name: SCHEMA student; Type: ACL; Schema: -; Owner: postgres
--

GRANT USAGE ON SCHEMA student TO student_role;
GRANT USAGE ON SCHEMA student TO nada;
GRANT USAGE ON SCHEMA student TO adm_role;


--
-- TOC entry 3195 (class 0 OID 0)
-- Dependencies: 247
-- Name: PROCEDURE assigninstructortocourse(new_instructorid integer, new_courseid integer); Type: ACL; Schema: adm; Owner: postgres
--

GRANT ALL ON PROCEDURE adm.assigninstructortocourse(new_instructorid integer, new_courseid integer) TO adm_role;


--
-- TOC entry 3196 (class 0 OID 0)
-- Dependencies: 248
-- Name: PROCEDURE assignstudenttotrack(new_studentid integer, new_trackid integer); Type: ACL; Schema: adm; Owner: postgres
--

GRANT ALL ON PROCEDURE adm.assignstudenttotrack(new_studentid integer, new_trackid integer) TO adm_role;


--
-- TOC entry 3197 (class 0 OID 0)
-- Dependencies: 253
-- Name: PROCEDURE deletecourse(p_courseid integer); Type: ACL; Schema: adm; Owner: postgres
--

GRANT ALL ON PROCEDURE adm.deletecourse(p_courseid integer) TO adm_role;


--
-- TOC entry 3198 (class 0 OID 0)
-- Dependencies: 246
-- Name: PROCEDURE deletedepartment(p_dept_id integer); Type: ACL; Schema: adm; Owner: postgres
--

GRANT ALL ON PROCEDURE adm.deletedepartment(p_dept_id integer) TO adm_role;


--
-- TOC entry 3199 (class 0 OID 0)
-- Dependencies: 249
-- Name: PROCEDURE deleteinstructor(instructor_id integer); Type: ACL; Schema: adm; Owner: postgres
--

GRANT ALL ON PROCEDURE adm.deleteinstructor(instructor_id integer) TO adm_role;


--
-- TOC entry 3200 (class 0 OID 0)
-- Dependencies: 250
-- Name: PROCEDURE deletestudent(student_id integer); Type: ACL; Schema: adm; Owner: postgres
--

GRANT ALL ON PROCEDURE adm.deletestudent(student_id integer) TO adm_role;


--
-- TOC entry 3201 (class 0 OID 0)
-- Dependencies: 228
-- Name: PROCEDURE deletetrack(p_trackid integer); Type: ACL; Schema: adm; Owner: postgres
--

GRANT ALL ON PROCEDURE adm.deletetrack(p_trackid integer) TO adm_role;


--
-- TOC entry 3202 (class 0 OID 0)
-- Dependencies: 254
-- Name: PROCEDURE insert_track(p_trackname text, p_departmentid integer); Type: ACL; Schema: adm; Owner: postgres
--

GRANT ALL ON PROCEDURE adm.insert_track(p_trackname text, p_departmentid integer) TO adm_role;


--
-- TOC entry 3203 (class 0 OID 0)
-- Dependencies: 268
-- Name: PROCEDURE insertcourse(p_coursename text, p_mindegree integer, p_maxdegree integer); Type: ACL; Schema: adm; Owner: postgres
--

GRANT ALL ON PROCEDURE adm.insertcourse(p_coursename text, p_mindegree integer, p_maxdegree integer) TO adm_role;


--
-- TOC entry 3204 (class 0 OID 0)
-- Dependencies: 241
-- Name: PROCEDURE insertdepartment(p_dept_name text, p_dept_loc text); Type: ACL; Schema: adm; Owner: postgres
--

GRANT ALL ON PROCEDURE adm.insertdepartment(p_dept_name text, p_dept_loc text) TO adm_role;


--
-- TOC entry 3205 (class 0 OID 0)
-- Dependencies: 242
-- Name: PROCEDURE insertinstructor(new_name text, new_email text, new_departmentno integer); Type: ACL; Schema: adm; Owner: postgres
--

GRANT ALL ON PROCEDURE adm.insertinstructor(new_name text, new_email text, new_departmentno integer) TO adm_role;


--
-- TOC entry 3206 (class 0 OID 0)
-- Dependencies: 243
-- Name: PROCEDURE insertstudent(new_name text, new_email text, new_phone text); Type: ACL; Schema: adm; Owner: postgres
--

GRANT ALL ON PROCEDURE adm.insertstudent(new_name text, new_email text, new_phone text) TO adm_role;


--
-- TOC entry 3207 (class 0 OID 0)
-- Dependencies: 256
-- Name: PROCEDURE selectcoursesbytrack(p_trackid integer, INOUT p_cursor refcursor); Type: ACL; Schema: adm; Owner: postgres
--

GRANT ALL ON PROCEDURE adm.selectcoursesbytrack(p_trackid integer, INOUT p_cursor refcursor) TO adm_role;


--
-- TOC entry 3208 (class 0 OID 0)
-- Dependencies: 244
-- Name: PROCEDURE selectdepartment(INOUT dept_id integer, INOUT p_cursor refcursor); Type: ACL; Schema: adm; Owner: postgres
--

GRANT ALL ON PROCEDURE adm.selectdepartment(INOUT dept_id integer, INOUT p_cursor refcursor) TO adm_role;


--
-- TOC entry 3209 (class 0 OID 0)
-- Dependencies: 257
-- Name: PROCEDURE selecttrack(p_departmentid integer, INOUT p_cursor refcursor); Type: ACL; Schema: adm; Owner: postgres
--

GRANT ALL ON PROCEDURE adm.selecttrack(p_departmentid integer, INOUT p_cursor refcursor) TO adm_role;


--
-- TOC entry 3210 (class 0 OID 0)
-- Dependencies: 258
-- Name: PROCEDURE selecttrackbydeparmentid(INOUT dept_id integer, INOUT p_cursor refcursor); Type: ACL; Schema: adm; Owner: postgres
--

GRANT ALL ON PROCEDURE adm.selecttrackbydeparmentid(INOUT dept_id integer, INOUT p_cursor refcursor) TO adm_role;


--
-- TOC entry 3211 (class 0 OID 0)
-- Dependencies: 259
-- Name: PROCEDURE updatecourse(p_courseid integer, p_coursename text, p_mindegree integer, p_maxdegree integer); Type: ACL; Schema: adm; Owner: postgres
--

GRANT ALL ON PROCEDURE adm.updatecourse(p_courseid integer, p_coursename text, p_mindegree integer, p_maxdegree integer) TO adm_role;


--
-- TOC entry 3212 (class 0 OID 0)
-- Dependencies: 260
-- Name: PROCEDURE updatedepartment(p_dept_id integer, p_dept_name text, p_dept_loc text); Type: ACL; Schema: adm; Owner: postgres
--

GRANT ALL ON PROCEDURE adm.updatedepartment(p_dept_id integer, p_dept_name text, p_dept_loc text) TO adm_role;


--
-- TOC entry 3213 (class 0 OID 0)
-- Dependencies: 261
-- Name: PROCEDURE updateinstructor(instructor_id integer, new_name text, new_email text, new_departmentno integer); Type: ACL; Schema: adm; Owner: postgres
--

GRANT ALL ON PROCEDURE adm.updateinstructor(instructor_id integer, new_name text, new_email text, new_departmentno integer) TO adm_role;


--
-- TOC entry 3214 (class 0 OID 0)
-- Dependencies: 269
-- Name: PROCEDURE updatestudent(student_id integer, new_name text, new_email text, new_phone text); Type: ACL; Schema: adm; Owner: postgres
--

GRANT ALL ON PROCEDURE adm.updatestudent(student_id integer, new_name text, new_email text, new_phone text) TO adm_role;


--
-- TOC entry 3215 (class 0 OID 0)
-- Dependencies: 240
-- Name: PROCEDURE updatetrack(p_trackid integer, p_trackname text, p_departmentid integer); Type: ACL; Schema: adm; Owner: postgres
--

GRANT ALL ON PROCEDURE adm.updatetrack(p_trackid integer, p_trackname text, p_departmentid integer) TO adm_role;


--
-- TOC entry 3216 (class 0 OID 0)
-- Dependencies: 265
-- Name: PROCEDURE correctexam(p_studentexamid integer); Type: ACL; Schema: instructor; Owner: postgres
--

GRANT ALL ON PROCEDURE instructor.correctexam(p_studentexamid integer) TO instructor_role;
GRANT ALL ON PROCEDURE instructor.correctexam(p_studentexamid integer) TO adm_role;


--
-- TOC entry 3217 (class 0 OID 0)
-- Dependencies: 245
-- Name: PROCEDURE deletequestion(p_questionid integer); Type: ACL; Schema: instructor; Owner: postgres
--

GRANT ALL ON PROCEDURE instructor.deletequestion(p_questionid integer) TO instructor_role;
GRANT ALL ON PROCEDURE instructor.deletequestion(p_questionid integer) TO adm_role;


--
-- TOC entry 3218 (class 0 OID 0)
-- Dependencies: 267
-- Name: PROCEDURE generateexam(p_course_id integer, p_exam_name text, p_mcq_num integer, p_tf_num integer); Type: ACL; Schema: instructor; Owner: postgres
--

GRANT ALL ON PROCEDURE instructor.generateexam(p_course_id integer, p_exam_name text, p_mcq_num integer, p_tf_num integer) TO instructor_role;
GRANT ALL ON PROCEDURE instructor.generateexam(p_course_id integer, p_exam_name text, p_mcq_num integer, p_tf_num integer) TO adm_role;


--
-- TOC entry 3219 (class 0 OID 0)
-- Dependencies: 251
-- Name: PROCEDURE insertchoice(c_questionid integer, c_optiontext text, c_optionorder integer); Type: ACL; Schema: instructor; Owner: postgres
--

GRANT ALL ON PROCEDURE instructor.insertchoice(c_questionid integer, c_optiontext text, c_optionorder integer) TO instructor_role;
GRANT ALL ON PROCEDURE instructor.insertchoice(c_questionid integer, c_optiontext text, c_optionorder integer) TO adm_role;


--
-- TOC entry 3220 (class 0 OID 0)
-- Dependencies: 252
-- Name: PROCEDURE insertquestion(q_courseid integer, q_questiontext text, q_questiontype text, q_points integer); Type: ACL; Schema: instructor; Owner: postgres
--

GRANT ALL ON PROCEDURE instructor.insertquestion(q_courseid integer, q_questiontext text, q_questiontype text, q_points integer) TO instructor_role;
GRANT ALL ON PROCEDURE instructor.insertquestion(q_courseid integer, q_questiontext text, q_questiontype text, q_points integer) TO adm_role;


--
-- TOC entry 3221 (class 0 OID 0)
-- Dependencies: 263
-- Name: PROCEDURE report_instructorcourses(p_instructorid integer, INOUT p_cursor refcursor); Type: ACL; Schema: instructor; Owner: postgres
--

GRANT ALL ON PROCEDURE instructor.report_instructorcourses(p_instructorid integer, INOUT p_cursor refcursor) TO instructor_role;
GRANT ALL ON PROCEDURE instructor.report_instructorcourses(p_instructorid integer, INOUT p_cursor refcursor) TO adm_role;


--
-- TOC entry 3222 (class 0 OID 0)
-- Dependencies: 266
-- Name: PROCEDURE report_studentsbydepartment(p_departmentno integer, INOUT p_cursor refcursor); Type: ACL; Schema: instructor; Owner: postgres
--

GRANT ALL ON PROCEDURE instructor.report_studentsbydepartment(p_departmentno integer, INOUT p_cursor refcursor) TO instructor_role;
GRANT ALL ON PROCEDURE instructor.report_studentsbydepartment(p_departmentno integer, INOUT p_cursor refcursor) TO adm_role;


--
-- TOC entry 3223 (class 0 OID 0)
-- Dependencies: 271
-- Name: PROCEDURE updatechoice(c_optionid integer, c_optiontext text, c_optionorder integer); Type: ACL; Schema: instructor; Owner: postgres
--

GRANT ALL ON PROCEDURE instructor.updatechoice(c_optionid integer, c_optiontext text, c_optionorder integer) TO instructor_role;
GRANT ALL ON PROCEDURE instructor.updatechoice(c_optionid integer, c_optiontext text, c_optionorder integer) TO adm_role;


--
-- TOC entry 3224 (class 0 OID 0)
-- Dependencies: 255
-- Name: PROCEDURE updatequestion(q_courseid integer, q_questiontext text, q_questiontype text, q_points integer); Type: ACL; Schema: instructor; Owner: postgres
--

GRANT ALL ON PROCEDURE instructor.updatequestion(q_courseid integer, q_questiontext text, q_questiontype text, q_points integer) TO instructor_role;
GRANT ALL ON PROCEDURE instructor.updatequestion(q_courseid integer, q_questiontext text, q_questiontype text, q_points integer) TO adm_role;


--
-- TOC entry 3225 (class 0 OID 0)
-- Dependencies: 270
-- Name: PROCEDURE submitexamanswers(p_studentid integer, p_examid integer, p_starttime timestamp without time zone, p_endtime timestamp without time zone, p_answers jsonb); Type: ACL; Schema: student; Owner: postgres
--

GRANT ALL ON PROCEDURE student.submitexamanswers(p_studentid integer, p_examid integer, p_starttime timestamp without time zone, p_endtime timestamp without time zone, p_answers jsonb) TO adm_role;
GRANT ALL ON PROCEDURE student.submitexamanswers(p_studentid integer, p_examid integer, p_starttime timestamp without time zone, p_endtime timestamp without time zone, p_answers jsonb) TO student_role;


--
-- TOC entry 3226 (class 0 OID 0)
-- Dependencies: 219
-- Name: TABLE choice; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.choice TO adm_role;


--
-- TOC entry 3228 (class 0 OID 0)
-- Dependencies: 208
-- Name: TABLE course; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.course TO adm_role;


--
-- TOC entry 3230 (class 0 OID 0)
-- Dependencies: 204
-- Name: TABLE department; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.department TO adm_role;


--
-- TOC entry 3232 (class 0 OID 0)
-- Dependencies: 222
-- Name: TABLE exam; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.exam TO adm_role;


--
-- TOC entry 3234 (class 0 OID 0)
-- Dependencies: 223
-- Name: TABLE examquestion; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.examquestion TO adm_role;


--
-- TOC entry 3235 (class 0 OID 0)
-- Dependencies: 214
-- Name: TABLE instructor; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.instructor TO adm_role;


--
-- TOC entry 3236 (class 0 OID 0)
-- Dependencies: 215
-- Name: TABLE instructor_course; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.instructor_course TO adm_role;


--
-- TOC entry 3238 (class 0 OID 0)
-- Dependencies: 220
-- Name: TABLE modelanswer; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.modelanswer TO adm_role;


--
-- TOC entry 3239 (class 0 OID 0)
-- Dependencies: 217
-- Name: TABLE questions; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.questions TO adm_role;


--
-- TOC entry 3241 (class 0 OID 0)
-- Dependencies: 211
-- Name: TABLE student; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.student TO adm_role;


--
-- TOC entry 3243 (class 0 OID 0)
-- Dependencies: 212
-- Name: TABLE student_track; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.student_track TO adm_role;


--
-- TOC entry 3244 (class 0 OID 0)
-- Dependencies: 227
-- Name: TABLE studentanswer; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.studentanswer TO adm_role;


--
-- TOC entry 3246 (class 0 OID 0)
-- Dependencies: 225
-- Name: TABLE studentexam; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.studentexam TO adm_role;


--
-- TOC entry 3248 (class 0 OID 0)
-- Dependencies: 206
-- Name: TABLE track; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.track TO adm_role;


--
-- TOC entry 3249 (class 0 OID 0)
-- Dependencies: 209
-- Name: TABLE track_course; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.track_course TO adm_role;


-- Completed on 2026-04-12 22:00:22

--
-- PostgreSQL database dump complete
--

\unrestrict HoFuQESzYAiGTZdNOLB0mVzzW95ehaaxR6hCC08M88N7tXxwnQdxYJtHSda0fIV

