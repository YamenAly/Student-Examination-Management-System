
INSERT INTO Questions (QuestionID, CourseID, QuestionText, QuestionType, Points) VALUES

-- -------------------------
-- Course 1: HTML & CSS (1–8)
-- -------------------------
(1,  1, 'Which HTML tag is used to define an internal style sheet?',         'MCQ', 10),
(2,  1, 'Which CSS property controls the text size?',                         'MCQ', 10),
(3,  1, 'What does the "C" in CSS stand for?',                                'MCQ', 10),
(4,  1, 'Which HTML attribute is used to define inline styles?',              'MCQ', 10),
(5,  1, 'Which CSS property is used to change the background color?',         'MCQ', 10),
(6,  1, 'HTML stands for HyperText Markup Language.',                         'TF',  10),
(7,  1, 'The <div> tag is an inline element.',                                'TF',  10),
(8,  1, 'CSS Flexbox is used for one-dimensional layout.',                    'TF',  10),

-- -------------------------
-- Course 2: JavaScript (9–16)
-- -------------------------
(9,  2, 'Which keyword is used to declare a constant in JavaScript?',         'MCQ', 10),
(10, 2, 'Which method is used to add an element to the end of an array?',     'MCQ', 10),
(11, 2, 'What does "===" check in JavaScript?',                               'MCQ', 10),
(12, 2, 'Which function parses a string and returns an integer?',             'MCQ', 10),
(13, 2, 'What is the output of typeof null in JavaScript?',                   'MCQ', 10),
(14, 2, 'JavaScript is a statically typed language.',                         'TF',  10),
(15, 2, 'Arrow functions have their own "this" binding.',                     'TF',  10),
(16, 2, 'The "let" keyword has block scope in JavaScript.',                   'TF',  10),

-- -------------------------
-- Course 3: Python Basics (17–24)
-- -------------------------
(17, 3, 'Which keyword is used to define a function in Python?',              'MCQ', 10),
(18, 3, 'What data type is the result of: type(3 / 2) in Python 3?',          'MCQ', 10),
(19, 3, 'Which of the following is a mutable data type in Python?',           'MCQ', 10),
(20, 3, 'How do you start a comment in Python?',                              'MCQ', 10),
(21, 3, 'What is the output of len("hello")?',                                'MCQ', 10),
(22, 3, 'Python uses curly braces {} to define code blocks.',                 'TF',  10),
(23, 3, 'Python lists can contain elements of different data types.',         'TF',  10),
(24, 3, 'The range() function in Python returns a list.',                     'TF',  10),

-- -------------------------
-- Course 4: SQL & Databases (25–32)
-- -------------------------
(25, 4, 'Which SQL statement is used to retrieve data?',                      'MCQ', 10),
(26, 4, 'Which clause filters the results of a SELECT query?',                'MCQ', 10),
(27, 4, 'Which JOIN returns all rows from both tables?',                      'MCQ', 10),
(28, 4, 'Which SQL function returns the number of rows?',                     'MCQ', 10),
(29, 4, 'Which command removes all rows from a table without logging?',       'MCQ', 10),
(30, 4, 'A PRIMARY KEY can contain NULL values.',                             'TF',  10),
(31, 4, 'The HAVING clause is used to filter groups in a GROUP BY query.',    'TF',  10),
(32, 4, 'An INNER JOIN returns rows with no match in either table.',          'TF',  10),

-- -------------------------
-- Course 5: Linux Fundamentals (33–40)
-- -------------------------
(33, 5, 'Which command lists files in a directory in Linux?',                 'MCQ', 10),
(34, 5, 'Which command changes file permissions in Linux?',                   'MCQ', 10),
(35, 5, 'What does the "pwd" command do?',                                    'MCQ', 10),
(36, 5, 'Which command is used to search text patterns in files?',            'MCQ', 10),
(37, 5, 'Which symbol represents the root directory in Linux?',               'MCQ', 10),
(38, 5, 'The "sudo" command gives superuser privileges.',                     'TF',  10),
(39, 5, 'In Linux, file names are case-insensitive.',                         'TF',  10),
(40, 5, 'The "rm -rf" command recursively deletes files and directories.',    'TF',  10),

