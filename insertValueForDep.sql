-- 1. Department
INSERT INTO Department VALUES
(1, 'Web Development',    'Cairo'),
(2, 'Data Engineering',   'Alexandria'),
(3, 'Cyber Security',     'Giza'),
(4, 'Mobile Development', 'Cairo'),
(5, 'Cloud Computing',    'Alexandria');

------------------------------------------------------------------------

-- 2. Track
INSERT INTO Track VALUES
(1,  'Frontend Development', 1),
(2,  'Backend Development',  1),
(3,  'Data Analysis',        2),
(4,  'Machine Learning',     2),
(5,  'Network Security',     3),
(6,  'Ethical Hacking',      3),
(7,  'Android Development',  4),
(8,  'IOS Development',      4),
(9,  'AWS Cloud',            5),
(10, 'DevOps',               5);

------------------------------------------------------------------------

-- 3. Course
INSERT INTO Course VALUES
(1,  'HTML & CSS',            50, 100),
(2,  'JavaScript',            50, 100),
(3,  'Python Basics',         50, 100),
(4,  'SQL & Databases',       50, 100),
(5,  'Linux Fundamentals',    50, 100),
(6,  'Network Basics',        50, 100),
(7,  'Kotlin Basics',         50, 100),
(8,  'Swift Basics',          50, 100),
(9,  'Flutter & Dart',        50, 100),
(10, 'Cloud Fundamentals',    50, 100),
(11, 'Docker & Kubernetes',   50, 100),
(12, 'CI/CD Pipelines',       50, 100);

------------------------------------------------------------------------

-- 4. Track_Course (junction)
INSERT INTO Track_Course VALUES
-- Web Development
(1, 1),   -- Frontend  -> HTML & CSS
(1, 2),   -- Frontend  -> JavaScript
(2, 2),   -- Backend   -> JavaScript
(2, 3),   -- Backend   -> Python Basics
(2, 4),   -- Backend   -> SQL & Databases
-- Data Engineering
(3, 3),   -- Data Analysis   -> Python Basics
(3, 4),   -- Data Analysis   -> SQL & Databases
(4, 3),   -- Machine Learning -> Python Basics
-- Cyber Security
(5, 5),   -- Network Security -> Linux Fundamentals
(5, 6),   -- Network Security -> Network Basics
(6, 5),   -- Ethical Hacking  -> Linux Fundamentals
(6, 6),   -- Ethical Hacking  -> Network Basics
-- Mobile Development
(7, 7),   -- Android -> Kotlin Basics
(7, 9),   -- Android -> Flutter & Dart
(8, 8),   -- IOS     -> Swift Basics
(8, 9),   -- IOS     -> Flutter & Dart
-- Cloud Computing
(9,  10), -- AWS Cloud -> Cloud Fundamentals
(9,  11), -- AWS Cloud -> Docker & Kubernetes
(10, 11), -- DevOps    -> Docker & Kubernetes
(10, 12); -- DevOps    -> CI/CD Pipelines