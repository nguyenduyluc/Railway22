INSERT INTO customer (			`name`				,			phone  				, 		email 						,		address					, 				note				)
VALUES      		 (    'Nguyen Chien Thang2'     , 			 0350123   			,'account1@gmail.com'			,   	' NAM_DINH	'				,			(N'to beo map')			),
					( 'Nguyen Van Chien'  			,     		 03503456			,    'ccount2@gmail.com'		,		' HAI_DUONG'				,			(N'GẦY DA ĐEN ')		),
					(   'Duong Do'	  				,    		 0350678  			,    'acount3@gmail.com'		,		' HANAM		'				,			(N'TRẮNG BÌNH THƯỜNG')	),
					(  'Ngo Ba Kha'  				,     		 0350987 			,    	'songcodaoly@gmail.com'	,		' BACNINH	'				,			(N'RÁT BẢNH')			),
					( 'Bui Xuan Huan'	     		,            0350654			,  'vtiaccademy@gmail.com'		,    	' BACGIANG	'   			,			(N'THẦY HUẤN ')	 		),
					('Duong Van Huu'	   			,      		 0350321			,    	'account4@gmail.com'	,   	' HANOI	'					 ,			(N'MỚI NGHỈ HƯU')  		);

INSERT INTO car (     		maker			,		model			,			`year`	 		, 				color 			, 			note									)
 VALUES 		(			'HONDA'			,		222				,			'2019'			,				'BLACK'			,			(N'XE ĐẸP MỚI MUA ')					),
				( 			'TOYOTA'		,		666				,			'2020'			,				'WHITE'			,			(N'XE TIÊU CHUẨN WTO')					),
				( 			'NISSAN'		,		777				,			'2019'			,				'BLACK'			,			(N'XE SẢN XUẤT SỐ MỘT THẾ GIỚI')		);
													
                
                
INSERT INTO car_order 	( customer_id 	,	car_id	,   amount      ,	saleprice		,	orderd_date 	 ,  delivery_date 		,       delivery_address		,	startus    ,						note							)
VALUES 				  	(   	1		,		2	,	 1		    ,	1000000000		,	'2019-04-05'	 ,		'2019-04-21'	,			'NAM_DINH'			,		'2'		,		(N'cân nặng cần hai ngươi vận chuyển ')				),
						(   	2		,		3	,	 5		    ,	300000000		,	'2020-04-05'	 ,		'2019-07-30'	,			'HAI_DUONG'			,		'2'		,		(N'rất vừa vô cùng vừa ')								),
						(   	3		,		1	,	 4			,	4000000000		,	'2021-04-07'	 ,		'2019-09-09'	,			' HANAM		'		,		'1'		,	  	(N'gần vừa cần một người vậnc huyển')			 	),
						(    	4		,		3	,	 2			,	2000000000		,	'2020-04-08'	 ,		'2020-010-08'	,			' BACNINH	'		,		'1'		,		(N'bao bì cẩn thận')					 				),
						(    	5		,		2	,	 3			,	1000000000		,	'2021-04-10'	 ,		'2020-011-10'	,			' BACGIANG	' 		,		'1'		,		(N'hàng dễ vỡ')						 					),
						(   	6		,		1	,	 1			,	3000000000		,	'2020-04-05'	 ,		'2020-05-05'	,			' HANOI	'			,		'1'		,		(N'hàng cũng dễ vỡ')								);
	