-- -------------------------
-- Course 6: Network Basics (41–48)
-- -------------------------
(41, 6, 'What does IP stand for?',                                            'MCQ', 10),
(42, 6, 'Which protocol is used to send email?',                              'MCQ', 10),
(43, 6, 'What is the default port for HTTPS?',                                'MCQ', 10),
(44, 6, 'Which device connects multiple networks together?',                  'MCQ', 10),
(45, 6, 'What does DNS stand for?',                                           'MCQ', 10),
(46, 6, 'TCP is a connection-oriented protocol.',                             'TF',  10),
(47, 6, 'A MAC address is a logical address assigned by software.',           'TF',  10),
(48, 6, 'IPv4 addresses are 128 bits long.',                                  'TF',  10),

-- -------------------------
-- Course 7: Kotlin Basics (49–56)
-- -------------------------
(49, 7, 'Which keyword declares a nullable variable in Kotlin?',              'MCQ', 10),
(50, 7, 'What is the entry point of a Kotlin program?',                       'MCQ', 10),
(51, 7, 'Which keyword is used to define an immutable variable in Kotlin?',   'MCQ', 10),
(52, 7, 'What symbol is used for string templates in Kotlin?',                'MCQ', 10),
(53, 7, 'Which Kotlin collection does NOT allow duplicate elements?',         'MCQ', 10),
(54, 7, 'Kotlin is fully interoperable with Java.',                           'TF',  10),
(55, 7, 'In Kotlin, variables declared with "var" are immutable.',            'TF',  10),
(56, 7, 'Kotlin supports null safety by default.',                            'TF',  10),

-- -------------------------
-- Course 8: Swift Basics (57–64)
-- -------------------------
(57, 8, 'Which keyword declares a constant in Swift?',                        'MCQ', 10),
(58, 8, 'What is used in Swift to safely unwrap an optional?',                'MCQ', 10),
(59, 8, 'Which Swift type is used to store key-value pairs?',                 'MCQ', 10),
(60, 8, 'Which keyword is used to define a function in Swift?',               'MCQ', 10),
(61, 8, 'What does the "?" symbol mean after a type in Swift?',               'MCQ', 10),
(62, 8, 'Swift is developed by Apple.',                                       'TF',  10),
(63, 8, 'In Swift, "let" is used to declare a variable.',                     'TF',  10),
(64, 8, 'Swift supports object-oriented programming.',                        'TF',  10),

-- -------------------------
-- Course 9: Flutter & Dart (65–72)
-- -------------------------
(65, 9, 'What language is Flutter built on?',                                 'MCQ', 10),
(66, 9, 'Which widget is the base of all Flutter UI elements?',               'MCQ', 10),
(67, 9, 'Which Flutter widget is used for scrollable lists?',                 'MCQ', 10),
(68, 9, 'What command creates a new Flutter project?',                        'MCQ', 10),
(69, 9, 'Which keyword is used to define an async function in Dart?',         'MCQ', 10),
(70, 9, 'Flutter uses a single codebase for multiple platforms.',             'TF',  10),
(71, 9, 'StatelessWidget can change its state after being built.',            'TF',  10),
(72, 9, 'Dart supports both JIT and AOT compilation.',                        'TF',  10),

-- -------------------------
-- Course 10: Cloud Fundamentals (73–80)
-- -------------------------
(73, 10, 'What does IaaS stand for?',                                         'MCQ', 10),
(74, 10, 'Which of the following is a major cloud provider?',                 'MCQ', 10),
(75, 10, 'What does SaaS stand for?',                                         'MCQ', 10),
(76, 10, 'Which cloud model is shared between public and private?',           'MCQ', 10),
(77, 10, 'What is the term for the ability to scale resources on demand?',    'MCQ', 10),
(78, 10, 'Cloud computing eliminates the need for any local hardware.',       'TF',  10),
(79, 10, 'AWS S3 is used for object storage.',                                'TF',  10),
(80, 10, 'PaaS gives users control over the underlying infrastructure.',      'TF',  10),

-- -------------------------
-- Course 11: Docker & Kubernetes (81–88)
-- -------------------------
(81, 11, 'What is a Docker image?',                                           'MCQ', 10),
(82, 11, 'Which command runs a Docker container?',                            'MCQ', 10),
(83, 11, 'What file is used to define a Docker image build process?',         'MCQ', 10),
(84, 11, 'What is the role of Kubernetes?',                                   'MCQ', 10),
(85, 11, 'Which Kubernetes object ensures a set number of pod replicas?',     'MCQ', 10),
(86, 11, 'Docker containers share the host OS kernel.',                       'TF',  10),
(87, 11, 'A Kubernetes Pod can contain multiple containers.',                 'TF',  10),
(88, 11, 'Docker Compose is used for container orchestration at scale.',      'TF',  10),

