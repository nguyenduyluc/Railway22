DROP DATABASE IF EXISTS testing_system_assignment1;
CREATE DATABASE IF NOT EXISTS testing_system_assignment1;
USE testing_system_assignment1;

CREATE TABLE department
(
	department_id				INT,
	department_name				VARCHAR(100)
);

CREATE TABLE positions
(
	positions_id				INT,
    positions_name				VARCHAR(100)
);

CREATE TABLE accounts
(
	accounts_id					INT,
    email						VARCHAR(100),
    username					VARCHAR(100),
    fullname					VARCHAR(100),
    department_id				INT,
    positions_id				INT,
    createdate					DATE
);

CREATE TABLE `group`
(
	group_id					INT,
    groupname					VARCHAR(100),
    creator_id					INT,
    createdate					DATE
);

CREATE TABLE group_account
(
	group_id					INT,
    account_id					INT,
    joindate					DATE
);

CREATE TABLE type_question
(
	type_id						VARCHAR(100),
    typename					VARCHAR(100)
);

CREATE TABLE category_question
(
	category_id					INT,
    categoryname				VARCHAR(100)
);

CREATE TABLE question
(
	question_id					INT,
    content						INT,
    category_id					INT,
    type_id						INT,
    creator_id					INT,
    createdate					DATE
);

CREATE TABLE answer
(
	answer_id					INT,
    content						VARCHAR(100),
    question_id					INT,
    iscorrect					VARCHAR(100)
);

CREATE TABLE exam
(
	exam_id						INT,
    `code`						INT,
    title						VARCHAR(100),
    category_id					INT,
    duration					TIME,
    creator_id					INT,
    createdate					DATE
    );
    
CREATE TABLE exam_question
(
	exam_id						INT,
    question_id					INT
);

SELECT * FROM exam;