/* 0813 sy buy table에서 ammount -> amount로 수정*/
/* 0814 sy line table에서 regdate 추가*/

SET SESSION FOREIGN_KEY_CHECKS=0;

/* Drop Tables */

DROP TABLE IF EXISTS buy_detail;
DROP TABLE IF EXISTS buy;
DROP TABLE IF EXISTS Comment;
DROP TABLE IF EXISTS CS_board;
DROP TABLE IF EXISTS item_qna;
DROP TABLE IF EXISTS line;
DROP TABLE IF EXISTS item;
DROP TABLE IF EXISTS SNS_info;
DROP TABLE IF EXISTS sns_like;
DROP TABLE IF EXISTS SNS;
DROP TABLE IF EXISTS todolist;
DROP TABLE IF EXISTS user;




/* Create Tables */

CREATE TABLE buy
(
	-- 주문번호
	order_no int(100) NOT NULL COMMENT '주문번호',
	-- 회원아이디
	userid int(100) NOT NULL COMMENT '회원아이디',
	-- 수령자이름
	name varchar(20) NOT NULL COMMENT '수령자이름',
	-- 수령지주소
	address varchar(100) NOT NULL COMMENT '수령지주소',
	-- 수령자번호
	tel varchar(30) NOT NULL COMMENT '수령자번호',
	-- 주문날짜
	orderdate datetime NOT NULL COMMENT '주문날짜',
	-- 출고여부
	stat int NOT NULL COMMENT '출고여부',
	-- 총 금액
	amount int(100) NOT NULL COMMENT '총 금액',
	-- 배송메모
	memo varchar(200) COMMENT '배송메모',
	PRIMARY KEY (order_no)
);


CREATE TABLE buy_detail
(
	-- 주문번호
	order_no int(100) NOT NULL COMMENT '주문번호',
	-- 구분
	seq int NOT NULL COMMENT '구분',
	-- 상품번호
	item_no int NOT NULL COMMENT '상품번호',
	-- 옵션번호
	option_no int NOT NULL COMMENT '옵션번호',
	-- 내가 살려는 갯수
	quantity int NOT NULL COMMENT '내가 살려는 갯수',
	-- 요청사항
	detail varchar(200) COMMENT '요청사항',
	PRIMARY KEY (order_no, seq)
);


CREATE TABLE Comment
(
	-- sns번호
	sns_no int NOT NULL COMMENT 'sns번호',
	-- 댓글번호
	reply_no int NOT NULL COMMENT '댓글번호',
	-- 작성자
	userid varchar(30) NOT NULL COMMENT '작성자',
	-- 내용
	content varchar(300) NOT NULL COMMENT '내용',
	-- 등록일
	regdate datetime COMMENT '등록일',
	PRIMARY KEY (sns_no, reply_no)
);


CREATE TABLE CS_board
(
	board_no int NOT NULL,
	-- 공지사항/ FAQ/고객센터
	-- 
	type int(5) NOT NULL COMMENT '공지사항/ FAQ/고객센터
',
	-- 카테고리
	category int(5) COMMENT '카테고리',
	-- 작성자
	userid int(100) NOT NULL COMMENT '작성자',
	-- 제목
	subject varchar(50) COMMENT '제목',
	-- 내용
	content varchar(300) COMMENT '내용',
	-- 첨부파일
	fileurl varchar(500) COMMENT '첨부파일',
	regdate datetime,
	stat int(5),
	PRIMARY KEY (board_no)
);


CREATE TABLE item
(
   -- 상품번호
   item_no int NOT NULL COMMENT '상품번호',
   -- 판매자아이디
   userid varchar(30) NOT NULL COMMENT '판매자아이디',
   -- 상품코드
   code varchar(20) NOT NULL COMMENT '상품코드',
   -- 카테고리
   -- 1
   -- 2
   -- 3
   -- 4
   -- 5
   -- 6
   -- 7
   -- 8
   -- 9
   category int NOT NULL COMMENT '카테고리
1
2
3
4
5
6
7
8
9',
   -- 제목
   subject varchar(50) NOT NULL COMMENT '제목',
   -- 상품명
   item_name varchar(50) NOT NULL COMMENT '상품명',
   -- 상품가격
   price int(100) NOT NULL COMMENT '상품가격',
   -- 키워드 #
   keyword varchar(50) COMMENT '키워드 #',
   -- 상품사진
  	pictureUrl varchar(200) COMMENT '상품사진',
   -- 상품내용
   content varchar(500) COMMENT '상품내용',
   -- 등록일..필요할까요?
   regdate datetime COMMENT '등록일..필요할까요?',
   readcnt int,
   item_option varchar(100),
   size varbinary(50),
   PRIMARY KEY (item_no)
);