-- -------------------------
-- Course 12: CI/CD Pipelines (89–96)
-- -------------------------
(89, 12, 'What does CI stand for in CI/CD?',                                  'MCQ', 10),
(90, 12, 'Which tool is commonly used for CI/CD pipelines?',                  'MCQ', 10),
(91, 12, 'What is the purpose of a CI/CD pipeline?',                          'MCQ', 10),
(92, 12, 'Which file format is commonly used to define GitHub Actions?',      'MCQ', 10),
(93, 12, 'What does CD stand for in CI/CD?',                                  'MCQ', 10),
(94, 12, 'CI/CD pipelines help reduce manual deployment errors.',             'TF',  10),
(95, 12, 'GitHub Actions can only be used with GitHub repositories.',         'TF',  10),
(96, 12, 'Continuous Deployment means every change is released manually.',   'TF',  10);


INSERT INTO Choice (OptionID, QuestionID, OptionText, OptionOrder) VALUES

-- Q1 (MCQ) HTML style tag
(1,  1, '<style>',    1), (2,  1, '<script>',   2), (3,  1, '<css>',      3), (4,  1, '<link>',     4),
-- Q2 (MCQ) CSS font-size
(5,  2, 'font-size',  1), (6,  2, 'text-size',  2), (7,  2, 'font-style', 3), (8,  2, 'text-font',  4),
-- Q3 (MCQ) CSS = Cascading
(9,  3, 'Cascading',  1), (10, 3, 'Creative',   2), (11, 3, 'Colorful',   3), (12, 3, 'Coded',      4),
-- Q4 (MCQ) inline style attribute
(13, 4, 'style',      1), (14, 4, 'class',       2), (15, 4, 'font',       3), (16, 4, 'css',        4),
-- Q5 (MCQ) background-color
(17, 5, 'background-color', 1), (18, 5, 'color',       2), (19, 5, 'bg-color', 3), (20, 5, 'background', 4),
-- Q6 (TF) HTML = HyperText Markup Language
(21, 6, 'True',  1), (22, 6, 'False', 2),
-- Q7 (TF) div is block not inline
(23, 7, 'True',  1), (24, 7, 'False', 2),
-- Q8 (TF) Flexbox is 1D
(25, 8, 'True',  1), (26, 8, 'False', 2),

-- Q9 (MCQ) const keyword
(27, 9,  'const',       1), (28, 9,  'let',         2), (29, 9,  'var',         3), (30, 9,  'static',      4),
-- Q10 (MCQ) push()
(31, 10, 'push()',      1), (32, 10, 'append()',    2), (33, 10, 'add()',       3), (34, 10, 'insert()',    4),
-- Q11 (MCQ) === checks value and type
(35, 11, 'Value and type equality', 1), (36, 11, 'Value equality only', 2), (37, 11, 'Type equality only', 3), (38, 11, 'Reference equality', 4),
-- Q12 (MCQ) parseInt
(39, 12, 'parseInt()',  1), (40, 12, 'parseFloat()',2), (41, 12, 'toInt()',    3), (42, 12, 'Number()',    4),
-- Q13 (MCQ) typeof null = "object"
(43, 13, '"object"',   1), (44, 13, '"null"',      2), (45, 13, '"undefined"',3), (46, 13, '"string"',    4),
-- Q14 (TF) JS is dynamic
(47, 14, 'True',  1), (48, 14, 'False', 2),
-- Q15 (TF) Arrow functions do NOT have own this
(49, 15, 'True',  1), (50, 15, 'False', 2),
-- Q16 (TF) let has block scope
(51, 16, 'True',  1), (52, 16, 'False', 2),

