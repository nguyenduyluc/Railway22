DROP DATABASE IF EXISTS Testing_system_assignment_1;
CREATE DATABASE Testing_system_assignment_1;
USE 			Testing_system_assignment_1;

DROP TABLE IF EXISTS
Departments,
positions,
`Accounts`, `Groups`,
Group_Accounts, 
Type_questions,
Category_Questions,
Questions, Answers,
Exams,
Exam_Questions;

CREATE TABLE departments(
	department_id 		TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	department_name 	VARCHAR(100) NOT NULL
);

CREATE TABLE positions(
	 position_id 	TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	position_name 	ENUM("Dev","Test","Scrum Master", "PM") DEFAULT "Dev"
);

CREATE TABLE accounts(
	account_id 		INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	email			VARCHAR (50) UNIQUE NOT NULL,
    username 		VARCHAR (100) UNIQUE NOT NULL,
    fullname		VARCHAR (100) NOT NULL,
    gender 			BIT DEFAULT 1,
    department_id 	TINYINT UNSIGNED,
    position_id 	TINYINT UNSIGNED,
    create_date 	DATE,
    FOREIGN KEY(department_id) REFERENCES departments(department_id),
    FOREIGN KEY(position_id) REFERENCES positions(position_id)
);

CREATE TABLE `groups`(
	group_id 	TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	group_name 	VARCHAR (100) NOT NULL,
    creator_id 	INT UNSIGNED,
    create_date DATE,
    FOREIGN KEY(creator_id) REFERENCES accounts(account_id)
);

CREATE TABLE group_accounts(
	group_id 	TINYINT UNSIGNED,
	account_id 	INT UNSIGNED,
	join_date 	DATE,
    PRIMARY KEY(group_id, account_id),
    FOREIGN KEY(group_id) REFERENCES `groups`(group_id),
    FOREIGN KEY(account_id) REFERENCES accounts(account_id)
);

CREATE TABLE type_questions(
	type_id 	TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	type_name 	ENUM("essay","multiple_choice") DEFAULT "multiple_choice"
);

CREATE TABLE category_questions(
	category_id 	TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	category_name 	VARCHAR(100) NOT NULL
);

CREATE TABLE questions(
	question_id 	INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	content			TEXT,
    category_id 	TINYINT UNSIGNED,
    type_id 		TINYINT UNSIGNED,
    creator_id 		INT UNSIGNED,
    create_date 	DATE,
    FOREIGN KEY(type_id) REFERENCES type_questions(type_id),
    FOREIGN KEY(category_id) REFERENCES category_questions(category_id),
    FOREIGN KEY(creator_id) REFERENCES accounts(account_id)
);

CREATE TABLE answers(
	answer_id 		INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    content			TEXT,
    question_id 	INT UNSIGNED,
	iscorrect		BIT DEFAULT 1,
    FOREIGN KEY(question_id) REFERENCES questions(question_id)
);

CREATE TABLE exams(
	exam_id 			INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	`code`				CHAR(10) UNIQUE NOT NULL,
    title 				VARCHAR(200) NOT NULL,
    category_id 		TINYINT UNSIGNED,
    duration 			TINYINT UNSIGNED,
    creator_id 			INT UNSIGNED,
    createdate 			DATE,
    FOREIGN KEY(creator_id) REFERENCES accounts(account_id)
);

CREATE TABLE exam_questions(
	exam_id 		INT UNSIGNED,
	question_id 	INT UNSIGNED,
	PRIMARY KEY(exam_id,question_id),
    FOREIGN KEY(question_id) REFERENCES questions(question_id),
    FOREIGN KEY(exam_id) REFERENCES exams(exam_id)
);

SELECT * FROM departments;
SELECT * FROM	positions;
SELECT * FROM  accounts;
DELETE FROM accounts WHERE account_id = 1;
UPDATE accounts SET fullname = "duy luc" WHERE account_id = 4;

INSERT INTO departments ( department_name )
VALUE 					("doloremque"),
						("magni"),
                        ("similique"),
                        ("sed"),
						("placeat"),
                        ("ut"),
                        ("voluptatum"),
                        ("accusamus"),
                        ("quo");
INSERT INTO positions 	( position_name )
VALUE 					("PM"),
						("Scrum Master"),
                        ("Dev"),
                        ('Test');
                        
INSERT INTO accounts (email       					,    	username			,    	fullname      			, department_id		, position_id			, create_date)
VALUE 				("melisa.jacobs@example.org"	,    "viviane.balistreri"	,		"Miss Andreane Lehner"	, 		5			,   1					,'2020-03-05'),
					("caterina10@example.com"		,		"aditya71"			,			"Elody Runte DDS"	,		1			,   2					,'2020-03-05'),
                    ("wolff.zelda@example.org"		,"mckayla86"				,"Flossie Pacocha"				,		2			,   3					,'2020-03-07'),
                    ("donnelly.everett@example.net"	,"quinten.sipes"			,"Moriah Collier MD"			, 	 	4			,   4					,'2020-03-10'),
                    ("spinka.brian@example.org"		,"demetris62"				,"Tatyana Erdman I"				,		6			,   3					,'2020-04-05'),
                    ("alex60@example.net"			,"lynn01"					,"Kayla Denesik"				,		8			,   1					,'2020-04-07'),
                    ("einar63@example.net"			,"grant.eric"				,"Kathleen"						, 		9			,   2					,'2020-04-07');
						