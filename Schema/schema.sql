 -- Department or tanta branch (Create if not exist)
CREATE TABLE IF NOT EXISTS  Department (

	DepartmentID SERIAL PRIMARY KEY,
	DepartementName TEXT NOT NULL ,
	DeptLocation   TEXT
);

 -- track Table (Create if not exist)
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

--Table Course (Create if not exist)
CREATE TABLE IF NOT EXISTS Course (
    CourseID   SERIAL PRIMARY KEY,
    CourseName TEXT NOT NULL,
    MinDegree  INT,
    MaxDegree  INT,
    CONSTRAINT course_degree_chk
        CHECK (
            (MinDegree IS NULL OR MaxDegree IS NULL)
            OR (MinDegree <= MaxDegree)
        )
);
---------------------------------------------------------

-- Track_Course (junction)
CREATE TABLE Track_Course (
	TrackID  INT NOT NULL ,
    CourseID INT NOT NULL,
    PRIMARY KEY (TrackID, CourseID) 	 
);

--foreign Key for TrackID
ALTER TABLE Track_Course 
ADD CONSTRAINT fk_track
FOREIGN KEY (TrackID) REFERENCES Track(TrackID) ON DELETE CASCADE;

-- Add Foreign key for CourseID
ALTER TABLE Track_Course 
ADD CONSTRAINT fk_course
FOREIGN KEY (CourseID) REFERENCES Course(CourseID) ON DELETE CASCADE;


--indexes for fk
-- Index for TrackID
CREATE INDEX idx_track_course_trackid ON Track_Course(TrackID);
-- Index for CourseID
CREATE INDEX idx_track_course_courseid ON Track_Course(CourseID);

--- Creating Students TableIF NOT EXISTS 
CREATE TABLE IF NOT EXISTS Student (
	StudentID SERIAL PRIMARY KEY,
	Name TEXT NOT NULL, 
	Email TEXT NOT NULL UNIQUE,
	Phone TEXT NOT NULL
);

--Create Student_Track  TableIF NOT EXISTS 
CREATE TABLE IF NOT EXISTS Student_Track (
    StudentID  INT,
    TrackID    INT,
    PRIMARY KEY (StudentID, TrackID),
	CONSTRAINT fk_studentTrack_student FOREIGN KEY (StudentID) REFERENCES Student(StudentID) ON DELETE CASCADE,
	CONSTRAINT fk_studentTrack_track FOREIGN KEY (TrackID) REFERENCES Track(TrackID) ON DELETE CASCADE
);
CREATE INDEX idx_studentTrack_track ON Student_Track(TrackID);
CREATE INDEX idx_studentTrack_student ON Student_Track(StudentID);

-- Create Instructor  TableIF NOT EXISTS 
CREATE TABLE IF NOT EXISTS Instructor (

	InstructorID SERIAL Primary KEY,
	Name Text Not NULL,
	Email Text Not NULL Unique,
	DepartmentNo Int ,
	CONSTRAINT fk_instructor_dept FOREIGN KEY (DepartmentNo) REFERENCES Department(DepartmentID) on delete set null
);

CREATE INDEX idx_instructor_department ON Instructor(DepartmentNo);

-- Create instructor _ course table IF NOT EXISTS . 
CREATE TABLE IF NOT EXISTS Instructor_Course (
    InstructorID  INT,
    CourseID      INT,
    PRIMARY KEY (InstructorID, CourseID),
	CONSTRAINT fk_instructorCourse_instructor FOREIGN KEY (InstructorID) REFERENCES Instructor(InstructorID) ON DELETE CASCADE,
	CONSTRAINT fk_instructorCourse_course FOREIGN KEY (CourseID) REFERENCES Course(CourseID) ON DELETE CASCADE
);
CREATE INDEX idx_instructorCourse_course ON Instructor_Course(CourseID);
CREATE INDEX idx_instructorCourse_Instructor ON Instructor_Course(InstructorID);

--Create Questions Table IF NOT EXISTS 
CREATE TABLE IF NOT EXISTS Questions(
    
    QuestionID SERIAL PRIMARY KEY,
    CourseID INT NOT NULL,
    QuestionText TEXT NOT NULL,
    QuestionType TEXT CHECK (QuestionType IN ('MCQ', 'TF')),
    Points INT NOT NULL,

    CONSTRAINT fk_course FOREIGN KEY (CourseID) REFERENCES Course(CourseID)

);
CREATE INDEX question_course_idx ON Questions(CourseID);

--Create choice table if not exist.
CREATE TABLE IF NOT EXISTS Choice(

    OptionID SERIAL PRIMARY KEY,
    QuestionID INT NOT NULL,
    OptionText TEXT NOT NULL,
    OptionOrder INT NOT NULL,

    CONSTRAINT fk_question FOREIGN KEY (QuestionID) REFERENCES Questions(QuestionID) on delete CASCADE

);
CREATE INDEX question_option_idx ON Choice(QuestionID);
--Create Model answer table if not exist. 
CREATE TABLE IF NOT EXISTS ModelAnswer(

    QuestionID INT UNIQUE NOT NULL,
    CorrectOptionID INT NOT NULL,

    CONSTRAINT fk_question FOREIGN KEY (QuestionID) REFERENCES Questions(QuestionID) on delete CASCADE,
    CONSTRAINT fk_option FOREIGN KEY (CorrectOptionID) REFERENCES Choice(OptionID) on delete CASCADE
);
CREATE INDEX ModelAnswer_idx ON ModelAnswer(QuestionID);
--Exam table creation
CREATE TABLE Exam (
ExamID SERIAL PRIMARY KEY,
ExamName TEXT NOT NULL,
CourseID INT NOT NULL , 
CreatedDate TIMESTAMP DEFAULT NOW(),
TotalQuestions INT NOT NULL,
CHECK (TotalQuestions > 0)
);
-------------------------------------------------------------
--Add Foreign key constraint
ALTER TABLE Exam ADD CONSTRAINT course_exam_fk FOREIGN KEY (CourseID) REFERENCES Course(CourseID) ON DELETE CASCADE; 
-------------------------------------------------------------
--Create index for foreign key column
CREATE INDEX course_exam_idx ON Exam(CourseID);


