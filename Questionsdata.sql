
-- INSERT INTO Questions (QuestionID, CourseID, QuestionText, QuestionType, Points) VALUES




-- =========================
-- 1) QUESTIONS
-- =========================

-- Course 1
CALL InsertQuestion(1, 'Which HTML tag is used to define an internal style sheet?', 'MCQ', 10);
CALL InsertQuestion(1, 'Which CSS property controls the text size?', 'MCQ', 10);
CALL InsertQuestion(1, 'What does the "C" in CSS stand for?', 'MCQ', 10);
CALL InsertQuestion(1, 'Which HTML attribute is used to define inline styles?', 'MCQ', 10);
CALL InsertQuestion(1, 'Which CSS property is used to change the background color?', 'MCQ', 10);
CALL InsertQuestion(1, 'HTML stands for HyperText Markup Language.', 'TF', 10);
CALL InsertQuestion(1, 'The <div> tag is an inline element.', 'TF', 10);
CALL InsertQuestion(1, 'CSS Flexbox is used for one-dimensional layout.', 'TF', 10);

-- Course 2
CALL InsertQuestion(2, 'Which keyword is used to declare a constant in JavaScript?', 'MCQ', 10);
CALL InsertQuestion(2, 'Which method is used to add an element to the end of an array?', 'MCQ', 10);
CALL InsertQuestion(2, 'What does "===" check in JavaScript?', 'MCQ', 10);
CALL InsertQuestion(2, 'Which function parses a string and returns an integer?', 'MCQ', 10);
CALL InsertQuestion(2, 'What is the output of typeof null in JavaScript?', 'MCQ', 10);
CALL InsertQuestion(2, 'JavaScript is a statically typed language.', 'TF', 10);
CALL InsertQuestion(2, 'Arrow functions have their own "this" binding.', 'TF', 10);
CALL InsertQuestion(2, 'The "let" keyword has block scope in JavaScript.', 'TF', 10);

-- Course 3
CALL InsertQuestion(3, 'Which keyword is used to define a function in Python?', 'MCQ', 10);
CALL InsertQuestion(3, 'What data type is the result of: type(3 / 2) in Python 3?', 'MCQ', 10);
CALL InsertQuestion(3, 'Which of the following is a mutable data type in Python?', 'MCQ', 10);
CALL InsertQuestion(3, 'How do you start a comment in Python?', 'MCQ', 10);
CALL InsertQuestion(3, 'What is the output of len("hello")?', 'MCQ', 10);
CALL InsertQuestion(3, 'Python uses curly braces {} to define code blocks.', 'TF', 10);
CALL InsertQuestion(3, 'Python lists can contain elements of different data types.', 'TF', 10);
CALL InsertQuestion(3, 'The range() function in Python returns a list.', 'TF', 10);

-- Course 4
CALL InsertQuestion(4, 'Which SQL statement is used to retrieve data?', 'MCQ', 10);
CALL InsertQuestion(4, 'Which clause filters the results of a SELECT query?', 'MCQ', 10);
CALL InsertQuestion(4, 'Which JOIN returns all rows from both tables?', 'MCQ', 10);
CALL InsertQuestion(4, 'Which SQL function returns the number of rows?', 'MCQ', 10);
CALL InsertQuestion(4, 'Which command removes all rows from a table without logging?', 'MCQ', 10);
CALL InsertQuestion(4, 'A PRIMARY KEY can contain NULL values.', 'TF', 10);
CALL InsertQuestion(4, 'The HAVING clause is used to filter groups in a GROUP BY query.', 'TF', 10);
CALL InsertQuestion(4, 'An INNER JOIN returns rows with no match in either table.', 'TF', 10);

-- Course 5
CALL InsertQuestion(5, 'Which command lists files in a directory in Linux?', 'MCQ', 10);
CALL InsertQuestion(5, 'Which command changes file permissions in Linux?', 'MCQ', 10);
CALL InsertQuestion(5, 'What does the "pwd" command do?', 'MCQ', 10);
CALL InsertQuestion(5, 'Which command is used to search text patterns in files?', 'MCQ', 10);
CALL InsertQuestion(5, 'Which symbol represents the root directory in Linux?', 'MCQ', 10);
CALL InsertQuestion(5, 'The "sudo" command gives superuser privileges.', 'TF', 10);
CALL InsertQuestion(5, 'In Linux, file names are case-insensitive.', 'TF', 10);
CALL InsertQuestion(5, 'The "rm -rf" command recursively deletes files and directories.', 'TF', 10);

