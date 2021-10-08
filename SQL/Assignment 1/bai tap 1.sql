DROP DATABASE IF EXISTS Testing_system_assignment_1;
CREATE DATABASE Testing_system_assignment_1;
USE 			Testing_system_assignment_1;

DROP TABLE IF EXISTS Department, `position`, `Account`, `Group`, Group_Account, 
Type_question, Category_Question, Question, Answer, Exam, Exam_Question;
CREATE TABLE 	Department(
	DepartmentID 		INT AUTO_INCREMENT PRIMARY KEY,
	DepartmentName   	VARCHAR(50)
);


CREATE TABLE  `Position`(
	PositionID 			INT AUTO_INCREMENT PRIMARY KEY,
	PositionName 		ENUM("Dev", "Test", "Scrum Maste", "PM")
);


CREATE TABLE `Account`(
	AccountID		INT AUTO_INCREMENT PRIMARY KEY,
    Email 			VARCHAR(50),
    Username		VARCHAR(50),
    FullName		VARCHAR(50),
    DepartmentID	INT,
    PositionID		INT,
    CreateDate 		VARCHAR(50)
);


CREATE TABLE `group`(
	GroupID			INT AUTO_INCREMENT PRIMARY KEY,
    GroupName		VARCHAR(50),
    CreatorID		INT,
    CreateDate		VARCHAR(50)
);


CREATE TABLE Group_Account(
	GroupID			INT,
    AccountID		INT,
    JoinDate		VARCHAR(50),
    PRIMARY KEY(GroupID, AccountID)
);

CREATE TABLE Type_question(
	TypeID 			INT AUTO_INCREMENT PRIMARY KEY,
    TypeName		ENUM("Essay", "Mulitiple-Choice")
);

CREATE TABLE Category_Question(
	CategoryID 			INT AUTO_INCREMENT PRIMARY KEY,
	CategoryName		VARCHAR(100)
);

CREATE TABLE Question(
	QuestionID		INT AUTO_INCREMENT PRIMARY KEY,
	content			TEXT,
    CategoryID		INT,
    TypeID			INT,
    CreatorID		INT,
    CreateDate		DATE
);

CREATE TABLE Answer(
	AnswerID		INT AUTO_INCREMENT PRIMARY KEY,
    Content			VARCHAR(100),
    QuestionID		INT,
    isCorrect		BINARY
);

CREATE TABLE Exam(
	ExamID			INT AUTO_INCREMENT PRIMARY KEY,
    `code`			INT,
    Title			TEXT,
    CategoryID		INT,
    Duration		DATE,
    CreatorID		INT,
    CreateDate		DATE
);

CREATE TABLE Exam_Question(
	ExamID			INT AUTO_INCREMENT PRIMARY KEY,
    QuestionID		INT
);


