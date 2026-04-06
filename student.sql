CREATE TABLE IF NOT EXISTS Student (
    StudentID  SERIAL  PRIMARY KEY,
    Name       TEXT    NOT NULL,
    Email      TEXT    NOT NULL UNIQUE,
    Phone      TEXT
);


INSERT INTO Student (Name, Email, Phone) VALUES
('Amal Mohamed',    'amal.mohamed@gmail.com',     '+01012345678'),
('Nada Omar',       'nada.omar@gmail.com',         '+01112345679'),
('Mariam Ali',      'mariam.ali@gmail.com',         '+01212345670'),
('Reem Osama',      'reem.osama@gmail.com',         '+01512345671'),
('Fatma Mostafa',   'fatma.mostafa@gmail.com',      '+01012345672'),
('Eman Yamen',      'eman.yamen@gmail.com',          '+01112345673'),
('Mona Alaa',       'mona.alaa@gmail.com',           '+01212345674'),
('Noha Kareem',     'noha.kareem@gmail.com',         '+01512345675'),
('Narmeen Wael',    'narmeen.wael@gmail.com',        '+01012345676'),
('Nasreen Nasef',   'nasreen.nasef@gmail.com',       '+01112345677'),
('Ahmed Mahmoud',   'ahmed.mahmoud22@gmail.com',     '+01212345680'),
('Mohamed Qasim',   'mohamed.qasim@gmail.com',       '+01512345681'),
('Omar Zakria',     'omar.zakria@gmail.com',          '+01012345682'),
('Ali Bahaa',       'ali.bahaa@gmail.com',            '+01112345683'),
('Osama Shady',     'osama.shady@gmail.com',          '+01212345684'),
('Mostafa Shakr',   'mostafa.shakr@gmail.com',        '+01512345685'),
('Yamen Shawgy',    'yamen.shawgy@gmail.com',         '+01012345686'),
('Alaa Wael',       'alaa.wael77@gmail.com',          '+01112345687'),
('Kareem Ahmed',    'kareem.ahmed@gmail.com',         '+01212345688'),
('Mahmoud Omar',    'mahmoud.omar@gmail.com',         '+01512345689');