-- Course 6
CALL InsertQuestion(6, 'What does IP stand for?', 'MCQ', 10);
CALL InsertQuestion(6, 'Which protocol is used to send email?', 'MCQ', 10);
CALL InsertQuestion(6, 'What is the default port for HTTPS?', 'MCQ', 10);
CALL InsertQuestion(6, 'Which device connects multiple networks together?', 'MCQ', 10);
CALL InsertQuestion(6, 'What does DNS stand for?', 'MCQ', 10);
CALL InsertQuestion(6, 'TCP is a connection-oriented protocol.', 'TF', 10);
CALL InsertQuestion(6, 'A MAC address is a logical address assigned by software.', 'TF', 10);
CALL InsertQuestion(6, 'IPv4 addresses are 128 bits long.', 'TF', 10);

-- Course 7
CALL InsertQuestion(7, 'Which keyword declares a nullable variable in Kotlin?', 'MCQ', 10);
CALL InsertQuestion(7, 'What is the entry point of a Kotlin program?', 'MCQ', 10);
CALL InsertQuestion(7, 'Which keyword is used to define an immutable variable in Kotlin?', 'MCQ', 10);
CALL InsertQuestion(7, 'What symbol is used for string templates in Kotlin?', 'MCQ', 10);
CALL InsertQuestion(7, 'Which Kotlin collection does NOT allow duplicate elements?', 'MCQ', 10);
CALL InsertQuestion(7, 'Kotlin is fully interoperable with Java.', 'TF', 10);
CALL InsertQuestion(7, 'In Kotlin, variables declared with "var" are immutable.', 'TF', 10);
CALL InsertQuestion(7, 'Kotlin supports null safety by default.', 'TF', 10);

-- Course 8
CALL InsertQuestion(8, 'Which keyword declares a constant in Swift?', 'MCQ', 10);
CALL InsertQuestion(8, 'What is used in Swift to safely unwrap an optional?', 'MCQ', 10);
CALL InsertQuestion(8, 'Which Swift type is used to store key-value pairs?', 'MCQ', 10);
CALL InsertQuestion(8, 'Which keyword is used to define a function in Swift?', 'MCQ', 10);
CALL InsertQuestion(8, 'What does the "?" symbol mean after a type in Swift?', 'MCQ', 10);
CALL InsertQuestion(8, 'Swift is developed by Apple.', 'TF', 10);
CALL InsertQuestion(8, 'In Swift, "let" is used to declare a variable.', 'TF', 10);
CALL InsertQuestion(8, 'Swift supports object-oriented programming.', 'TF', 10);

-- Course 9
CALL InsertQuestion(9, 'What language is Flutter built on?', 'MCQ', 10);
CALL InsertQuestion(9, 'Which widget is the base of all Flutter UI elements?', 'MCQ', 10);
CALL InsertQuestion(9, 'Which Flutter widget is used for scrollable lists?', 'MCQ', 10);
CALL InsertQuestion(9, 'What command creates a new Flutter project?', 'MCQ', 10);
CALL InsertQuestion(9, 'Which keyword is used to define an async function in Dart?', 'MCQ', 10);
CALL InsertQuestion(9, 'Flutter uses a single codebase for multiple platforms.', 'TF', 10);
CALL InsertQuestion(9, 'StatelessWidget can change its state after being built.', 'TF', 10);
CALL InsertQuestion(9, 'Dart supports both JIT and AOT compilation.', 'TF', 10);

-- Course 10
CALL InsertQuestion(10, 'What does IaaS stand for?', 'MCQ', 10);
CALL InsertQuestion(10, 'Which of the following is a major cloud provider?', 'MCQ', 10);
CALL InsertQuestion(10, 'What does SaaS stand for?', 'MCQ', 10);
CALL InsertQuestion(10, 'Which cloud model is shared between public and private?', 'MCQ', 10);
CALL InsertQuestion(10, 'What is the term for the ability to scale resources on demand?', 'MCQ', 10);
CALL InsertQuestion(10, 'Cloud computing eliminates the need for any local hardware.', 'TF', 10);
CALL InsertQuestion(10, 'AWS S3 is used for object storage.', 'TF', 10);
CALL InsertQuestion(10, 'PaaS gives users control over the underlying infrastructure.', 'TF', 10);