/*CREATE TABLE item_qna
(
	qna_no int NOT NULL,
	-- 상품번호
	item_no int NOT NULL COMMENT '상품번호',
	-- 문의종류
	type int NOT NULL COMMENT '문의종류',
	-- 회원아이디
	userid int(100) NOT NULL COMMENT '회원아이디',
	-- 문의제목
	-- 
	subject varchar(30) NOT NULL COMMENT '문의제목
',
	-- 문의내용
	content varchar(500) NOT NULL COMMENT '문의내용',
	-- 0공개
	-- 1비공개
	secret int NOT NULL COMMENT '0공개
1비공개',
	-- 등록시간
	regdate datetime COMMENT '등록시간',
	-- 답변내용
	reply varchar(500) COMMENT '답변내용',
	replyregdate datetime,
	PRIMARY KEY (qna_no)
);
*/
CREATE TABLE item_qna
(
	qna_no int NOT NULL,
	-- 상품번호
	item_no int NOT NULL COMMENT '상품번호',
	-- 문의종류
	type int NOT NULL COMMENT '문의종류',
	-- 회원아이디
	userid varchar(50) NOT NULL COMMENT '회원아이디',
	-- 문의내용
	content varchar(500) NOT NULL COMMENT '문의내용',
	-- 등록시간
	regdate datetime COMMENT '등록시간',
	PRIMARY KEY (qna_no)
);


CREATE TABLE line
(
	line_no int NOT NULL,
	-- 상품번호
	item_no int NOT NULL COMMENT '상품번호',
	userid varchar(30) NOT NULL,
	content varchar(500),
	evaluation int(10) NOT NULL,
	regdate datetime NOT NULL,
	PRIMARY KEY (line_no)
);


CREATE TABLE SNS
(
	-- sns번호
	sns_no int NOT NULL COMMENT 'sns번호',
	-- ootd, 리뷰, QnA
	type int(10) NOT NULL COMMENT 'ootd, 리뷰, QnA',
	-- 회원아이디
	userid int(100) NOT NULL COMMENT '회원아이디',
	-- 이미지
	imgurl varchar(200) COMMENT '이미지',
	-- 설명
	description varchar(300) COMMENT '설명',
	-- 등록일
	regdate datetime COMMENT '등록일',
	height int(5),
	weight int(5),
	PRIMARY KEY (sns_no)
);


CREATE TABLE SNS_info
(
	-- sns번호
	sns_no int NOT NULL COMMENT 'sns번호',
	-- item단과 ootd 단 구별?
	seq int NOT NULL COMMENT 'item단과 ootd 단 구별?',
	category int(10),
	isshopitem int(2),
	-- 상품코드 또는 브랜드명
	detail varchar(100) COMMENT '상품코드 또는 브랜드명',
	PRIMARY KEY (sns_no, seq)
);


CREATE TABLE sns_like
(
	-- sns번호
	sns_no int NOT NULL COMMENT 'sns번호',
	-- 회원아이디
	userid varchar(30) NOT NULL COMMENT '회원아이디',
	PRIMARY KEY (sns_no, userid)
);


CREATE TABLE todolist
(
	No int NOT NULL,
	duedate datetime,
	content varchar(30),
	fin enum('y','n') NOT NULL,
	PRIMARY KEY (No)
);


CREATE TABLE user
(
	no int(100) NOT NULL,
	-- 회원아이디
	userid varchar(20) NOT NULL COMMENT '회원아이디',
	-- 회원비밀번호
	password varchar(30) NOT NULL COMMENT '회원비밀번호',
	-- 닉네임
	nickname varchar(30) NOT NULL COMMENT '닉네임',
	-- 회원이메일
	email varchar(50) NOT NULL COMMENT '회원이메일',
	-- 회원전화번호
	phoneno varchar(30) COMMENT '회원전화번호',
	-- 나이
	age int(20) COMMENT '나이',
	-- 회원사진
	imgurl varchar(200) COMMENT '회원사진',
	-- 0남, 1여
	gender int(5) COMMENT '0남, 1여',
	comment varchar(100),
	-- 소셜구분
	sns_type int(10) COMMENT '소셜구분',
	-- 소셜아이디
	sns_id varchar(20) COMMENT '소셜아이디',
	-- 판매불가 0
	-- 판매가능 1
	seller int(2) NOT NULL COMMENT '판매불가 0
판매가능 1',
	-- 회원이름(실명)
	name varchar(20) COMMENT '회원이름(실명)',
	-- 회사이름
	com_name varchar(30) COMMENT '회사이름',
	-- 회사등록번호
	com_regist int(50) COMMENT '회사등록번호',
	-- 회사프로필사진
	com_img varchar(200) COMMENT '회사프로필사진',
	-- 회사번호
	com_tel varchar(30) COMMENT '회사번호',
	-- 가입날짜
	regdate datetime COMMENT '가입날짜',
	address varchar(100),
	order_memo varchar(100),
	order_tel varchar(30),
	PRIMARY KEY (no),
	UNIQUE (com_regist)
);



/* Create Foreign Keys */

ALTER TABLE buy_detail
	ADD FOREIGN KEY (order_no)
	REFERENCES buy (order_no)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE buy_detail
	ADD FOREIGN KEY (item_no)
	REFERENCES item (item_no)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE item_qna
	ADD FOREIGN KEY (item_no)
	REFERENCES item (item_no)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE line
	ADD FOREIGN KEY (item_no)
	REFERENCES item (item_no)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE Comment
	ADD FOREIGN KEY (sns_no)
	REFERENCES SNS (sns_no)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE SNS_info
	ADD FOREIGN KEY (sns_no)
	REFERENCES SNS (sns_no)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE sns_like
	ADD FOREIGN KEY (sns_no)
	REFERENCES SNS (sns_no)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE buy
	ADD FOREIGN KEY (userid)
	REFERENCES user (no)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE CS_board
	ADD FOREIGN KEY (userid)
	REFERENCES user (no)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE SNS
	ADD FOREIGN KEY (userid)
	REFERENCES user (no)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;



