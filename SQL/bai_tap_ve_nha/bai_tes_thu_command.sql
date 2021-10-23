SELECT * FROM customer ;
SELECT * FROM car ;
SELECT * FROM car_order ;

-- Questions
-- 1. Tạo table với các ràng buộc và kiểu dữ liệu
-- Thêm ít nhất 5 bản ghi vào table.
-- 2. Viết lệnh lấy ra thông tin của khách hàng: tên, số lượng oto khách hàng đã
-- mua và sắp sếp tăng dần theo số lượng oto đã mua.

	SELECT C.`name`, CO.amount AS SO_LUONG_OTO
    FROM customer C
    INNER JOIN car_order CO 
			ON C.customer_id = CO.customer_id
	WHERE CO.startus = '1'
    GROUP BY CO.customer_id
    ORDER BY CO.amount ASC ;
    
    -- (HỌC NHÓM )
-- 3. Viết hàm (không có parameter) trả về tên hãng sản xuất đã bán được nhiều
-- oto nhất trong năm nay.
    DROP PROCEDURE IF EXISTS hang_sx_ban_nhieu ;
    DELIMITER $$
    CREATE PROCEDURE hang_sx_ban_nhieu() 
    BEGIN
		SELECT C.maker 
			FROM car C
			INNER JOIN car_order CO ON C.car_id = CO.car_id
			GROUP BY CO.car_id 
			HAVING  SUM(CO.amount) = ( SELECT  SUM(CO.amount)
								 FROM car C
								 INNER JOIN car_order CO ON C.car_id = CO.car_id
								 GROUP BY CO.car_id 
								 ORDER BY SUM(CO.amount) DESC
								 LIMIT 1);
	
    END $$
    DELIMITER ;
    
    
    
    
    DROP FUNCTION hang_sx_ban_nhieu;
    DELIMITER $$
    CREATE FUNCTION hang_sx_ban_nhieu() RETURNS VARCHAR(20) DETERMINISTIC
    BEGIN
			DECLARE out_maker varchar(20);
			SELECT C.maker INTO out_maker
			FROM car C
			INNER JOIN car_order CO ON C.car_id = CO.car_id
			GROUP BY CO.car_id 
			HAVING  SUM(CO.amount) = ( SELECT  SUM(CO.amount)
								 FROM car C
								 INNER JOIN car_order CO ON C.car_id = CO.car_id
								 GROUP BY CO.car_id 
								 ORDER BY SUM(CO.amount) DESC
								 LIMIT 1);
			RETURN out_maker;
    END$$
    DELIMITER ;
    SELECT hang_sx_ban_nhieu();

    
    
    SELECT C.maker 
    FROM car C
    INNER JOIN car_order CO ON C.car_id = CO.car_id
    GROUP BY CO.car_id 
    HAVING  SUM(CO.amount) = ( SELECT*  -- SUM(CO.amount)
						 FROM car C
						 INNER JOIN car_order CO ON C.car_id = CO.car_id
						 GROUP BY CO.car_id 
						 ORDER BY SUM(CO.amount) DESC
						 LIMIT 1);
    
    
-- 4. Viết 1 thủ tục (không có parameter) để xóa các đơn hàng đã bị hủy của
-- những năm trước. In ra số lượng bản ghi đã bị xóa.
 DROP PROCEDURE IF EXISTS hang_sx_ban_nhieu ; 
 DELIMITER $$
    CREATE PROCEDURE hang_sx_ban_nhieu() 
    BEGIN
		SELECT COUNT(*)
        FROM car_order WHERE YEAR (orderd_date ) < (SELECT YEAR (NOW())) AND startus = '2' ;
		DELETE FROM car_order WHERE YEAR (orderd_date ) < (SELECT YEAR (NOW())) AND startus = '2';
	
    END $$
    DELIMITER ;
    
    CALL hang_sx_ban_nhieu ;
    
   SELECT * FROM car_order ;
    
-- 5. Viết 1 thủ tục (có CustomerID parameter) để in ra thông tin của các đơn
-- hàng đã đặt hàng bao gồm: tên của khách hàng, mã đơn hàng, số lượng oto
-- và tên hãng sản xuất.
 SELECT	   CT.`name` ,CO.order_id , C.maker , CO.amount 
 FROM customer CT
 INNER JOIN  car_order CO ON CT.customer_id = CO.customer_id
 INNER JOIN car C ON C.car_id = CO.car_id
 GROUP BY CO.order_id 
 ORDER BY COUNT(CO.amount);
 
 USE bai_tesr
 DROP PROCEDURE IF EXISTS thong_tin_khach_hang 
 DELIMITER $$
 CREATE PROCEDURE thong_tin_khach_hang(IN CustomerID INT , OUT nameCustomer VARCHAR (20), OUT order_id VARCHAR (100) , OUT maker VARCHAR (20), OUT amount VARCHAR (100))
		BEGIN
			 SELECT	   CT.`name` ,CO.order_id , C.maker , CO.amount INTO nameCustomer, order_id, maker, amount
			 FROM customer CT
			 INNER JOIN  car_order CO ON CT.customer_id = CO.customer_id
			 INNER JOIN car C ON C.car_id = CO.car_id
             WHERE CT.customer_id = CustomerID ;
		END$$
DELIMITER ;

     CALL  thong_tin_khach_hang(2) ;
        

 

-- 6. Viết trigger để tránh trường hợp người dụng nhập thông tin không hợp lệ
-- vào database (DeliveryDate < OrderDate + 15).