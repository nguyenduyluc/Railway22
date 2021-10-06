);DROP DATABASE IF EXISTS Testing_system_assignment_1;
CREATE DATABASE Testing_system_assignment_1;
USE 			Testing_system_assignment_1;

DROP TABLE IF EXISTS Department;
CREATE TABLE 	Department(
	DepartmentID 		INT,
	DepartmentName   	VARCHAR(50)
);

DROP TABLE IF EXISTS Position;
CREATE TABLE  `Position`(
	PositionID 			INT,
	PositionName 		VARCHAR(50)
);

DROP TABLE IF EXISTS `Account`;
CREATE TABLE `Account`(
	AccountID		INT,
    Email 			VARCHAR(50),
    Username		VARCHAR(50),
    FullName		VARCHAR(50),
    DepartmentID	INT,
    PositionID		INT,
    CreateDate 		VARCHAR(50)
);

DROP TABLE IF EXISTS `group`;
CREATE TABLE `group`(
	GroupID			INT,
    GroupName		VARCHAR(50),
    CreatorID		INT,
    CreateDate		VARCHAR(50)
);

DROP TABLE IF EXISTS GroupAccount;
CREATE TABLE GroupAccount(
	GroupID			INT,
    AccountID		INT,
    JoinDate		VARCHAR(50)
);
DROP TABLE IF EXISTS TypeQuestion;
CREATE TABLE TypeQuestion(
	TypeID			INT,
    TypeName		VARCHAR(50)
);

DROP TABLE IF EXISTS CategoryQuestion;
CREATE TABLE CategoryQuestion(
	CategoryID 			INT,
	CategoryName		VARCHAR(50)
);

DROP TABLE IF EXISTS Question;
CREATE TABLE Question(
	QuestionID		INT,
	content			VARCHAR(100),
    CategoryID		INT,
    TypeID			INT,
    CreatorID		INT,
    CreateDate		VARCHAR(100)
);

DROP TABLE IF EXISTS Answer;
CREATE TABLE Answer(
	AnswerID		INT,
    Content			VARCHAR(100),
    QuestionID		INT,
    isCorrect		VARCHAR(100)
);

DROP TABLE IF EXISTS Exam;
CREATE TABLE Exam(
	ExamID			INT,
    `code`			INT,
    Title			VARCHAR(100),
    CategoryID		INT,
    Duration		VARCHAR(100),
    CreatorID		INT,
    CreateDate		VARCHAR(100)
);

DROP TABLE IF EXISTS ExamQuestion;
CREATE TABLE ExamQuestion(
	ExamID			INT,
    QuestionID		INT
);
