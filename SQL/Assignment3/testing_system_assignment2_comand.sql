SELECT * FROM departments;
SELECT * FROM positions;
SELECT * FROM `Accounts`;
SELECT * FROM `Groups`;
SELECT * FROM Group_Accounts;
SELECT * FROM Type_questions;
SELECT * FROM Category_Questions;
SELECT * FROM Questions;
SELECT * FROM Answers;
SELECT * FROM Exams;
SELECT * FROM Exam_Questions;
-- Question 2: lấy ra tất cả các phòng ban
SELECT * 
FROM departments;

SELECT * 
FROM accounts;
-- Question 3: lấy ra id của phòng ban "Sale"
SELECT *
FROM departments
WHERE department_name = "sale";

-- Question 4: lấy ra thông tin account có full name dài nhất

SELECT * ,length(fullname) as ten_dai_nhat
FROM accounts
GROUP BY  length(fullname)
ORDER BY length(fullname) DESC
LIMIT 1;

SELECT * 
FROM accounts 
WHERE length(fullname) = (SELECT length(fullname)
						FROM accounts 
                        GROUP BY length(fullname)
                        ORDER BY length(fullname)
                        LIMIT 1);
  -- lấy ra thông tin của `account` có độ dai fullname bằng 13  
SELECT * , length(fullname) 
FROM accounts 
WHERE length(fullname)  = 13;
                        

  -- Question 4.5: lấy ra thông tin account có full name ngan nhat
 SELECT * 
 FROM `Accounts`
 WHERE length(fullname) = (SELECT length(fullname)
							FROM `Accounts`
                            GROUP BY length(fullname)
                            ORDER BY length(fullname)
                            LIMIT 1 );


-- Question 5: Lấy ra thông tin account có full name dài nhất và thuộc phòng ban có id=3 
SELECT * , length(fullname)
FROM accounts
WHERE department_id = 3;

-- Question 6: Lấy ra tên group đã tham gia trước ngày 20/12/2019

 SELECT group_name
 FROM `groups`
 WHERE create_date < '2019-12-20';


-- Question 7: Lấy ra ID của question có >= 4 câu trả lời

SELECT question_id
FROM answers
GROUP BY question_id
HAVING count(answer_id) >= 4;
 
-- Question 8: Lấy ra các mã đề thi có thời gian thi >= 60 phút và được tạo trước ngày 20/12/2019

SELECT `code`
FROM exams
WHERE  duration >= 60 AND createdate < '2019-12-20';

-- Question 9: Lấy ra 5 group được tạo gần đây nhất
SELECT * 
FROM  `groups`
GROUP BY create_date
ORDER BY create_date DESC
LIMIT 5;

-- Question 10: Đếm số nhân viên thuộc department có id = 2
SELECT COUNT(account_id) SO_NHAN_VIEN
FROM accounts
WHERE department_id = 2;

-- Question 11: Lấy ra nhân viên có tên bắt đầu bằng chữ "D" và kết thúc bằng chữ "o"
SELECT  *
FROM accounts
WHERE fullname LIKE 'D%o';

-- Question 12: Xóa tất cả các exam được tạo trước ngày 20/12/2019
DELETE FROM exams 
WHERE createdate < '2019-12-20';

-- Question 13: Xóa tất cả các question có nội dung bắt đầu bằng từ "câu hỏi"
DELETE FROM questions
WHERE content LIKE 'câu hỏi%';

-- Question 14: Update thông tin của account có id = 5 thành tên "Nguyễn Bá Lộc" và
-- email thành loc.nguyenba@vti.com.vn
UPDATE accounts SET fullname = "Nguyen Ba Loc",
					email = "loc.nguyenba@vti.com.vn"
WHERE account_id = 5 ;

-- Question 15: update account có id = 5 sẽ thuộc group có id = 4
UPDATE Group_Accounts SET account_id = 5
WHERE group_id = 4;

