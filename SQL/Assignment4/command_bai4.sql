-- Bài tập 4 :
-- Exercise 1: Join 
SELECT * FROM Departments;
SELECT * FROM positions;
SELECT * FROM `Accounts`;
SELECT * FROM `Groups`;
SELECT * FROM Group_Accounts;
SELECT * FROM Type_questions;
SELECT * FROM Category_Questions;
SELECT * FROM Questions;
SELECT * FROM Exams;
SELECT * FROM Exam_Questions;
SELECT * FROM answers;

-- Question 1: Viết lệnh để lấy ra danh sách nhân viên và thông tin phòng ban của họ
SELECT A.fullname,
		D.department_name
FROM `Accounts` A
LEFT JOIN Departments D ON A.department_id = D.department_id;

-- Question 2: Viết lệnh để lấy ra thông tin các account được tạo sau ngày 20/12/2010
SELECT * 
FROM `Accounts`
WHERE  create_date > "2010-12-20";


-- Question 3: Viết lệnh để lấy ra tất cả các developer
SELECT A.username ,A.fullname ,
		P.position_name
FROM `Accounts` A
INNER JOIN positions P ON A.position_id = P.position_id
WHERE position_name = "Dev";

-- Question 4: Viết lệnh để lấy ra danh sách các phòng ban có >3 nhân viên
SELECT D.department_name, COUNT(A.account_id) SO_NHAN_VIEN
FROM departments D
JOIN `Accounts` A ON D.department_id = A.department_id
GROUP BY A.department_id
HAVING count(A.department_id) >=3;


-- Question 5: Viết lệnh để lấy ra danh sách câu hỏi được sử dụng trong đề thi nhiều nhất 

 SELECT  GROUP_CONCAT(Q.content) AS DANH_SACH_CAU_HOI , E.title AS TEN_DE_THI , COUNT(Q.question_id) SO_CAU_HOI 
 FROM questions Q
 JOIN exam_questions EQ ON Q.question_id = EQ.question_id
 JOIN exams E ON EQ.exam_id = E.exam_id
 GROUP BY EQ.exam_id
 HAVING count(EQ.question_id) = (   SELECT  count(question_id)
							FROM exam_questions
							GROUP BY exam_id
							ORDER BY count(question_id) DESC
							LIMIT 1);
                            

-- Question 6: Thông kê mỗi category Question được sử dụng trong bao nhiêu Question
SELECT C.category_name,count(Q.question_id  ) SO_cau_hoi
FROM category_questions C
LEFT JOIN questions Q ON C.category_id = Q.category_id
GROUP BY Q.category_id ;


-- Question 7: Thông kê mỗi Question được sử dụng trong bao nhiêu Exam
SELECT Q.question_id , count(E.exam_id)
FROM questions Q 
INNER JOIN exam_questions E ON Q.question_id = E.question_id
GROUP BY E.question_id ;

-- Question 8: Lấy ra Question có nhiều câu trả lời nhất
SELECT Q.content   , COUNT(A.content) CAU_TRA_LOI
FROM questions Q
LEFT JOIN answers A ON Q.question_id = A.question_id
GROUP BY A.question_id
HAVING COUNT(A.answer_id) = (SELECT COUNT(answer_id)
							FROM answers
							GROUP BY question_id
							ORDER BY count(question_id) DESC
							LIMIT 1);
                         

-- - Question 8.3: Lấy ra  tất cả Question  có  câu trả lời và không có câu trả lời 	
SELECT Q.content , A.content
FROM questions Q
LEFT JOIN answers A ON Q.question_id = A.question_id; 


-- Question 9: Thống kê số lượng account trong mỗi group
SELECT G.group_name, count(GA.account_id) SO_THANH_VIEN
FROM group_accounts GA
JOIN `groups` G ON GA.group_id = G.group_id
GROUP BY GA.group_id ;

-- Question 10: Tìm chức vụ có ít người nhất
SELECT P.position_name , COUNT(A.account_id) so_nguoi,GROUP_CONCAT(A.fullname) ten
FROM positions P
 JOIN accounts A ON P.position_id = A.position_id 
GROUP BY A.position_id
 HAVING COUNT(A.account_id ) = (SELECT COUNT(account_id )
								 FROM accounts
                                 GROUP BY position_id 
                                ORDER BY COUNT(account_id )  
                               LIMIT 1);
 
