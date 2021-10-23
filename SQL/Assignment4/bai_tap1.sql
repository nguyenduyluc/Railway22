DROP DATABASE IF EXISTS BAI_TESR ;
CREATE DATABASE IF NOT EXISTS BAI_TESR ;
USE BAI_TESR ;

DROP TABLE IF EXISTS 
	customer,
	car ,
	car_order ;
CREATE DATABASE `bai_tesr` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

CREATE TABLE  customer  
(  customer_id   INT UNSIGNED AUTO_INCREMENT UNIQUE PRIMARY KEY ,
	`name`		 NVARCHAR (30) ,
    phone       INT UNSIGNED   ,
    email		VARCHAR(30)  ,
    address     VARCHAR (100) ,
    note 		TEXT 
) ;

CREATE TABLE car 
( 	car_id  	INT UNSIGNED AUTO_INCREMENT  UNIQUE PRIMARY KEY ,
	maker		ENUM ('HONDA','TOYOTA','NISSAN'),
    model 		INT,
   `year`		VARCHAR(10),
   color 		ENUM ('BLACK','WHITE','YELLOW'),
   note			TEXT
);

CREATE TABLE car_order
(
order_id				INT UNSIGNED AUTO_INCREMENT PRIMARY KEY ,
customer_id				INT UNSIGNED ,
car_id 					INT UNSIGNED ,
amount					INT DEFAULT (1),
saleprice				INT UNSIGNED ,
orderd_date				DATE,
delivery_date			DATE,
delivery_address		VARCHAR(100),
startus					ENUM ('0','1','2') DEFAULT '0' ,
note 					TEXT,
FOREIGN KEY(customer_id)REFERENCES customer(customer_id),
FOREIGN KEY(car_id)REFERENCES car(car_id)

);