-- Q17 (MCQ) def keyword
(53, 17, 'def',        1), (54, 17, 'function',   2), (55, 17, 'fun',        3), (56, 17, 'define',     4),
-- Q18 (MCQ) 3/2 = float
(57, 18, 'float',      1), (58, 18, 'int',         2), (59, 18, 'double',     3), (60, 18, 'decimal',    4),
-- Q19 (MCQ) list is mutable
(61, 19, 'list',       1), (62, 19, 'tuple',       2), (63, 19, 'string',     3), (64, 19, 'frozenset',  4),
-- Q20 (MCQ) # for comments
(65, 20, '#',          1), (66, 20, '//',          2), (67, 20, '/*',         3), (68, 20, '--',         4),
-- Q21 (MCQ) len("hello") = 5
(69, 21, '5',          1), (70, 21, '4',           2), (71, 21, '6',          3), (72, 21, '3',          4),
-- Q22 (TF) Python uses indentation not {}
(73, 22, 'True',  1), (74, 22, 'False', 2),
-- Q23 (TF) lists can mix types
(75, 23, 'True',  1), (76, 23, 'False', 2),
-- Q24 (TF) range() returns range object not list
(77, 24, 'True',  1), (78, 24, 'False', 2),

-- Q25 (MCQ) SELECT
(79, 25, 'SELECT',     1), (80, 25, 'GET',         2), (81, 25, 'FETCH',      3), (82, 25, 'READ',       4),
-- Q26 (MCQ) WHERE
(83, 26, 'WHERE',      1), (84, 26, 'FILTER',      2), (85, 26, 'HAVING',     3), (86, 26, 'LIMIT',      4),
-- Q27 (MCQ) FULL OUTER JOIN
(87, 27, 'FULL OUTER JOIN', 1), (88, 27, 'INNER JOIN', 2), (89, 27, 'LEFT JOIN', 3), (90, 27, 'CROSS JOIN', 4),
-- Q28 (MCQ) COUNT()
(91, 28, 'COUNT()',    1), (92, 28, 'SUM()',        2), (93, 28, 'TOTAL()',    3), (94, 28, 'NUM()',      4),
-- Q29 (MCQ) TRUNCATE
(95, 29, 'TRUNCATE',  1), (96, 29, 'DELETE',       2), (97, 29, 'DROP',       3), (98, 29, 'REMOVE',     4),
-- Q30 (TF) PK cannot be NULL
(99, 30, 'True',  1), (100, 30, 'False', 2),
-- Q31 (TF) HAVING filters groups
(101, 31, 'True',  1), (102, 31, 'False', 2),
-- Q32 (TF) INNER JOIN does NOT return unmatched rows
(103, 32, 'True',  1), (104, 32, 'False', 2),

-- Q33 (MCQ) ls
(105, 33, 'ls',        1), (106, 33, 'dir',        2), (107, 33, 'list',      3), (108, 33, 'show',      4),
-- Q34 (MCQ) chmod
(109, 34, 'chmod',     1), (110, 34, 'chown',      2), (111, 34, 'chperm',    3), (112, 34, 'setperm',   4),
-- Q35 (MCQ) pwd = print working directory
(113, 35, 'Prints the current directory path', 1), (114, 35, 'Changes directory', 2), (115, 35, 'Lists files', 3), (116, 35, 'Creates a directory', 4),
-- Q36 (MCQ) grep
(117, 36, 'grep',      1), (118, 36, 'find',       2), (119, 36, 'search',    3), (120, 36, 'locate',    4),
-- Q37 (MCQ) / = root
(121, 37, '/',         1), (122, 37, '~',          2), (123, 37, '/root',     3), (124, 37, '/home',     4),
-- Q38 (TF) sudo = superuser
(125, 38, 'True',  1), (126, 38, 'False', 2),
-- Q39 (TF) Linux IS case-sensitive
(127, 39, 'True',  1), (128, 39, 'False', 2),
-- Q40 (TF) rm -rf deletes recursively
(129, 40, 'True',  1), (130, 40, 'False', 2),

-- Q41 (MCQ) IP = Internet Protocol
(131, 41, 'Internet Protocol',       1), (132, 41, 'Internal Protocol',    2), (133, 41, 'Interface Protocol', 3), (134, 41, 'Interconnect Protocol', 4),
-- Q42 (MCQ) SMTP for email
(135, 42, 'SMTP',      1), (136, 42, 'FTP',        2), (137, 42, 'HTTP',      3), (138, 42, 'SSH',       4),
-- Q43 (MCQ) HTTPS = port 443
(139, 43, '443',       1), (140, 43, '80',          2), (141, 43, '8080',      3), (142, 43, '22',        4),
-- Q44 (MCQ) Router connects networks
(143, 44, 'Router',    1), (144, 44, 'Switch',      2), (145, 44, 'Hub',       3), (146, 44, 'Modem',     4),
-- Q45 (MCQ) DNS = Domain Name System
(147, 45, 'Domain Name System',      1), (148, 45, 'Domain Network Service', 2), (149, 45, 'Data Name System', 3), (150, 45, 'Dynamic Name Server', 4),
-- Q46 (TF) TCP is connection-oriented
(151, 46, 'True',  1), (152, 46, 'False', 2),
-- Q47 (TF) MAC is physical not logical
(153, 47, 'True',  1), (154, 47, 'False', 2),
-- Q48 (TF) IPv4 is 32-bit not 128-bit
(155, 48, 'True',  1), (156, 48, 'False', 2),

