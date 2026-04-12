-- Create setModelAnswer procedure
CREATE OR REPLACE PROCEDURE setModelAnswer(p_question_id INT, p_coption_id INT)
LANGUAGE plpgsql AS 
$$
BEGIN
	IF EXISTS(SELECT * FROM ModelAnswer WHERE QuestionID =  p_question_id)
		THEN RAISE EXCEPTION 'This Model Answer already exists';
	END IF;
	IF NOT EXISTS(SELECT * FROM Choice WHERE QuestionID =  p_question_id AND OptionID = p_coption_id)
		THEN RAISE EXCEPTION 'This option does not exist';
	END IF;
	INSERT INTO ModelAnswer(QuestionID, CorrectOptionID) VALUES (p_question_id, p_coption_id);
END
$$

-- Course 1: HTML & CSS
CALL setModelAnswer(1, 1);
CALL setModelAnswer(2, 5);
CALL setModelAnswer(3, 9);
CALL setModelAnswer(4, 13);
CALL setModelAnswer(5, 17);
CALL setModelAnswer(6, 21);
CALL setModelAnswer(7, 24);
CALL setModelAnswer(8, 25);
-- Course 2: JavaScript
CALL setModelAnswer(9, 27);
CALL setModelAnswer(10, 31);
CALL setModelAnswer(11, 35);
CALL setModelAnswer(12, 39);
CALL setModelAnswer(13, 43);
CALL setModelAnswer(14, 48);
CALL setModelAnswer(15, 50);
CALL setModelAnswer(16, 51);
-- Course 3: Python Basics
CALL setModelAnswer(17, 53);
CALL setModelAnswer(18, 57);
CALL setModelAnswer(19, 61);
CALL setModelAnswer(20, 65);
CALL setModelAnswer(21, 69);
CALL setModelAnswer(22, 74);
CALL setModelAnswer(23, 75);
CALL setModelAnswer(24, 78);
-- Course 4: SQL & Databases
CALL setModelAnswer(25, 79);
CALL setModelAnswer(26, 83);
CALL setModelAnswer(27, 87);
CALL setModelAnswer(28, 91);
CALL setModelAnswer(29, 95);
CALL setModelAnswer(30, 100);
CALL setModelAnswer(31, 101);
CALL setModelAnswer(32, 104);
-- Course 5: Linux Fundamentals
CALL setModelAnswer(33, 105);
CALL setModelAnswer(34, 109);
CALL setModelAnswer(35, 113);
CALL setModelAnswer(36, 117);
CALL setModelAnswer(37, 121);
CALL setModelAnswer(38, 125);
CALL setModelAnswer(39, 128);
CALL setModelAnswer(40, 129);
-- Course 6: Network Basics
CALL setModelAnswer(41, 131);
CALL setModelAnswer(42, 135);
CALL setModelAnswer(43, 139);
CALL setModelAnswer(44, 143);
CALL setModelAnswer(45, 147);
CALL setModelAnswer(46, 151);
CALL setModelAnswer(47, 154);
CALL setModelAnswer(48, 156);
-- Course 7: Kotlin Basics
CALL setModelAnswer(49, 157);
CALL setModelAnswer(50, 161);
CALL setModelAnswer(51, 165);
CALL setModelAnswer(52, 169);
CALL setModelAnswer(53, 173);
CALL setModelAnswer(54, 177);
CALL setModelAnswer(55, 180);
CALL setModelAnswer(56, 181);
-- Course 8: Swift Basics
CALL setModelAnswer(57, 183);
CALL setModelAnswer(58, 187);
CALL setModelAnswer(59, 191);
CALL setModelAnswer(60, 195);
CALL setModelAnswer(61, 199);
CALL setModelAnswer(62, 203);
CALL setModelAnswer(63, 206);
CALL setModelAnswer(64, 207);
-- Course 9: Flutter & Dart
CALL setModelAnswer(65, 209);
CALL setModelAnswer(66, 213);
CALL setModelAnswer(67, 217);
CALL setModelAnswer(68, 221);
CALL setModelAnswer(69, 225);
CALL setModelAnswer(70, 229);
CALL setModelAnswer(71, 232);
CALL setModelAnswer(72, 233);
-- Course 10: Cloud Fundamentals
CALL setModelAnswer(73, 235);
CALL setModelAnswer(74, 239);
CALL setModelAnswer(75, 243);
CALL setModelAnswer(76, 247);
CALL setModelAnswer(77, 251);
CALL setModelAnswer(78, 256);
CALL setModelAnswer(79, 257);
CALL setModelAnswer(80, 260);
-- Course 11: Docker & Kubernetes
CALL setModelAnswer(81, 261);
CALL setModelAnswer(82, 265);
CALL setModelAnswer(83, 269);
CALL setModelAnswer(84, 273);
CALL setModelAnswer(85, 277);
CALL setModelAnswer(86, 281);
CALL setModelAnswer(87, 283);
CALL setModelAnswer(88, 286);
-- Course 12: CI/CD Pipelines
CALL setModelAnswer(89, 287);
CALL setModelAnswer(90, 291);
CALL setModelAnswer(91, 295);
CALL setModelAnswer(92, 299);
CALL setModelAnswer(93, 303);
CALL setModelAnswer(94, 307);
CALL setModelAnswer(95, 310);
CALL setModelAnswer(96, 312);
