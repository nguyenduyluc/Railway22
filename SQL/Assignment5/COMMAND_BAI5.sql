-- Exercise 1: Tiếp tục với Database Testing System
-- (Sử dụng subquery hoặc CTE)
-- Question 1: Tạo view có chứa danh sách nhân viên thuộc phòng ban sale
CREATE VIEW danh_sach_nhan_vien AS 
								   SELECT  A.fullname AS DANH_SACH_NAHN_VIEN
								   FROM accounts A 
								   INNER JOIN departments D ON A.department_id = D.department_id
								   WHERE department_name = 'SALE' ;

-- Question 2: Tạo view có chứa thông tin các account tham gia vào nhiều group nhất
CREATE VIEW DANH_SACH_ACCOUNT AS 
								SELECT   A.*, COUNT(GA.group_id) AS SO_GROUP , GROUP_CONCAT(G.group_name) AS TEN_GROUP
                                FROM accounts A
                                INNER JOIN group_accounts GA ON A.account_id = GA.account_id
                                INNER JOIN `groups` G ON GA.group_id = G.group_id
                                GROUP BY  GA.account_id
                                ORDER BY COUNT(GA.group_id) DESC
                                LIMIT 1 ; 
-- Question 3: Tạo view có chứa câu hỏi có những content quá dài (content quá 300 từ 
--  được coi là quá dài) và xóa nó đi
CREATE VIEW CAU_HOI_DAI_300TU AS
								SELECT content  AS TEN_CAU_HOI , LENGTH(content) AS SO_TU_TRONG_CAU_HOI
								FROM questions
								WHERE LENGTH(content) > 300 ; 

-- Question 4: Tạo view có chứa danh sách các phòng ban có nhiều nhân viên nhất
CREATE VIEW DANH_SACH_PHONG_BAN AS 
								SELECT D.department_name AS ten_phong_ban , count(A.account_id) AS so_nhan_vien , GROUP_CONCAT(A.fullname) AS ten_nhan_vien
                                FROM accounts A
                                INNER JOIN departments D ON A.department_id = D.department_id
                                GROUP BY A.department_id
                                ORDER BY count(A.account_id) DESC
                                LIMIT 1 ;
-- Question 5: Tạo view có chứa tất các các câu hỏi do user họ Nguyễn tạo
CREATE VIEW nguoi_tao_cau_hoi AS 
								SELECT  A.fullname AS NGUOI_TAO_CAU_HOI , count(Q.content) AS SO_CAU_HOI ,GROUP_CONCAT(Q.content) AS TEN_CAU_HOI
                                FROM accounts A
                                JOIN questions Q ON A.account_id = Q.creator_id
                                GROUP BY A.account_id
                                HAVING A.fullname LIKE 'Nguyen%' ;
                    
				