-- Course 11
CALL InsertQuestion(11, 'What is a Docker image?', 'MCQ', 10);
CALL InsertQuestion(11, 'Which command runs a Docker container?', 'MCQ', 10);
CALL InsertQuestion(11, 'What file is used to define a Docker image build process?', 'MCQ', 10);
CALL InsertQuestion(11, 'What is the role of Kubernetes?', 'MCQ', 10);
CALL InsertQuestion(11, 'Which Kubernetes object ensures a set number of pod replicas?', 'MCQ', 10);
CALL InsertQuestion(11, 'Docker containers share the host OS kernel.', 'TF', 10);
CALL InsertQuestion(11, 'A Kubernetes Pod can contain multiple containers.', 'TF', 10);
CALL InsertQuestion(11, 'Docker Compose is used for container orchestration at scale.', 'TF', 10);

-- Course 12
CALL InsertQuestion(12, 'What does CI stand for in CI/CD?', 'MCQ', 10);
CALL InsertQuestion(12, 'Which tool is commonly used for CI/CD pipelines?', 'MCQ', 10);
CALL InsertQuestion(12, 'What is the purpose of a CI/CD pipeline?', 'MCQ', 10);
CALL InsertQuestion(12, 'Which file format is commonly used to define GitHub Actions?', 'MCQ', 10);
CALL InsertQuestion(12, 'What does CD stand for in CI/CD?', 'MCQ', 10);
CALL InsertQuestion(12, 'CI/CD pipelines help reduce manual deployment errors.', 'TF', 10);
CALL InsertQuestion(12, 'GitHub Actions can only be used with GitHub repositories.', 'TF', 10);
CALL InsertQuestion(12, 'Continuous Deployment means every change is released manually.', 'TF', 10);


-- =========================
-- 3) CHOICES (FULLY FIXED)
-- =========================

-- Q1
CALL InsertChoice(1, '<style>', 1);
CALL InsertChoice(1, '<script>', 2);
CALL InsertChoice(1, '<css>', 3);
CALL InsertChoice(1, '<link>', 4);

-- Q2
CALL InsertChoice(2, 'font-size', 1);
CALL InsertChoice(2, 'text-size', 2);
CALL InsertChoice(2, 'font-style', 3);
CALL InsertChoice(2, 'text-font', 4);

-- Q3
CALL InsertChoice(3, 'Cascading', 1);
CALL InsertChoice(3, 'Creative', 2);
CALL InsertChoice(3, 'Colorful', 3);
CALL InsertChoice(3, 'Coded', 4);

-- Q4
CALL InsertChoice(4, 'style', 1);
CALL InsertChoice(4, 'class', 2);
CALL InsertChoice(4, 'font', 3);
CALL InsertChoice(4, 'css', 4);

-- Q5
CALL InsertChoice(5, 'background-color', 1);
CALL InsertChoice(5, 'color', 2);
CALL InsertChoice(5, 'bg-color', 3);
CALL InsertChoice(5, 'background', 4);

-- Q6
CALL InsertChoice(6, 'True', 1);
CALL InsertChoice(6, 'False', 2);

-- Q7
CALL InsertChoice(7, 'True', 1);
CALL InsertChoice(7, 'False', 2);

-- Q8
CALL InsertChoice(8, 'True', 1);
CALL InsertChoice(8, 'False', 2);

-- Q9
CALL InsertChoice(9, 'const', 1);
CALL InsertChoice(9, 'let', 2);
CALL InsertChoice(9, 'var', 3);
CALL InsertChoice(9, 'static', 4);

-- Q10
CALL InsertChoice(10, 'push()', 1);
CALL InsertChoice(10, 'append()', 2);
CALL InsertChoice(10, 'add()', 3);
CALL InsertChoice(10, 'insert()', 4);

