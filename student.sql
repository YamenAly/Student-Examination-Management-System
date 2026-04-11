-- Insert student procedure
CREATE OR REPLACE PROCEDURE InsertStudent
(
	IN new_Name TEXT,
	IN new_Email TEXT ,
	IN new_Phone TEXT
)
LANGUAGE plpgsql
AS $$
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
$$;

-- Delete student procedure
CREATE OR REPLACE PROCEDURE DeleteStudent
(
	IN student_id INT
)
LANGUAGE plpgsql
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


CREATE OR REPLACE PROCEDURE UpdateStudent
(
    student_id INT,
    new_name TEXT,
    new_email TEXT,
    new_phone TEXT
)
LANGUAGE plpgsql
AS $$
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
$$;


--Insert Random 20 student into the database 0 to make the serial key work . 
BEGIN;
SAVEPOINT before_insertStudents;

Call InsertStudent('Amal Mohamed','amal.mohamed@gmail.com','+201012345678');
Call InsertStudent('Nada Omar','nada.omar@gmail.com','+201112345679');
Call InsertStudent('Mariam Ali','mariam.ali@gmail.com','+201212345670');
Call InsertStudent('Reem Osama','reem.osama@gmail.com','+201512345671');
Call InsertStudent('Fatma Mostafa','fatma.mostafa@gmail.com','+201012345672');
Call InsertStudent('Eman Yamen','eman.yamen@gmail.com','+201112345673');
Call InsertStudent('Mona Alaa','mona.alaa@gmail.com','+201212345674');
Call InsertStudent('Noha Kareem','noha.kareem@gmail.com','+201512345675');
Call InsertStudent('Narmeen Wael','narmeen.wael@gmail.com','+201012345676');
Call InsertStudent('Nasreen Nasef','nasreen.nasef@gmail.com','+201112345677');
Call InsertStudent('Ahmed Mahmoud','ahmed.mahmoud22@gmail.com','+201212345680');
Call InsertStudent('Mohamed Qasim','mohamed.qasim@gmail.com','+201512345681');
Call InsertStudent('Omar Zakria','omar.zakria@gmail.com','+201012345682');
Call InsertStudent('Ali Bahaa','ali.bahaa@gmail.com','+201112345683');
Call InsertStudent('Osama Shady','osama.shady@gmail.com','+201212345684');
Call InsertStudent('Mostafa Shakr','mostafa.shakr@gmail.com','+201512345685');
Call InsertStudent('Yamen Shawgy','yamen.shawgy@gmail.com','+201012345686');
Call InsertStudent('Alaa Wael','alaa.wael77@gmail.com','+201112345687');
Call InsertStudent('Kareem Ahmed','kareem.ahmed@gmail.com','+201212345688');
Call InsertStudent('Mahmoud Omar','mahmoud.omar@gmail.com','+201512345689');
SAVEPOINT after_insertStudents;
commit;
