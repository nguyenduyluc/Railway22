-- Exercise 1: Tiếp tục với Database Testing System
-- (Sử dụng subquery hoặc CTE)
-- Question 1: Tạo view có chứa danh sách nhân viên thuộc phòng ban sale
CREATE VIEW danh_sach_nhan_vien AS 
								   SELECT  *  -- AS DANH_SACH_NAHN_VIEN
								   FROM accounts 
                                   WHERE department_id = ( SELECT department_id
															FROM departments
                                                            WHERE department_name = 'SALE') ;
 SELECT * FROM danh_sach_nhan_vien ;
-- Question 2: Tạo view có chứa thông tin các account tham gia vào nhiều group nhất

CREATE VIEW DANH_SACH_ACCOUNT1 AS		
								 SELECT *
                                 FROM accounts
                                 WHERE account_id = ( SELECT  GA.account_id
													FROM group_accounts GA
                                                    JOIN `groups` G ON  GA.group_id = G.group_id
                                                    GROUP BY GA.account_id 
                                                    ORDER BY COUNT(GA.group_id) DESC 
                                                    LIMIT 1) ;
	SELECT * FROM DANH_SACH_ACCOUNT1 ;
-- Question 3: Tạo view có chứa câu hỏi có những content quá dài (content quá 300 từ 
--  được coi là quá dài) và xóa nó đi
CREATE VIEW CAU_HOI_DAI_300TU AS
								SELECT  *
                                FROM questions 
                                WHERE length(content) =  ( SELECT length(content)  
															FROM questions
															WHERE LENGTH(content) > 300 ); 
 SELECT * FROM CAU_HOI_DAI_300TU ;
-- Question 4: Tạo view có chứa danh sách các phòng ban có nhiều nhân viên nhất
                                
        CREATE VIEW DANH_SACH_PHONG_BAN AS 
											SELECT *
                                            FROM departments 
                                            WHERE department_id =  ( SELECT department_id
																	FROM accounts
                                                                    GROUP BY department_id
                                                                    ORDER BY count(account_id) DESC
                                                                    LIMIT 1 ) ;
                                                                    
	SELECT * FROM DANH_SACH_PHONG_BAN ;
-- Question 5: Tạo view có chứa tất các các câu hỏi do user họ Nguyễn tạo
	CREATE VIEW CAU_HOI AS
							SELECT Q.content, A.fullname
							FROM accounts A
							JOIN questions  Q ON A.account_id = Q.creator_id
							 WHERE Q.question_id IN (  SELECT Q.question_id
														FROM accounts A
														JOIN questions  Q ON A.account_id = Q.creator_id
														WHERE A.fullname LIKE "Nguyen%" ) ;
				
	SELECT * FROM CAU_HOI ;