-- Q11
CALL InsertChoice(11, 'Value and type equality', 1);
CALL InsertChoice(11, 'Value equality only', 2);
CALL InsertChoice(11, 'Type equality only', 3);
CALL InsertChoice(11, 'Reference equality', 4);

-- Q12
CALL InsertChoice(12, 'parseInt()', 1);
CALL InsertChoice(12, 'parseFloat()', 2);
CALL InsertChoice(12, 'toInt()', 3);
CALL InsertChoice(12, 'Number()', 4);

-- Q13
CALL InsertChoice(13, '"object"', 1);
CALL InsertChoice(13, '"null"', 2);
CALL InsertChoice(13, '"undefined"', 3);
CALL InsertChoice(13, '"string"', 4);

-- Q14
CALL InsertChoice(14, 'True', 1);
CALL InsertChoice(14, 'False', 2);

-- Q15
CALL InsertChoice(15, 'True', 1);
CALL InsertChoice(15, 'False', 2);

-- Q16
CALL InsertChoice(16, 'True', 1);
CALL InsertChoice(16, 'False', 2);

-- Q17
CALL InsertChoice(17, 'def', 1);
CALL InsertChoice(17, 'function', 2);
CALL InsertChoice(17, 'fun', 3);
CALL InsertChoice(17, 'define', 4);

-- Q18
CALL InsertChoice(18, 'float', 1);
CALL InsertChoice(18, 'int', 2);
CALL InsertChoice(18, 'double', 3);
CALL InsertChoice(18, 'decimal', 4);

-- Q19
CALL InsertChoice(19, 'list', 1);
CALL InsertChoice(19, 'tuple', 2);
CALL InsertChoice(19, 'string', 3);
CALL InsertChoice(19, 'frozenset', 4);

-- Q20
CALL InsertChoice(20, '#', 1);
CALL InsertChoice(20, '//', 2);
CALL InsertChoice(20, '/*', 3);
CALL InsertChoice(20, '--', 4);

-- Q21
CALL InsertChoice(21, '5', 1);
CALL InsertChoice(21, '4', 2);
CALL InsertChoice(21, '6', 3);
CALL InsertChoice(21, '3', 4);

-- Q22
CALL InsertChoice(22, 'True', 1);
CALL InsertChoice(22, 'False', 2);

-- Q23
CALL InsertChoice(23, 'True', 1);
CALL InsertChoice(23, 'False', 2);

-- Q24
CALL InsertChoice(24, 'True', 1);
CALL InsertChoice(24, 'False', 2);

-- Q25
CALL InsertChoice(25, 'SELECT', 1);
CALL InsertChoice(25, 'GET', 2);
CALL InsertChoice(25, 'FETCH', 3);
CALL InsertChoice(25, 'READ', 4);

-- Q26
CALL InsertChoice(26, 'WHERE', 1);
CALL InsertChoice(26, 'FILTER', 2);
CALL InsertChoice(26, 'HAVING', 3);
CALL InsertChoice(26, 'LIMIT', 4);

-- Q27
CALL InsertChoice(27, 'FULL OUTER JOIN', 1);
CALL InsertChoice(27, 'INNER JOIN', 2);
CALL InsertChoice(27, 'LEFT JOIN', 3);
CALL InsertChoice(27, 'CROSS JOIN', 4);

-- Q28
CALL InsertChoice(28, 'COUNT()', 1);
CALL InsertChoice(28, 'SUM()', 2);
CALL InsertChoice(28, 'TOTAL()', 3);
CALL InsertChoice(28, 'NUM()', 4);

-- Q29
CALL InsertChoice(29, 'TRUNCATE', 1);
CALL InsertChoice(29, 'DELETE', 2);
CALL InsertChoice(29, 'DROP', 3);
CALL InsertChoice(29, 'REMOVE', 4);

-- Q30
CALL InsertChoice(30, 'True', 1);
CALL InsertChoice(30, 'False', 2);

-- Q31
CALL InsertChoice(31, 'True', 1);
CALL InsertChoice(31, 'False', 2);

-- Q32
CALL InsertChoice(32, 'True', 1);
CALL InsertChoice(32, 'False', 2);

