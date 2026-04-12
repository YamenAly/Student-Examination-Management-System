--Create an insert Student To track Procdeure
CREATE OR REPLACE PROCEDURE AssignStudentToTrack
(
	IN new_StudentID INT,
	IN new_TrackID INT
)
LANGUAGE plpgsql
AS $$
    BEGIN
		INSERT INTO Student_Track (StudentID,TrackID) VALUES (new_StudentID,new_TrackID);
		EXCEPTION
			WHEN foreign_key_violation THEN
				RAISE EXCEPTION 'StudentID or TrackID invalid';

    END;
$$;


-- Student_Track: 2 students per track (tracks 1-10)
BEGIN;
SAVEPOINT before_assignstudentstotrack;
Call AssignStudentToTrack(1,1);  -- Amal   -> Frontend Development
Call AssignStudentToTrack(2,2);  -- Nada   -> Backend Development
Call AssignStudentToTrack(3,3);  -- Mariam -> Data Analysis
Call AssignStudentToTrack(4,4);  -- Reem   -> Machine Learning
Call AssignStudentToTrack(5,5);  -- Fatma  -> Network Security
Call AssignStudentToTrack(6,6);  -- Eman   -> Ethical Hacking
Call AssignStudentToTrack(7,7);  -- Mona   -> Android Development
Call AssignStudentToTrack(8,8);  -- Noha   -> IOS Development
Call AssignStudentToTrack(9,9);  -- Narmeen-> AWS Cloud
Call AssignStudentToTrack(10,10); -- Nasreen-> DevOps
Call AssignStudentToTrack(11,1);  -- Ahmed  -> Frontend Development
Call AssignStudentToTrack(12,2);  -- Mohamed-> Backend Development
Call AssignStudentToTrack(13,3);  -- Omar   -> Data Analysis
Call AssignStudentToTrack(14,4);  -- Ali    -> Machine Learning
Call AssignStudentToTrack(15,5);  -- Osama  -> Network Security
Call AssignStudentToTrack(16,6);  -- Mostafa-> Ethical Hacking
Call AssignStudentToTrack(17,7);  -- Yamen  -> Android Development
Call AssignStudentToTrack(18,8);  -- Alaa   -> IOS Development
Call AssignStudentToTrack(19,9);  -- Kareem -> AWS Cloud
Call AssignStudentToTrack(20,10); -- Mahmoud-> DevOps
SAVEPOINT after_assignstudentstotrack;

commit;
