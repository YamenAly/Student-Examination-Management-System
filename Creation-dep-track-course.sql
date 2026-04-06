 
 	 	 
		





-- • Department/Branch (DepartmentID, DepartmentName TEXT, Location TEXT)
CREATE TABLE Department (

	DepartmentID  INT PRIMARY KEY,
	DepartementName TEXT NOT NULL ,
	DeptLocation   TEXT
);

------------------------------------------------------------------------
-- • Track (TrackID, TrackName TEXT, DepartmentID FK)
CREATE TABLE Track (
	TrackID  INT PRIMARY KEY ,
	TrackName TEXT NOT NULL,
	DepartmentID INT ,

	CONSTRAINT fk_depid FOREIGN KEY (DepartmentID ) REFERENCES Department(DepartmentID)
	
);

------------------------------------------------------------------------------------
-- • Course (CourseID, CourseName TEXT, MinDegree INT, MaxDegree INT)
CREATE TABLE Course(
	CourseID  INT PRIMARY KEY,
	CourseName TEXT,
	MinDegree INT,
	MaxDegree INT
	
);

------------------------------------------------------------------------------------------

-- • Track_Course (junction)
CREATE TABLE Track_Course (
	TrackID  INT,
    CourseID INT,

	
    PRIMARY KEY (TrackID, CourseID),         -- Composite Primary Key
    FOREIGN KEY (TrackID)  REFERENCES Track(TrackID),
    FOREIGN KEY (CourseID) REFERENCES Course(CourseID)
	

);