-- Q33
CALL InsertChoice(33, 'ls', 1);
CALL InsertChoice(33, 'dir', 2);
CALL InsertChoice(33, 'list', 3);
CALL InsertChoice(33, 'show', 4);

-- Q34
CALL InsertChoice(34, 'chmod', 1);
CALL InsertChoice(34, 'chown', 2);
CALL InsertChoice(34, 'chperm', 3);
CALL InsertChoice(34, 'setperm', 4);

-- Q35
CALL InsertChoice(35, 'Prints the current directory path', 1);
CALL InsertChoice(35, 'Changes directory', 2);
CALL InsertChoice(35, 'Lists files', 3);
CALL InsertChoice(35, 'Creates a directory', 4);

-- Q36
CALL InsertChoice(36, 'grep', 1);
CALL InsertChoice(36, 'find', 2);
CALL InsertChoice(36, 'search', 3);
CALL InsertChoice(36, 'locate', 4);

-- Q37
CALL InsertChoice(37, '/', 1);
CALL InsertChoice(37, '~', 2);
CALL InsertChoice(37, '/root', 3);
CALL InsertChoice(37, '/home', 4);

-- Q38
CALL InsertChoice(38, 'True', 1);
CALL InsertChoice(38, 'False', 2);

-- Q39
CALL InsertChoice(39, 'True', 1);
CALL InsertChoice(39, 'False', 2);

-- Q40
CALL InsertChoice(40, 'True', 1);
CALL InsertChoice(40, 'False', 2);

-- Q41
CALL InsertChoice(41, 'Internet Protocol', 1);
CALL InsertChoice(41, 'Internal Protocol', 2);
CALL InsertChoice(41, 'Interface Protocol', 3);
CALL InsertChoice(41, 'Interconnect Protocol', 4);

-- Q42
CALL InsertChoice(42, 'SMTP', 1);
CALL InsertChoice(42, 'FTP', 2);
CALL InsertChoice(42, 'HTTP', 3);
CALL InsertChoice(42, 'SSH', 4);

-- Q43
CALL InsertChoice(43, '443', 1);
CALL InsertChoice(43, '80', 2);
CALL InsertChoice(43, '8080', 3);
CALL InsertChoice(43, '22', 4);

-- Q44
CALL InsertChoice(44, 'Router', 1);
CALL InsertChoice(44, 'Switch', 2);
CALL InsertChoice(44, 'Hub', 3);
CALL InsertChoice(44, 'Modem', 4);

-- Q45
CALL InsertChoice(45, 'Domain Name System', 1);
CALL InsertChoice(45, 'Domain Network Service', 2);
CALL InsertChoice(45, 'Data Name System', 3);
CALL InsertChoice(45, 'Dynamic Name Server', 4);

-- Q46
CALL InsertChoice(46, 'True', 1);
CALL InsertChoice(46, 'False', 2);

-- Q47
CALL InsertChoice(47, 'True', 1);
CALL InsertChoice(47, 'False', 2);

-- Q48
CALL InsertChoice(48, 'True', 1);
CALL InsertChoice(48, 'False', 2);

-- Q49
CALL InsertChoice(49, 'String?', 1);
CALL InsertChoice(49, 'String!', 2);
CALL InsertChoice(49, 'String*', 3);
CALL InsertChoice(49, 'String#', 4);

-- Q50
CALL InsertChoice(50, 'main()', 1);
CALL InsertChoice(50, 'start()', 2);
CALL InsertChoice(50, 'run()', 3);
CALL InsertChoice(50, 'init()', 4);

-- Q51
CALL InsertChoice(51, 'val', 1);
CALL InsertChoice(51, 'var', 2);
CALL InsertChoice(51, 'let', 3);
CALL InsertChoice(51, 'const', 4);

-- Q52
CALL InsertChoice(52, '$', 1);
CALL InsertChoice(52, '@', 2);
CALL InsertChoice(52, '#', 3);
CALL InsertChoice(52, '&', 4);

-- Q53
CALL InsertChoice(53, 'Set', 1);
CALL InsertChoice(53, 'List', 2);
CALL InsertChoice(53, 'Array', 3);
CALL InsertChoice(53, 'Map', 4);

