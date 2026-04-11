-- Track_Course (junction)
CREATE TABLE Track_Course (
	TrackID  INT NOT NULL --fk,
    CourseID INT NOT NULL --FK,
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