-- Q49 (MCQ) ? after type = nullable
(157, 49, 'String?',   1), (158, 49, 'String!',    2), (159, 49, 'String*',   3), (160, 49, 'String#',   4),
-- Q50 (MCQ) main() is entry point
(161, 50, 'main()',    1), (162, 50, 'start()',     2), (163, 50, 'run()',      3), (164, 50, 'init()',    4),
-- Q51 (MCQ) val = immutable
(165, 51, 'val',       1), (166, 51, 'var',         2), (167, 51, 'let',       3), (168, 51, 'const',     4),
-- Q52 (MCQ) $ for string templates
(169, 52, '$',         1), (170, 52, '@',           2), (171, 52, '#',         3), (172, 52, '&',         4),
-- Q53 (MCQ) Set has no duplicates
(173, 53, 'Set',       1), (174, 53, 'List',        2), (175, 53, 'Array',     3), (176, 53, 'Map',       4),
-- Q54 (TF) Kotlin is Java-interoperable
(177, 54, 'True',  1), (178, 54, 'False', 2),
-- Q55 (TF) var is mutable not immutable
(179, 55, 'True',  1), (180, 55, 'False', 2),
-- Q56 (TF) Kotlin has null safety
(181, 56, 'True',  1), (182, 56, 'False', 2),

-- Q57 (MCQ) let = constant in Swift
(183, 57, 'let',       1), (184, 57, 'var',         2), (185, 57, 'const',     3), (186, 57, 'val',       4),
-- Q58 (MCQ) if let for safe unwrap
(187, 58, 'if let',    1), (188, 58, 'guard',       2), (189, 58, 'unwrap()',  3), (190, 58, 'force()',   4),
-- Q59 (MCQ) Dictionary for key-value
(191, 59, 'Dictionary',1), (192, 59, 'Map',         2), (193, 59, 'HashMap',   3), (194, 59, 'Set',       4),
-- Q60 (MCQ) func keyword
(195, 60, 'func',      1), (196, 60, 'function',    2), (197, 60, 'def',       3), (198, 60, 'fun',       4),
-- Q61 (MCQ) ? = optional type
(199, 61, 'Optional type (can be nil)', 1), (200, 61, 'Required type', 2), (201, 61, 'Nullable cast', 3), (202, 61, 'Generic type', 4),
-- Q62 (TF) Swift is by Apple
(203, 62, 'True',  1), (204, 62, 'False', 2),
-- Q63 (TF) let is constant not variable
(205, 63, 'True',  1), (206, 63, 'False', 2),
-- Q64 (TF) Swift supports OOP
(207, 64, 'True',  1), (208, 64, 'False', 2),

-- Q65 (MCQ) Flutter = Dart
(209, 65, 'Dart',      1), (210, 65, 'Kotlin',      2), (211, 65, 'Swift',     3), (212, 65, 'JavaScript',4),
-- Q66 (MCQ) Widget is base of Flutter UI
(213, 66, 'Widget',    1), (214, 66, 'View',         2), (215, 66, 'Component', 3), (216, 66, 'Element',   4),
-- Q67 (MCQ) ListView for scrollable lists
(217, 67, 'ListView',  1), (218, 67, 'ScrollView',  2), (219, 67, 'RecyclerView',3),(220, 67, 'TableView', 4),
-- Q68 (MCQ) flutter create
(221, 68, 'flutter create', 1), (222, 68, 'flutter init',   2), (223, 68, 'flutter new',    3), (224, 68, 'flutter start',  4),
-- Q69 (MCQ) async keyword in Dart
(225, 69, 'async',     1), (226, 69, 'await',       2), (227, 69, 'future',    3), (228, 69, 'defer',     4),
-- Q70 (TF) Flutter is cross-platform
(229, 70, 'True',  1), (230, 70, 'False', 2),
-- Q71 (TF) StatelessWidget CANNOT change state
(231, 71, 'True',  1), (232, 71, 'False', 2),
-- Q72 (TF) Dart supports JIT + AOT
(233, 72, 'True',  1), (234, 72, 'False', 2),

