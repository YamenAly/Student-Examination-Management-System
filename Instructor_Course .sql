--Create an assign Instrcutor To course Procdeure
CREATE OR REPLACE PROCEDURE AssignInstructorToCourse
(
	IN new_InstructorID INT,
	IN new_CourseID INT 
)
LANGUAGE plpgsql
AS $$
    BEGIN
		INSERT INTO Instructor_Course (InstructorID,CourseID) VALUES (new_InstructorID,new_CourseID);
	
		EXCEPTION
			WHEN foreign_key_violation THEN
				RAISE EXCEPTION 'Invalid InstructorID or CourseID';

    END;
$$;
BEGIN;
SAVEPOINT before_AssignInstructortoCourse;
CALL AssignInstructorToCourse (1,1);
CALL AssignInstructorToCourse (1,2);
CALL AssignInstructorToCourse (2,2);
CALL AssignInstructorToCourse (2,3);
CALL AssignInstructorToCourse (3,1); 
CALL AssignInstructorToCourse (3,4);
CALL AssignInstructorToCourse (16,9); 
CALL AssignInstructorToCourse (16,2);

CALL AssignInstructorToCourse (4,3); 
CALL AssignInstructorToCourse (4,4);
CALL AssignInstructorToCourse (5,4); 
CALL AssignInstructorToCourse (5,5);
CALL AssignInstructorToCourse (6,3); 
CALL AssignInstructorToCourse (6,5);
CALL AssignInstructorToCourse (17,4); 
CALL AssignInstructorToCourse (17,3);

CALL AssignInstructorToCourse (7,5); 
CALL AssignInstructorToCourse (7,6);
CALL AssignInstructorToCourse (8,5); 
CALL AssignInstructorToCourse (8,6);
CALL AssignInstructorToCourse (9,6); 
CALL AssignInstructorToCourse (9,5);
CALL AssignInstructorToCourse (18,6); 
CALL AssignInstructorToCourse (18,5);

CALL AssignInstructorToCourse (10,7); 
CALL AssignInstructorToCourse (10,9);
CALL AssignInstructorToCourse (11,8); 
CALL AssignInstructorToCourse (11,9);
CALL AssignInstructorToCourse (12,7); 
CALL AssignInstructorToCourse (12,8);

CALL AssignInstructorToCourse (13,10); 
CALL AssignInstructorToCourse (13,11);
CALL AssignInstructorToCourse (14,11); 
CALL AssignInstructorToCourse (14,12);
CALL AssignInstructorToCourse (15,10); 
CALL AssignInstructorToCourse (15,12);
SAVEPOINT after_AssignInstructortoCourse;
commit;