-- Q54
CALL InsertChoice(54, 'True', 1);
CALL InsertChoice(54, 'False', 2);

-- Q55
CALL InsertChoice(55, 'True', 1);
CALL InsertChoice(55, 'False', 2);

-- Q56
CALL InsertChoice(56, 'True', 1);
CALL InsertChoice(56, 'False', 2);

-- Q57
CALL InsertChoice(57, 'let', 1);
CALL InsertChoice(57, 'var', 2);
CALL InsertChoice(57, 'const', 3);
CALL InsertChoice(57, 'val', 4);

-- Q58
CALL InsertChoice(58, 'if let', 1);
CALL InsertChoice(58, 'guard', 2);
CALL InsertChoice(58, 'unwrap()', 3);
CALL InsertChoice(58, 'force()', 4);

-- Q59
CALL InsertChoice(59, 'Dictionary', 1);
CALL InsertChoice(59, 'Map', 2);
CALL InsertChoice(59, 'HashMap', 3);
CALL InsertChoice(59, 'Set', 4);

-- Q60
CALL InsertChoice(60, 'func', 1);
CALL InsertChoice(60, 'function', 2);
CALL InsertChoice(60, 'def', 3);
CALL InsertChoice(60, 'fun', 4);

-- Q61
CALL InsertChoice(61, 'Optional type (can be nil)', 1);
CALL InsertChoice(61, 'Required type', 2);
CALL InsertChoice(61, 'Nullable cast', 3);
CALL InsertChoice(61, 'Generic type', 4);

-- Q62
CALL InsertChoice(62, 'True', 1);
CALL InsertChoice(62, 'False', 2);

-- Q63
CALL InsertChoice(63, 'True', 1);
CALL InsertChoice(63, 'False', 2);

-- Q64
CALL InsertChoice(64, 'True', 1);
CALL InsertChoice(64, 'False', 2);

-- Q65
CALL InsertChoice(65, 'Dart', 1);
CALL InsertChoice(65, 'Kotlin', 2);
CALL InsertChoice(65, 'Swift', 3);
CALL InsertChoice(65, 'JavaScript', 4);

-- Q66
CALL InsertChoice(66, 'Widget', 1);
CALL InsertChoice(66, 'View', 2);
CALL InsertChoice(66, 'Component', 3);
CALL InsertChoice(66, 'Element', 4);

-- Q67
CALL InsertChoice(67, 'ListView', 1);
CALL InsertChoice(67, 'ScrollView', 2);
CALL InsertChoice(67, 'RecyclerView', 3);
CALL InsertChoice(67, 'TableView', 4);

-- Q68
CALL InsertChoice(68, 'flutter create', 1);
CALL InsertChoice(68, 'flutter init', 2);
CALL InsertChoice(68, 'flutter new', 3);
CALL InsertChoice(68, 'flutter start', 4);

-- Q69
CALL InsertChoice(69, 'async', 1);
CALL InsertChoice(69, 'await', 2);
CALL InsertChoice(69, 'future', 3);
CALL InsertChoice(69, 'defer', 4);

-- Q70
CALL InsertChoice(70, 'True', 1);
CALL InsertChoice(70, 'False', 2);

-- Q71
CALL InsertChoice(71, 'True', 1);
CALL InsertChoice(71, 'False', 2);

-- Q72
CALL InsertChoice(72, 'True', 1);
CALL InsertChoice(72, 'False', 2);

-- Q73
CALL InsertChoice(73, 'Infrastructure as a Service', 1);
CALL InsertChoice(73, 'Internet as a Service', 2);
CALL InsertChoice(73, 'Integration as a Service', 3);
CALL InsertChoice(73, 'Interface as a Service', 4);

-- Q74
CALL InsertChoice(74, 'AWS', 1);
CALL InsertChoice(74, 'Oracle DB', 2);
CALL InsertChoice(74, 'MySQL', 3);
CALL InsertChoice(74, 'Apache', 4);

-- Q75
CALL InsertChoice(75, 'Software as a Service', 1);
CALL InsertChoice(75, 'System as a Service', 2);
CALL InsertChoice(75, 'Storage as a Service', 3);
CALL InsertChoice(75, 'Server as a Service', 4);