-- Q73 (MCQ) IaaS = Infrastructure as a Service
(235, 73, 'Infrastructure as a Service', 1), (236, 73, 'Internet as a Service', 2), (237, 73, 'Integration as a Service', 3), (238, 73, 'Interface as a Service', 4),
-- Q74 (MCQ) AWS is a cloud provider
(239, 74, 'AWS',       1), (240, 74, 'Oracle DB',   2), (241, 74, 'MySQL',     3), (242, 74, 'Apache',    4),
-- Q75 (MCQ) SaaS = Software as a Service
(243, 75, 'Software as a Service',       1), (244, 75, 'System as a Service',   2), (245, 75, 'Storage as a Service',  3), (246, 75, 'Server as a Service',   4),
-- Q76 (MCQ) Hybrid cloud
(247, 76, 'Hybrid',    1), (248, 76, 'Community',   2), (249, 76, 'Multi',     3), (250, 76, 'Federated', 4),
-- Q77 (MCQ) Elasticity
(251, 77, 'Elasticity',1), (252, 77, 'Scalability', 2), (253, 77, 'Redundancy',3), (254, 77, 'Availability',4),
-- Q78 (TF) Cloud does NOT eliminate all local hardware
(255, 78, 'True',  1), (256, 78, 'False', 2),
-- Q79 (TF) S3 is object storage
(257, 79, 'True',  1), (258, 79, 'False', 2),
-- Q80 (TF) PaaS does NOT give infra control
(259, 80, 'True',  1), (260, 80, 'False', 2),

-- Q81 (MCQ) Docker image = blueprint/template
(261, 81, 'A read-only template to create containers', 1), (262, 81, 'A running container instance', 2), (263, 81, 'A virtual machine', 3), (264, 81, 'A network configuration file', 4),
-- Q82 (MCQ) docker run
(265, 82, 'docker run',    1), (266, 82, 'docker start',  2), (267, 82, 'docker exec',   3), (268, 82, 'docker create', 4),
-- Q83 (MCQ) Dockerfile
(269, 83, 'Dockerfile',    1), (270, 83, 'docker-compose.yml', 2), (271, 83, '.dockerignore', 3), (272, 83, 'Makefile',      4),
-- Q84 (MCQ) Kubernetes = container orchestration
(273, 84, 'Container orchestration and management', 1), (274, 84, 'Building Docker images', 2), (275, 84, 'Writing Dockerfiles', 3), (276, 84, 'Monitoring server hardware', 4),
-- Q85 (MCQ) ReplicaSet
(277, 85, 'ReplicaSet',    1), (278, 85, 'Deployment',    2), (279, 85, 'Pod',           3), (280, 85, 'Service',       4),
-- Q86 (TF) containers share host kernel
(281, 86, 'True',  1), (282, 86, 'False', 2),
-- Q87 (TF) Pod can have multiple containers
(283, 87, 'True',  1), (284, 87, 'False', 2),
-- Q88 (TF) Docker Compose is NOT for large-scale orchestration
(285, 88, 'True',  1), (286, 88, 'False', 2),

-- Q89 (MCQ) CI = Continuous Integration
(287, 89, 'Continuous Integration',  1), (288, 89, 'Continuous Inspection',  2), (289, 89, 'Code Integration',       3), (290, 89, 'Continuous Installation', 4),
-- Q90 (MCQ) Jenkins is CI/CD tool
(291, 90, 'Jenkins',   1), (292, 90, 'Docker',      2), (293, 90, 'Kubernetes', 3), (294, 90, 'Terraform',  4),
-- Q91 (MCQ) Purpose = automate build/test/deploy
(295, 91, 'Automate building, testing, and deploying code', 1), (296, 91, 'Manage cloud infrastructure', 2), (297, 91, 'Monitor application performance', 3), (298, 91, 'Version control source code', 4),
-- Q92 (MCQ) YAML for GitHub Actions
(299, 92, 'YAML',      1), (300, 92, 'JSON',        2), (301, 92, 'XML',        3), (302, 92, 'TOML',       4),
-- Q93 (MCQ) CD = Continuous Delivery/Deployment
(303, 93, 'Continuous Delivery',     1), (304, 93, 'Code Deployment',         2), (305, 93, 'Continuous Documentation', 3), (306, 93, 'Continuous Distribution', 4),
-- Q94 (TF) CI/CD reduces manual errors
(307, 94, 'True',  1), (308, 94, 'False', 2),
-- Q95 (TF) GitHub Actions can work with other providers too
(309, 95, 'True',  1), (310, 95, 'False', 2),
-- Q96 (TF) Continuous Deployment is AUTOMATIC not manual
(311, 96, 'True',  1), (312, 96, 'False', 2);



