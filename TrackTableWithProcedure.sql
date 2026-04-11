--  Track (TrackID, TrackName TEXT, DepartmentID FK)
CREATE TABLE Track (
	TrackID  SERIAL PRIMARY KEY ,
	TrackName TEXT NOT NULL,
	DepartmentID INT not null	
);


Alter table Track
 add CONSTRAINT fk_depid 
 FOREIGN KEY (DepartmentID )
 REFERENCES Department(DepartmentID) 
 ON DELETE CASCADE;

CREATE INDEX idx_track_departmentid ON Track(DepartmentID);

-- #####################################################################################################################

-- this procedure use to insert values in track table insted of direct insertiontion in table we insert trackname and departement id as trackid is serail pk
-- so it will be auto increment and we don't need to add it 
-- the logic of the procedure : 1.check if track name is emoty or null so it will not add it 2.if departementid already exists  else it will raisr notice that the row have been added sussefully


 CREATE or REPLACE procedure insert_Track 
(
	 in p_TrackName TEXT ,
	 in p_DepartmentID INT 
)
language plpgsql
as $$
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
		INSERT INTO Track(TrackName, DepartmentID)
        VALUES (p_TrackName, p_DepartmentID);

		raise notice 'track inserted successfully. TrackID: %', TrackID;

	END IF ;

end ;
$$;


CALL insert_Track('Frontend Development',1);
CALL insert_Track('Backend Development', 1);
CALL insert_Track('Data Analysis',2);
CALL insert_Track('Machine Learning',2);
CALL insert_Track('Network Security',3);
CALL insert_Track('Ethical Hacking',3);
CALL insert_Track('Android Development',4);
CALL insert_Track('IOS Development',4);
CALL insert_Track('AWS Cloud',5);
CALL insert_Track('DevOps', 5);





-- ###############################################################################################3


-- create updatetrack procedure
-- it's same as the body of insert procedure execpt addtional condition (exception) that checks the existance of trackid 
-- if there is no excption we update track by set (keyword) we assign p_trackname to track name and p_depatementid to departementid when the trackid equal to p_trackid

CREATE OR REPLACE PROCEDURE UpdateTrack
( 
    IN p_TrackID 	INT,
    IN p_TrackName  TEXT,
    IN p_DepartmentID INT
)
LANGUAGE plpgsql 
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


 CALL UpdateTrack(1, 'Full Stack Development', 1);


-- #################################################################################################


-- CRATE DELETE TRACK PROCEDURE
-- this prodcedure depent on only trackid if it exists it will delete it else it will raise exception


CREATE OR REPLACE PROCEDURE DeleteTrack
(
	IN p_TrackID INT
)
LANGUAGE plpgsql
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

CALL DeleteTrack(1);

-- ################################################################################################



-- create select prodecure with inout parameter  
-- there are three types of parameter in procedure :-in - out - inout
-- here we can't use in parapeter as it only send value and can't recive and also we can not use out parameter as it only recive so we use here inout parameter as we need to send and recive
-- first  it checks the track id whether it exists ir not then it select from track table the vlue and return it
-- we use recurser with fitch to return all row that matches not only the first row




CREATE OR REPLACE PROCEDURE SelectTrack
(
IN p_DepartmentID INT,
INOUT p_Cursor REFCURSOR DEFAULT 'cur_Track'
)
LANGUAGE plpgsql
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


BEGIN;
    CALL SelectTrack(3);
    FETCH ALL FROM cur_Track;
END;



--##########################