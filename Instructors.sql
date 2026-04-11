-- Insert instructor procedure 
CREATE OR REPLACE PROCEDURE InsertInstructor
(
	IN new_Name TEXT,
	IN new_Email TEXT,
	IN new_DepartmentNo INT
)
LANGUAGE plpgsql
AS $$
 BEGIN
		if new_Email Is not null and  new_Email !~ '^[A-z0-9._-]+@[A-z0-9.-]+\.[A-z]{2,}$' THEN
			RAISE EXCEPTION "Invalid Email format";
		end if;
	
		INSERT INTO Instructor (Name,Email,DepartmentNo) VALUES (new_Name,new_Email,new_DepartmentNo);

		EXCEPTION
			WHEN foreign_key_violation THEN
				RAISE EXCEPTION'Department number invalid';
	END;
$$;


CREATE OR REPLACE PROCEDURE DeleteInstructor
(
	IN Instructor_id INT
)
LANGUAGE plpgsql
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


CREATE OR REPLACE PROCEDURE UpdateInstructor
(
    instructor_id INT,
    new_name TEXT,
    new_email TEXT,
    new_DepartmentNo int
)
LANGUAGE plpgsql
AS $$
    BEGIN

	-- validation the email address regex . 
	if new_Email Is not null and  new_Email !~ '^[A-z0-9._-]+@[A-z0-9.-]+\.[A-z]{2,}$' THEN
		RAISE EXCEPTION "Invalid Email format";
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
$$;


BEGIN;
SAVEPOINT before_InsertInstructors;

Call InsertInstructor('Ahmed Mohamed','ahmed.mohamed@gmail.com',1);
Call InsertInstructor('Omar Ali','omar.ali@gmail.com',1);
Call InsertInstructor('Mostafa Yamen','mostafa.yamen@gmail.com',1);
Call InsertInstructor('Alaa Kareem','alaa.kareem@gmail.com',2);
Call InsertInstructor('Wael Nasef','wael.nasef@gmail.com',2);
Call InsertInstructor('Mahmoud Qasim','mahmoud.qasim@gmail.com',2);
Call InsertInstructor('Zakria Bahaa','zakria.bahaa@gmail.com',3);
Call InsertInstructor('Shady Shakr','shady.shakr@gmail.com',3);
Call InsertInstructor('Shawgy Osama','shawgy.osama@gmail.com',3);
Call InsertInstructor('Mohamed Omar','mohamed.omar47@gmail.com',4);
Call InsertInstructor('Ali Ahmed','ali.ahmed83@gmail.com',4);
Call InsertInstructor('Yamen Mostafa','yamen.mostafa@gmail.com',4);
Call InsertInstructor('Kareem Wael','kareem.wael@gmail.com',5);
Call InsertInstructor('Nasef Mahmoud','nasef.mahmoud@gmail.com',5);
Call InsertInstructor('Qasim Zakria','qasim.zakria@gmail.com',5);
Call InsertInstructor('Bahaa Shady','bahaa.shady@gmail.com',1);
Call InsertInstructor('Osama Alaa','osama.alaa91@gmail.com',2);
Call InsertInstructor('Mostafa Kareem','mostafa.kareem55@gmail.com',3);
SAVEPOINT after_InsertInstructors;

Commit;