INSERT INTO ModelAnswer (QuestionID, CorrectOptionID) VALUES
-- Course 1: HTML & CSS
(1, 1),   -- <style>
(2, 5),   -- font-size
(3, 9),   -- Cascading
(4, 13),  -- style
(5, 17),  -- background-color
(6, 21),  -- True
(7, 24),  -- False (div is block)
(8, 25),  -- True

-- Course 2: JavaScript
(9,  27), -- const
(10, 31), -- push()
(11, 35), -- Value and type equality
(12, 39), -- parseInt()
(13, 43), -- "object"
(14, 48), -- False (JS is dynamic)
(15, 50), -- False (arrow functions do NOT have own this)
(16, 51), -- True

-- Course 3: Python Basics
(17, 53), -- def
(18, 57), -- float
(19, 61), -- list
(20, 65), -- #
(21, 69), -- 5
(22, 74), -- False (Python uses indentation)
(23, 75), -- True
(24, 78), -- False (range() returns range object)

-- Course 4: SQL & Databases
(25, 79),  -- SELECT
(26, 83),  -- WHERE
(27, 87),  -- FULL OUTER JOIN
(28, 91),  -- COUNT()
(29, 95),  -- TRUNCATE
(30, 100), -- False (PK cannot be NULL)
(31, 101), -- True
(32, 104), -- False (INNER JOIN only returns matched rows)

-- Course 5: Linux Fundamentals
(33, 105), -- ls
(34, 109), -- chmod
(35, 113), -- Prints the current directory path
(36, 117), -- grep
(37, 121), -- /
(38, 125), -- True
(39, 128), -- False (Linux IS case-sensitive)
(40, 129), -- True

-- Course 6: Network Basics
(41, 131), -- Internet Protocol
(42, 135), -- SMTP
(43, 139), -- 443
(44, 143), -- Router
(45, 147), -- Domain Name System
(46, 151), -- True
(47, 154), -- False (MAC is physical)
(48, 156), -- False (IPv4 is 32-bit)

-- Course 7: Kotlin Basics
(49, 157), -- String?
(50, 161), -- main()
(51, 165), -- val
(52, 169), -- $
(53, 173), -- Set
(54, 177), -- True
(55, 180), -- False (var is mutable)
(56, 181), -- True

-- Course 8: Swift Basics
(57, 183), -- let
(58, 187), -- if let
(59, 191), -- Dictionary
(60, 195), -- func
(61, 199), -- Optional type (can be nil)
(62, 203), -- True
(63, 206), -- False (let is constant)
(64, 207), -- True

-- Course 9: Flutter & Dart
(65, 209), -- Dart
(66, 213), -- Widget
(67, 217), -- ListView
(68, 221), -- flutter create
(69, 225), -- async
(70, 229), -- True
(71, 232), -- False (StatelessWidget cannot change state)
(72, 233), -- True

-- Course 10: Cloud Fundamentals
(73, 235), -- Infrastructure as a Service
(74, 239), -- AWS
(75, 243), -- Software as a Service
(76, 247), -- Hybrid
(77, 251), -- Elasticity
(78, 256), -- False (cloud doesn't eliminate ALL local hardware)
(79, 257), -- True
(80, 260), -- False (PaaS abstracts infra)

-- Course 11: Docker & Kubernetes
(81, 261), -- A read-only template to create containers
(82, 265), -- docker run
(83, 269), -- Dockerfile
(84, 273), -- Container orchestration and management
(85, 277), -- ReplicaSet
(86, 281), -- True
(87, 283), -- True
(88, 286), -- False (Compose is for local/small scale)

-- Course 12: CI/CD Pipelines
(89, 287), -- Continuous Integration
(90, 291), -- Jenkins
(91, 295), -- Automate building, testing, and deploying code
(92, 299), -- YAML
(93, 303), -- Continuous Delivery
(94, 307), -- True
(95, 310), -- False (GitHub Actions works with other providers)
(96, 312); -- False (Continuous Deployment is automatic)