-- Question 11: Thống kê mỗi phòng ban có bao nhiêu dev, test, scrum master, PM

SELECT D.department_name,P.position_name TEN_CHUC_VU ,COUNT(A.position_id ) SO_CHUC_VU
FROM departments D
JOIN accounts A ON D.department_id = A.department_id
JOIN positions P ON A.position_id = P.position_id
GROUP BY A.department_id ,A.position_id 
ORDER BY department_name ; 

-- Question 12: Lấy thông tin chi tiết của câu hỏi bao gồm: thông tin cơ bản của question, loại câu hỏi, ai là người tạo ra câu hỏi, câu trả lời là gì, .
SELECT   Q.content AS CAU_HOI ,T.type_name AS LOAI_CAU_HOI , C.fullname AS TEN_NGUOI_TAO, GROUP_CONCAT(A.content)  AS CAU_TRA_LOI
FROM answers A
JOIN questions Q  ON Q.question_id = A.question_id
JOIN type_questions T ON Q.type_id = T.type_id
JOIN accounts C ON Q.creator_id = C.account_id
GROUP BY Q.content   ;


-- Question 13: Lấy ra số lượng câu hỏi của mỗi loại tự luận hay trắc nghiệm

-- Question 14:Lấy ra group không có account nào

 SELECT G.group_id, G.group_name TEN_NHOM , GA.account_id THANH_VIEN
FROM  `groups` G
 LEFT JOIN  group_accounts GA ON G.group_id = GA.group_id
WHERE GA.account_id IS NULL;
 

-- Question 15: Lấy ra group không có account nào
-- Question 16: Lấy ra question không có answer nào
SELECT Q.question_id,Q.content cau_hoi , A.content cau_tra_loi
FROM questions Q
LEFT JOIN answers A ON Q.question_id = A.question_id
WHERE A.answer_id IS NULL;

-- Exercise 2: Union
-- Question 17:
-- a) Lấy các account thuộc nhóm thứ 1
SELECT A.account_id , A.username,A.email ,A.fullname
FROM accounts A
JOIN group_accounts GA ON GA.account_id  = A.account_id 
WHERE GA.group_id = 1;

-- b) Lấy các account thuộc nhóm thứ 2
SELECT A.account_id , A.username,A.email ,A.fullname
FROM accounts A
JOIN group_accounts GA ON GA.account_id  = A.account_id 
WHERE GA.group_id = 3;

-- c) Ghép 2 kết quả từ câu a) và câu b) sao cho không có record nào trùng nhau
SELECT A.account_id , A.username,A.email ,A.fullname
FROM accounts A
JOIN group_accounts GA ON GA.account_id  = A.account_id 
WHERE GA.group_id = 1
UNION
SELECT A.account_id , A.username,A.email ,A.fullname
FROM accounts A
JOIN group_accounts GA ON GA.account_id  = A.account_id 
WHERE GA.group_id = 3 ; 

-- Question 18:
-- a) Lấy các group có lớn hơn 5 thành viên
SELECT G.group_name,COUNT(GA.account_id) SO_THANH_VIEN , GA.group_id
FROM `groups` G
INNER JOIN group_accounts GA ON G.group_id = GA.group_id
GROUP BY GA.group_id
HAVING COUNT(GA.account_id) >= 5 ;

-- b) Lấy các group có nhỏ hơn 7 thành viên
SELECT G.group_name,COUNT(GA.account_id) SO_THANH_VIEN ,  GA.group_id
FROM `groups` G
INNER JOIN group_accounts GA ON G.group_id = GA.group_id
GROUP BY GA.group_id
HAVING COUNT(GA.account_id) < 7 ;

-- c) Ghép 2 kết quả từ câu a) và câu b) 
SELECT G.group_name,COUNT(GA.account_id) SO_THANH_VIEN , GA.group_id
FROM `groups` G
INNER JOIN group_accounts GA ON G.group_id = GA.group_id
GROUP BY GA.group_id
HAVING COUNT(GA.account_id) >=5
 UNION  
SELECT G.group_name,COUNT(GA.account_id) SO_THANH_VIEN ,  GA.group_id
FROM `groups` G
INNER JOIN group_accounts GA ON G.group_id = GA.group_id
GROUP BY GA.group_id
HAVING COUNT(GA.account_id) < 7  ; 