--ExamQuestion table creation
CREATE TABLE ExamQuestion (
ExamID INT NOT NULL,      
QuestionID INT NOT NULL,  
OrderNo INT NOT NULL,
PRIMARY KEY (ExamID, QuestionID)
);
-------------------------------------------------------------
--Add Foreign key constraint
ALTER TABLE ExamQuestion ADD CONSTRAINT eq_exam_fk FOREIGN KEY (ExamID) REFERENCES Exam(ExamID) ON DELETE CASCADE; 
ALTER TABLE ExamQuestion ADD CONSTRAINT eq_question_fk FOREIGN KEY (QuestionID) REFERENCES Questions(QuestionID) ON DELETE CASCADE;
-------------------------------------------------------------
--Create index for foreign key column
CREATE INDEX eq_question_idx ON ExamQuestion(QuestionID);

--StudentExam table creation
CREATE TABLE StudentExam (
StudentExamID SERIAL PRIMARY KEY,
StudentID INT NOT NULL, 
ExamID INT NOT NULL,    
StartTime TIMESTAMP DEFAULT NOW(),
EndTime TIMESTAMP,
TotalGrade INT DEFAULT 0
);
-------------------------------------------------------------
--Add Foreign key constraint
ALTER TABLE StudentExam ADD CONSTRAINT se_exam_fk FOREIGN KEY (ExamID) REFERENCES Exam(ExamID) ON DELETE CASCADE; 
ALTER TABLE StudentExam ADD CONSTRAINT se_student_fk FOREIGN KEY (StudentID) REFERENCES Student(StudentID) ON DELETE CASCADE;
-------------------------------------------------------------
--Create index for foreign key column
CREATE INDEX se_student_idx ON StudentExam(StudentID);
CREATE INDEX se_exam_idx ON StudentExam(ExamID);

--StudentAnswer table creation
CREATE TABLE StudentAnswer (
StudentAnswerID SERIAL PRIMARY KEY,
StudentExamID INT NOT NULL, --FK
QuestionID INT NOT NULL,    --FK
ChosenOptionID INT NOT NULL --FK
);
-------------------------------------------------------------
--Add Foreign key constraint
ALTER TABLE StudentAnswer ADD CONSTRAINT sa_exam_fk FOREIGN KEY (StudentExamID) REFERENCES StudentExam(StudentExamID) ON DELETE CASCADE; 
ALTER TABLE StudentAnswer ADD CONSTRAINT sa_question_fk FOREIGN KEY (QuestionID) REFERENCES Questions(QuestionID) ON DELETE CASCADE;
ALTER TABLE StudentAnswer ADD CONSTRAINT sa_option_fk FOREIGN KEY (ChosenOptionID) REFERENCES Choice(OptionID) ON DELETE CASCADE;
-------------------------------------------------------------
--Create index for foreign key column
CREATE INDEX sa_exam_idx ON StudentAnswer(StudentExamID);
CREATE INDEX sa_question_idx ON StudentAnswer(QuestionID);
CREATE INDEX sa_option_idx ON StudentAnswer(ChosenOptionID);

 

begin;
SAVEPOINT schema_withoutanydata;
commit;

begin;
-- Create the schemas (adm, instrcutor, student)
--save point here

SAVEPOINT mini_schema_before;
create schema adm;
create schema instructor;
create schema student;

SAVEPOINT mini_schema_after;

SAVEPOINT create_roles_before;

create role adm_role;
create role instructor_role;
create role student_role;

SAVEPOINT create_roles_after;
SAVEPOINT assign_schema_to_roleBefore;

grant usage on schema student to student_role;
grant usage on schema instructor to instructor_role;
grant usage on schema adm to adm_role;
SAVEPOINT assign_schema_to_roleafter;
SAVEPOINT assign_Privileges_before;

grant all PRIVILEGES on all tables in schema public to adm_role;
revoke all privileges on all tables in schema public from student_role;
revoke all privileges on all tables in schema public from instructor_role;

Create USER amal WITH PASSWORD '123';


Create USER yamen WITH PASSWORD '123';


Create USER nada WITH PASSWORD '123';


Grant adm_role to amal;


Grant instructor_role to yamen;


Grant student_role to nada;


/* 


we will do this for all the procedures after creating them and choose which schema should the procedure be and the role that can execute it 


then we will add   


SECURITY DEFINER


SET search_path=public


after language plpgsql to make the procedure execute without select option to the role. 


so the roles now can execute the procedure and cannot use select or any view or any direct access to tgihe tables .


GRANT EXECUTE ON PROCEDURE instructor.updatechoice(integer, text, integer) TO instructor_role;





GRANT EXECUTE ON PROCEDURE instructor.updatechoice(integer, text, integer) TO adm_role;


--After loading all PROCEDURES


--





*/

SAVEPOINT assign_Prigit pullvileges_after;



commit;