-- Q76
CALL InsertChoice(76, 'Hybrid', 1);
CALL InsertChoice(76, 'Community', 2);
CALL InsertChoice(76, 'Multi', 3);
CALL InsertChoice(76, 'Federated', 4);

-- Q77
CALL InsertChoice(77, 'Elasticity', 1);
CALL InsertChoice(77, 'Scalability', 2);
CALL InsertChoice(77, 'Redundancy', 3);
CALL InsertChoice(77, 'Availability', 4);

-- Q78
CALL InsertChoice(78, 'True', 1);
CALL InsertChoice(78, 'False', 2);

-- Q79
CALL InsertChoice(79, 'True', 1);
CALL InsertChoice(79, 'False', 2);

-- Q80
CALL InsertChoice(80, 'True', 1);
CALL InsertChoice(80, 'False', 2);

-- Q81
CALL InsertChoice(81, 'A read-only template to create containers', 1);
CALL InsertChoice(81, 'A running container instance', 2);
CALL InsertChoice(81, 'A virtual machine', 3);
CALL InsertChoice(81, 'A network configuration file', 4);

-- Q82
CALL InsertChoice(82, 'docker run', 1);
CALL InsertChoice(82, 'docker start', 2);
CALL InsertChoice(82, 'docker exec', 3);
CALL InsertChoice(82, 'docker create', 4);

-- Q83
CALL InsertChoice(83, 'Dockerfile', 1);
CALL InsertChoice(83, 'docker-compose.yml', 2);
CALL InsertChoice(83, '.dockerignore', 3);
CALL InsertChoice(83, 'Makefile', 4);

-- Q84
CALL InsertChoice(84, 'Container orchestration and management', 1);
CALL InsertChoice(84, 'Building Docker images', 2);
CALL InsertChoice(84, 'Writing Dockerfiles', 3);
CALL InsertChoice(84, 'Monitoring server hardware', 4);

-- Q85
CALL InsertChoice(85, 'ReplicaSet', 1);
CALL InsertChoice(85, 'Deployment', 2);
CALL InsertChoice(85, 'Pod', 3);
CALL InsertChoice(85, 'Service', 4);

-- Q86
CALL InsertChoice(86, 'True', 1);
CALL InsertChoice(86, 'False', 2);

-- Q87
CALL InsertChoice(87, 'True', 1);
CALL InsertChoice(87, 'False', 2);

-- Q88
CALL InsertChoice(88, 'True', 1);
CALL InsertChoice(88, 'False', 2);

-- Q89
CALL InsertChoice(89, 'Continuous Integration', 1);
CALL InsertChoice(89, 'Continuous Inspection', 2);
CALL InsertChoice(89, 'Code Integration', 3);
CALL InsertChoice(89, 'Continuous Installation', 4);

-- Q90
CALL InsertChoice(90, 'Jenkins', 1);
CALL InsertChoice(90, 'Docker', 2);
CALL InsertChoice(90, 'Kubernetes', 3);
CALL InsertChoice(90, 'Terraform', 4);

-- Q91
CALL InsertChoice(91, 'Automate building, testing, and deploying code', 1);
CALL InsertChoice(91, 'Manage cloud infrastructure', 2);
CALL InsertChoice(91, 'Monitor application performance', 3);
CALL InsertChoice(91, 'Version control source code', 4);

-- Q92
CALL InsertChoice(92, 'YAML', 1);
CALL InsertChoice(92, 'JSON', 2);
CALL InsertChoice(92, 'XML', 3);
CALL InsertChoice(92, 'TOML', 4);

-- Q93
CALL InsertChoice(93, 'Continuous Delivery', 1);
CALL InsertChoice(93, 'Code Deployment', 2);
CALL InsertChoice(93, 'Continuous Documentation', 3);
CALL InsertChoice(93, 'Continuous Distribution', 4);

-- Q94
CALL InsertChoice(94, 'True', 1);
CALL InsertChoice(94, 'False', 2);

-- Q95
CALL InsertChoice(95, 'True', 1);
CALL InsertChoice(95, 'False', 2);

-- Q96
CALL InsertChoice(96, 'True', 1);
CALL InsertChoice(96, 'False', 2);


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