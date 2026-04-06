CREATE TABLE IF NOT EXISTS Instructor (
    InstructorID  SERIAL  PRIMARY KEY,
    Name          TEXT    NOT NULL,
    Email         TEXT    NOT NULL UNIQUE,
    DepartmentNo  INT     -- FK -> Department(DepartmentID),
);


INSERT INTO Instructor (Name, Email, DepartmentNo) VALUES
-- Dept 1: Web Development
('Ahmed Mohamed',   'ahmed.mohamed@gmail.com',      1),
('Omar Ali',        'omar.ali@gmail.com',            1),
('Mostafa Yamen',   'mostafa.yamen@gmail.com',       1),
-- Dept 2: Data Engineering
('Alaa Kareem',     'alaa.kareem@gmail.com',         2),
('Wael Nasef',      'wael.nasef@gmail.com',           2),
('Mahmoud Qasim',   'mahmoud.qasim@gmail.com',        2),
-- Dept 3: Cyber Security
('Zakria Bahaa',    'zakria.bahaa@gmail.com',         3),
('Shady Shakr',     'shady.shakr@gmail.com',          3),
('Shawgy Osama',    'shawgy.osama@gmail.com',         3),
-- Dept 4: Mobile Development
('Mohamed Omar',    'mohamed.omar47@gmail.com',       4),
('Ali Ahmed',       'ali.ahmed83@gmail.com',          4),
('Yamen Mostafa',   'yamen.mostafa@gmail.com',        4),
-- Dept 5: Cloud Computing
('Kareem Wael',     'kareem.wael@gmail.com',          5),
('Nasef Mahmoud',   'nasef.mahmoud@gmail.com',        5),
('Qasim Zakria',    'qasim.zakria@gmail.com',         5),
-- Extra 3 (depts 1-3)
('Bahaa Shady',     'bahaa.shady@gmail.com',          1),
('Osama Alaa',      'osama.alaa91@gmail.com',         2),
('Mostafa Kareem',  'mostafa.kareem55@gmail.com',     3);

-- ALTER TABLE Instructor
    -- ADD CONSTRAINT fk_instructor_dept
    -- FOREIGN KEY (DepartmentNo) REFERENCES Department(DepartmentID);
