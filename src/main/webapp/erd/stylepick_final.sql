-- --------------------------------------------------------
-- 호스트:                          127.0.0.1
-- 서버 버전:                        10.4.12-MariaDB - mariadb.org binary distribution
-- 서버 OS:                        Win64
-- HeidiSQL 버전:                  10.2.0.5599
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- stylepick 데이터베이스 구조 내보내기
CREATE DATABASE IF NOT EXISTS `stylepick` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `stylepick`;

-- 테이블 stylepick.board 구조 내보내기
CREATE TABLE IF NOT EXISTS `board` (
  `no` int(11) DEFAULT NULL,
  `title` varchar(50) DEFAULT NULL,
  `author` varchar(50) DEFAULT NULL,
  `seq` int(11) DEFAULT NULL,
  `category` varchar(50) DEFAULT NULL,
  `stat` varchar(50) DEFAULT NULL,
  `regtime` datetime DEFAULT NULL,
  `readcnt` int(11) DEFAULT 0,
  `content` text DEFAULT NULL,
  `file1` varchar(100) DEFAULT NULL,
  `openstatus` tinyint(1) DEFAULT NULL,
  `mail` tinyint(1) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 테이블 데이터 stylepick.board:~12 rows (대략적) 내보내기
DELETE FROM `board`;
/*!40000 ALTER TABLE `board` DISABLE KEYS */;
INSERT INTO `board` (`no`, `title`, `author`, `seq`, `category`, `stat`, `regtime`, `readcnt`, `content`, `file1`, `openstatus`, `mail`, `email`) VALUES
	(1, 'test 1', 'admin', 1, '구매', NULL, '2020-08-20 14:34:46', 15, NULL, NULL, 1, 0, NULL),
	(2, 'test 2', 'admin', 2, '구매', 'wait', '2020-08-18 20:17:40', 42, '질문 내용입니다질문 내용입니다질문 내용입니다질문 내용입니다질문 내용입니다질문 내용입니다질문 내용입니다질문 내용입니다질문 내용입니다질문 내용입니다질문 내용입니다질문 내용입니다질문 내용입니다질문 내용입니다질문 내용입니다질문 내용입니다질문 내용입니다질문 내용입니다질문 내용입니다질문 내용입니다질문 내용입니다질문 내용입니다질문 내용입니다질문 내용입니다질문 내용입니다질문 내용입니다질문 내용입니다질문 내용입니다질문 내용입니다질문 내용입니다질문 내용입니다질문 내용입니다질문 내용입니다질문 내용입니다질문 내용입니다질문 내용입니다질문 내용입니다', NULL, 1, 0, NULL),
	(3, 'test 3', 'admin', 3, '구매,상품,교환', 'faq', '2020-08-18 20:51:23', 8, NULL, NULL, 1, 0, NULL),
	(4, 'test 4', 'admin', 3, '판매,매출,세금', NULL, '2020-08-18 20:51:44', 2, NULL, NULL, 1, 0, NULL),
	(5, 'test 5', 'admin', 3, 'OOTD,소셜,팔로우', NULL, '2020-08-18 20:52:46', 4, NULL, NULL, 1, 0, NULL),
	(6, 'test 6', 'admin', 3, '기타,회원,탈퇴', NULL, '2020-08-18 20:53:06', 6, NULL, NULL, 1, 0, NULL),
	(7, 'test 7', 'admin', 3, '기타', NULL, '2020-08-20 14:34:48', 0, NULL, NULL, 1, 0, NULL),
	(8, 'test 8', 'admin', 3, 'OOTD,소셜,팔로우', NULL, '2020-08-20 14:45:30', 1, NULL, NULL, 1, 0, NULL),
	(9, 'test 9', 'admin', 3, '판매,상품,등록', NULL, '2020-08-20 14:48:11', 10, NULL, NULL, 1, 0, NULL),
	(11, '질문', 'test4', 2, '구매', 'complete', '2020-08-24 13:26:25', 21, '근로조건의 기준은 인간의 존엄성을 보장하도록 법률로 정한다. 농업생산성의 제고와 농지의 합리적인 이용을 위하거나 불가피한 사정으로 발생하는 농지의 임대차와 위탁경영은 법률이 정하는 바에 의하여 인정된다.\r\n\r\n대법관은 대법원장의 제청으로 국회의 동의를 얻어 대통령이 임명한다. 법관은 탄핵 또는 금고 이상의 형의 선고에 의하지 아니하고는 파면되지 아니하며, 징계처분에 의하지 아니하고는 정직·감봉 기타 불리한 처분을 받지 아니한다.\r\n\r\n공무원의 신분과 정치적 중립성은 법률이 정하는 바에 의하여 보장된다. 국무위원은 국정에 관하여 대통령을 보좌하며, 국무회의의 구성원으로서 국정을 심의한다.\r\n\r\n정기회의 회기는 100일을, 임시회의 회기는 30일을 초과할 수 없다. 국무회의는 대통령·국무총리와 15인 이상 30인 이하의 국무위원으로 구성한다. 군인은 현역을 면한 후가 아니면 국무위원으로 임명될 수 없다.\r\n\r\n대한민국의 영토는 한반도와 그 부속도서로 한다. 대통령이 궐위되거나 사고로 인하여 직무를 수행할 수 없을 때에는 국무총리, 법률이 정한 국무위원의 순서로 그 권한을 대행한다.\r\n\r\n사회적 특수계급의 제도는 인정되지 아니하며, 어떠한 형태로도 이를 창설할 수 없다. 국회의원은 법률이 정하는 직을 겸할 수 없다. 신체장애자 및 질병·노령 기타의 사유로 생활능력이 없는 국민은 법률이 정하는 바에 의하여 국가의 보호를 받는다.\r\n\r\n국무총리는 대통령을 보좌하며, 행정에 관하여 대통령의 명을 받아 행정각부를 통할한다. 국무위원은 국무총리의 제청으로 대통령이 임명한다. 헌법재판소의 조직과 운영 기타 필요한 사항은 법률로 정한다.\r\n\r\n대통령은 국무총리·국무위원·행정각부의 장 기타 법률이 정하는 공사의 직을 겸할 수 없다. 헌법재판소에서 법률의 위헌결정, 탄핵의 결정, 정당해산의 결정 또는 헌법소원에 관한 인용결정을 할 때에는 재판관 6인 이상의 찬성이 있어야 한다.\r\n\r\n모든 국민은 신체의 자유를 가진다. 누구든지 법률에 의하지 아니하고는 체포·구속·압수·수색 또는 심문을 받지 아니하며, 법률과 적법한 절차에 의하지 아니하고는 처벌·보안처분 또는 강제노역을 받지 아니한다.\r\n\r\n법률이 정하는 주요방위산업체에 종사하는 근로자의 단체행동권은 법률이 정하는 바에 의하여 이를 제한하거나 인정하지 아니할 수 있다. 혼인과 가족생활은 개인의 존엄과 양성의 평등을 기초로 성립되고 유지되어야 하며, 국가는 이를 보장한다.\r\n\r\n각급 선거관리위원회의 조직·직무범위 기타 필요한 사항은 법률로 정한다. 대법원에 대법관을 둔다. 다만, 법률이 정하는 바에 의하여 대법관이 아닌 법관을 둘 수 있다.\r\n\r\n언론·출판에 대한 허가나 검열과 집회·결사에 대한 허가는 인정되지 아니한다. 평화통일정책의 수립에 관한 대통령의 자문에 응하기 위하여 민주평화통일자문회의를 둘 수 있다.\r\n\r\n공무원은 국민전체에 대한 봉사자이며, 국민에 대하여 책임을 진다. 국가는 건전한 소비행위를 계도하고 생산품의 품질향상을 촉구하기 위한 소비자보호운동을 법률이 정하는 바에 의하여 보장한다.\r\n\r\n국가원로자문회의의 의장은 직전대통령이 된다. 다만, 직전대통령이 없을 때에는 대통령이 지명한다. 지방의회의 조직·권한·의원선거와 지방자치단체의 장의 선임방법 기타 지방자치단체의 조직과 운영에 관한 사항은 법률로 정한다.\r\n\r\n예비비는 총액으로 국회의 의결을 얻어야 한다. 예비비의 지출은 차기국회의 승인을 얻어야 한다. 감사위원은 원장의 제청으로 대통령이 임명하고, 그 임기는 4년으로 하며, 1차에 한하여 중임할 수 있다.', NULL, 1, 0, NULL),
	(12, 'fdg', '비회원', 2, '기타', 'wait', '2020-08-26 15:17:37', 1, 'sdfg', NULL, 1, 1, 'qwer11'),
	(13, '4', 'admin', 3, '구매,결제,환불', NULL, '2020-08-26 15:48:01', 0, '5', NULL, 1, 1, NULL);
/*!40000 ALTER TABLE `board` ENABLE KEYS */;

-- 테이블 stylepick.buy 구조 내보내기
CREATE TABLE IF NOT EXISTS `buy` (
  `order_no` int(100) NOT NULL COMMENT '주문번호',
  `userid` varchar(20) NOT NULL DEFAULT '' COMMENT '회원아이디',
  `name` varchar(20) NOT NULL COMMENT '수령자이름',
  `address` varchar(100) NOT NULL COMMENT '수령지주소',
  `tel` varchar(30) NOT NULL COMMENT '수령자번호',
  `orderdate` datetime NOT NULL COMMENT '주문날짜',
  `amount` int(100) NOT NULL COMMENT '총 금액',
  `memo` varchar(200) DEFAULT NULL COMMENT '배송메모',
  PRIMARY KEY (`order_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 테이블 데이터 stylepick.buy:~28 rows (대략적) 내보내기
DELETE FROM `buy`;
/*!40000 ALTER TABLE `buy` DISABLE KEYS */;
INSERT INTO `buy` (`order_no`, `userid`, `name`, `address`, `tel`, `orderdate`, `amount`, `memo`) VALUES
	(1, 'admin', '관리자', '안산시', '12345678', '2019-01-12 17:58:39', 20000, NULL),
	(2, 'jennie', '김제니', '서울시 양천구 목동서로 100 목동아파트 325-301', '821030000000', '2020-05-01 17:58:39', 10000, NULL),
	(3, 'gaeun', '이가은', '서울시 양천구 신정6동 목동아파트 1422-2001', '8210405245454', '2020-06-05 02:58:39', 30000, NULL),
	(4, 'rosie', '박채영', '서울시 강서구 양천로75길 22-21 이너스내안에 101-401', '82104052454400', '2020-08-05 02:58:39', 50000, NULL),
	(5, 'maxime', '맥스', '서울시 성동구 성수동1가 718 트리마제 101-1702', '821045454544', '2020-08-10 02:58:39', 100000, NULL),
	(6, 'stefan', '스테판', '서울시 성동구 성수동1가 718 트리마제 101-1702', '821045454544', '2020-08-10 02:58:39', 2500, NULL),
	(7, 'jieun', '이지은', '서울시 양천구 목동 962-1 목동트라팰리스이스턴에비뉴 A동4001호', '821000004545', '2020-08-11 02:58:39', 35000, NULL),
	(8, 'gaeun', '이가은', '서울시 양천구 신정6동 목동아파트 1422-2001', '8210405245454', '2020-08-15 02:58:39', 1000, NULL),
	(9, 'gaeun', '이가은', '서울시 양천구 신정6동 목동아파트 1422-2001', '8210405245454', '2020-08-16 02:58:39', 40000, NULL),
	(10, 'rosie', '박채영', '서울시 강서구 양천로75길 22-21 이너스내안에 101-401', '82104052454400', '2020-08-17 02:58:39', 15000, NULL),
	(11, 'admin', '관리자', '서울시 금천구', '01023546879', '2020-08-21 18:15:33', 30000, NULL),
	(12, 'test4', 'aaa', '07803 서울 강서구 강서로 375 (마곡동) bbb', '123', '2020-08-24 17:17:05', 0, 'ccc'),
	(13, 'test4', 'aaa', '07810 서울 강서구 마곡서로 9 (마곡동) bbb', '123', '2020-08-24 17:19:28', 0, 'ccc'),
	(14, 'test4', 'a', '48060 부산 해운대구 APEC로 17 (우동) bbb', '123', '2020-08-24 17:20:54', 0, 'asdfasdfasdf'),
	(15, 'test4', 'aaa', '07803 서울 강서구 강서로 375 (마곡동) ab', '123', '2020-08-24 17:29:24', 0, 'ccd'),
	(16, 'test4', 'aaa', '48060 부산 해운대구 APEC로 17 (우동) bbbb', '123123', '2020-08-24 17:34:46', 0, 'qwerqwer'),
	(17, 'test4', 'aaa', '48060 부산 해운대구 APEC로 17 (우동) bbb', '123123', '2020-08-24 17:36:26', 0, 'asdfasdf'),
	(18, 'test4', 'test4', '04047 서울 마포구 독막로3길 24-10 (서교동) aa', '12345678', '2020-08-24 18:00:49', 0, 'qwr123'),
	(19, 'test4', 'qq', '38803 경북 영천시 신녕면 구디티길 6 ww', '123123', '2020-08-24 18:04:55', 0, 'qwer1234!'),
	(20, 'test4', '받는분', '13473 경기 성남시 분당구 경부고속도로 409 (삼평동) 36', '0001113334', '2020-08-24 18:09:30', 0, '234234ㅂㅂ'),
	(21, 'test4', 'werwer', '48060 부산 해운대구 APEC로 30 (우동) 123', '123123', '2020-08-24 18:13:33', 0, 'wer'),
	(22, 'test4', 'qqq', '01062 서울 강북구 덕릉로 93 (번동) www', '123123', '2020-08-24 18:19:26', 0, 'eee'),
	(23, 'test4', 'qwe', '01062 서울 강북구 덕릉로 93 (번동) qq', '123213', '2020-08-24 18:21:11', 0, 'qweqwe'),
	(24, 'test4', '234234', '07805 서울 강서구 마곡동로 30 (마곡동) qwerw', '1234', '2020-08-24 18:24:23', 0, 'qwewqe'),
	(25, 'test4', '123', '01000 서울 강북구 방학로 382 (우이동) a', '123', '2020-08-25 13:44:41', 0, '123q'),
	(26, 'test4', 'qwer', '06362 서울 강남구 밤고개로 76-2 (수서동) aa', '123213', '2020-08-25 13:46:04', 0, 'sdfwer'),
	(27, 'test4', '34', '61954 광주 서구 2순환로 2275 (치평동) qq', '22', '2020-08-25 14:01:48', 0, '33'),
	(28, 'admin', '편창현', '06281 서울 강남구 남부순환로 2907 (대치동) 지구대', '12345678', '2020-08-25 15:05:41', 0, '');
/*!40000 ALTER TABLE `buy` ENABLE KEYS */;

-- 테이블 stylepick.buy_detail 구조 내보내기
CREATE TABLE IF NOT EXISTS `buy_detail` (
  `order_no` int(100) NOT NULL COMMENT '주문번호',
  `seq` int(11) NOT NULL COMMENT '구분',
  `item_no` int(11) NOT NULL COMMENT '상품번호',
  `quantity` int(11) NOT NULL COMMENT '내가 살려는 갯수',
  `item_option` varchar(50) NOT NULL DEFAULT '' COMMENT '옵션번호',
  `size` varchar(50) NOT NULL DEFAULT '',
  `stat` int(11) NOT NULL COMMENT '출고여부 0=배송전 1=배송중 2=배송완료',
  `reviewed` int(2) NOT NULL,
  PRIMARY KEY (`order_no`,`seq`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 테이블 데이터 stylepick.buy_detail:~28 rows (대략적) 내보내기
DELETE FROM `buy_detail`;
/*!40000 ALTER TABLE `buy_detail` DISABLE KEYS */;
INSERT INTO `buy_detail` (`order_no`, `seq`, `item_no`, `quantity`, `item_option`, `size`, `stat`, `reviewed`) VALUES
	(1, 1, 1, 2, '1', '0', 2, 1),
	(1, 2, 2, 1, '2', '0', 2, 0),
	(2, 1, 2, 2, '1', '0', 2, 0),
	(3, 1, 2, 2, '1', '0', 1, 0),
	(4, 1, 2, 2, '1', '0', 1, 0),
	(5, 1, 2, 2, '1', '0', 1, 0),
	(6, 1, 2, 2, '1', '0', 0, 0),
	(7, 1, 2, 2, '1', '0', 0, 0),
	(8, 1, 2, 2, '1', '0', 0, 0),
	(9, 1, 2, 2, '1', '0', 1, 0),
	(10, 1, 2, 2, '1', '0', 1, 0),
	(11, 1, 4, 2, '1', '0', 0, 0),
	(15, 1, 1, 2, '1', '1', 0, 0),
	(17, 1, 5, 3, '3', '1', 0, 0),
	(18, 1, 5, 3, 'test4', 'test', 0, 0),
	(19, 1, 5, 4, 'test2', 'test', 0, 0),
	(20, 1, 3, 4, 'test', 'test', 0, 0),
	(21, 1, 5, 3, 'test4', 'test', 0, 0),
	(21, 2, 1, 8, 'test', 'test', 0, 0),
	(22, 1, 5, 3, 'test2', 'test', 0, 0),
	(23, 1, 5, 2, 'test3', 'test', 0, 0),
	(23, 2, 3, 3, 'test', 'test', 0, 0),
	(24, 1, 5, 3, 'test2', 'test', 0, 0),
	(24, 2, 2, 3, 'test', 'test', 0, 0),
	(25, 1, 1, 3, 'test', 'test', 0, 0),
	(26, 1, 4, 1, 'test', '사이즈', 0, 0),
	(27, 1, 3, 1, '옵션', '사이즈', 0, 0),
	(27, 2, 5, 1, 'test3', '사이즈', 0, 0),
	(28, 1, 2, 1, 'test', 'test', 0, 0),
	(28, 2, 4, 1, 'test', 'test', 0, 0);
/*!40000 ALTER TABLE `buy_detail` ENABLE KEYS */;

-- 테이블 stylepick.comment 구조 내보내기
CREATE TABLE IF NOT EXISTS `comment` (
  `sns_no` int(11) NOT NULL COMMENT 'sns번호',
  `reply_no` int(11) NOT NULL COMMENT '댓글번호',
  `userid` varchar(30) NOT NULL COMMENT '작성자',
  `content` varchar(300) NOT NULL COMMENT '내용',
  `regdate` datetime DEFAULT NULL COMMENT '등록일',
  PRIMARY KEY (`sns_no`,`reply_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 테이블 데이터 stylepick.comment:~11 rows (대략적) 내보내기
DELETE FROM `comment`;
/*!40000 ALTER TABLE `comment` DISABLE KEYS */;
INSERT INTO `comment` (`sns_no`, `reply_no`, `userid`, `content`, `regdate`) VALUES
	(1, 1, 'admin', '', '2020-08-20 13:56:12'),
	(4, 1, 'test4', 'test', '2020-08-18 14:05:27'),
	(4, 2, 'test4', 'test', '2020-08-18 14:06:27'),
	(4, 3, 'test4', 'test', '2020-08-18 14:08:08'),
	(4, 4, 'test4', 'test', '2020-08-18 14:09:37'),
	(4, 5, 'test4', 'test4', '2020-08-18 14:25:26'),
	(4, 6, 'admin', '', '2020-08-21 15:32:26'),
	(4, 7, 'admin', '', '2020-08-21 15:32:27'),
	(4, 8, 'admin', '', '2020-08-21 15:32:27'),
	(4, 9, 'admin', '', '2020-08-21 15:32:28'),
	(14, 1, 'aa', 'd', '2020-08-26 14:44:04');
/*!40000 ALTER TABLE `comment` ENABLE KEYS */;

-- 테이블 stylepick.follow 구조 내보내기
CREATE TABLE IF NOT EXISTS `follow` (
  `userid` varchar(20) NOT NULL,
  `following` varchar(30) NOT NULL,
  PRIMARY KEY (`userid`,`following`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 테이블 데이터 stylepick.follow:~0 rows (대략적) 내보내기
DELETE FROM `follow`;
/*!40000 ALTER TABLE `follow` DISABLE KEYS */;
INSERT INTO `follow` (`userid`, `following`) VALUES
	('test4', 'admin');
/*!40000 ALTER TABLE `follow` ENABLE KEYS */;

-- 테이블 stylepick.item 구조 내보내기
CREATE TABLE IF NOT EXISTS `item` (
  `item_no` int(11) NOT NULL COMMENT '상품번호',
  `userid` varchar(30) NOT NULL COMMENT '판매자아이디',
  `code` varchar(20) NOT NULL COMMENT '상품코드',
  `category` int(11) NOT NULL COMMENT '카테고리\r\n1\r\n2\r\n3\r\n4\r\n5\r\n6\r\n7\r\n8\r\n9',
  `subject` varchar(50) NOT NULL COMMENT '제목',
  `item_name` varchar(50) NOT NULL COMMENT '상품명',
  `price` int(100) NOT NULL COMMENT '상품가격',
  `keyword` varchar(50) DEFAULT NULL COMMENT '키워드 #',
  `pictureUrl` varchar(200) DEFAULT NULL COMMENT '상품사진',
  `content` varchar(500) DEFAULT NULL COMMENT '상품내용',
  `regdate` datetime DEFAULT NULL COMMENT '등록일..필요할까요?',
  `readcnt` int(11) DEFAULT NULL,
  `item_option` varchar(100) DEFAULT NULL,
  `size` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`item_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 테이블 데이터 stylepick.item:~5 rows (대략적) 내보내기
DELETE FROM `item`;
/*!40000 ALTER TABLE `item` DISABLE KEYS */;
INSERT INTO `item` (`item_no`, `userid`, `code`, `category`, `subject`, `item_name`, `price`, `keyword`, `pictureUrl`, `content`, `regdate`, `readcnt`, `item_option`, `size`) VALUES
	(1, 'admin', 'ㅇㄴㅁ', 1, 'test1', 'test1', 10000, 'test', 'S_10.jpg', 'test', '2020-08-21 16:00:36', 1295, 'test,test,test,test,test', 'test,test,test,test'),
	(2, 'admin', 'test', 1, 'test2', 'test2', 10000, 'test', 'pic07.png', 'test', '2020-08-21 17:21:15', 101, 'test,test,test,test,test', 'test,test,test,test'),
	(3, 'admin', 'test', 6, 'test22', 'test3', 10000, 'test', 'pic00.png', 'test', '2020-08-24 10:05:05', 23, 'test,test,test,test,test', 'test,test,test,test'),
	(4, 'admin', 'test', 4, 'test22', 'test4', 10000, 'test', 'S_4.jpg', 'test', '2020-08-24 10:05:39', 30, 'test,test,test,test,test', 'test,test,test,test'),
	(5, 'admin', '102154', 1, '제목1', '튤립', 11111, '#파랑, #초록', 'Tulips.jpg', '<p>튜우우우우립</p>\r\n', '2020-08-25 18:06:57', 18, '파란색', '60');
/*!40000 ALTER TABLE `item` ENABLE KEYS */;

-- 테이블 stylepick.item_qna 구조 내보내기
CREATE TABLE IF NOT EXISTS `item_qna` (
  `qna_no` int(11) NOT NULL,
  `item_no` int(11) NOT NULL COMMENT '상품번호',
  `type` int(11) NOT NULL COMMENT '문의종류',
  `userid` varchar(50) DEFAULT NULL COMMENT '회원아이디',
  `content` varchar(500) DEFAULT NULL COMMENT '문의내용',
  `regdate` datetime DEFAULT NULL COMMENT '등록시간',
  `grp` int(10) DEFAULT NULL,
  `grplevel` int(10) DEFAULT NULL,
  `grpstep` int(10) DEFAULT NULL,
  PRIMARY KEY (`qna_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 테이블 데이터 stylepick.item_qna:~5 rows (대략적) 내보내기
DELETE FROM `item_qna`;
/*!40000 ALTER TABLE `item_qna` DISABLE KEYS */;
INSERT INTO `item_qna` (`qna_no`, `item_no`, `type`, `userid`, `content`, `regdate`, `grp`, `grplevel`, `grpstep`) VALUES
	(1, 1, 0, '', '1', '2020-08-26 17:49:37', 1, 0, 0),
	(2, 1, 0, '', '2', '2020-08-26 17:49:39', 2, 0, 0),
	(3, 1, 0, '', '3', '2020-08-26 17:49:41', 3, 0, 0),
	(4, 1, 1, '', '1', '2020-08-26 17:49:45', 2, 1, 1),
	(5, 1, 1, '', 'ㅇㅇㅇ', '2020-08-26 17:53:07', 3, 1, 1);
/*!40000 ALTER TABLE `item_qna` ENABLE KEYS */;

-- 테이블 stylepick.line 구조 내보내기
CREATE TABLE IF NOT EXISTS `line` (
  `line_no` int(11) NOT NULL,
  `item_no` int(11) NOT NULL COMMENT '상품번호',
  `userid` varchar(30) NOT NULL,
  `content` varchar(500) DEFAULT NULL,
  `evaluation` int(10) NOT NULL,
  `regdate` datetime DEFAULT NULL,
  `order_no` int(100) DEFAULT NULL,
  `seq` int(100) DEFAULT NULL,
  PRIMARY KEY (`line_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 테이블 데이터 stylepick.line:~5 rows (대략적) 내보내기
DELETE FROM `line`;
/*!40000 ALTER TABLE `line` DISABLE KEYS */;
INSERT INTO `line` (`line_no`, `item_no`, `userid`, `content`, `evaluation`, `regdate`, `order_no`, `seq`) VALUES
	(1, 1, '', 'dasd', 2, '2020-08-26 11:16:40', NULL, NULL),
	(3, 1, '', '', 1, '2020-08-26 11:25:53', NULL, NULL),
	(4, 1, 'abcdef', 'dasdas', 4, '2020-08-26 12:16:40', NULL, NULL),
	(5, 1, '', 'dddddddddddddddddddddddddddddddddddddddddddddddddd', 3, '2020-08-26 14:02:19', NULL, NULL),
	(6, 1, '', '너무 너무 예쁘고 사긴 잘한 것 같아요 정말 감합니다 잘 쓰겠습니다...아ㅣ라ㅣㅇ너얄너이런', 4, '2020-08-26 14:02:47', NULL, NULL);
/*!40000 ALTER TABLE `line` ENABLE KEYS */;

-- 테이블 stylepick.reply 구조 내보내기
CREATE TABLE IF NOT EXISTS `reply` (
  `rno` int(11) DEFAULT NULL,
  `bno` int(11) DEFAULT NULL,
  `regtime` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 테이블 데이터 stylepick.reply:~0 rows (대략적) 내보내기
DELETE FROM `reply`;
/*!40000 ALTER TABLE `reply` DISABLE KEYS */;
/*!40000 ALTER TABLE `reply` ENABLE KEYS */;

-- 테이블 stylepick.sns 구조 내보내기
CREATE TABLE IF NOT EXISTS `sns` (
  `sns_no` int(11) NOT NULL COMMENT 'sns번호',
  `type` int(10) NOT NULL COMMENT 'ootd, 리뷰, QnA',
  `userid` varchar(50) NOT NULL DEFAULT '' COMMENT '회원아이디',
  `img1` varchar(200) DEFAULT NULL COMMENT '이미지',
  `description` varchar(300) DEFAULT NULL COMMENT '설명',
  `regdate` datetime DEFAULT NULL COMMENT '등록일',
  `height` int(5) DEFAULT NULL,
  `weight` int(5) DEFAULT NULL,
  PRIMARY KEY (`sns_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 테이블 데이터 stylepick.sns:~14 rows (대략적) 내보내기
DELETE FROM `sns`;
/*!40000 ALTER TABLE `sns` DISABLE KEYS */;
INSERT INTO `sns` (`sns_no`, `type`, `userid`, `img1`, `description`, `regdate`, `height`, `weight`) VALUES
	(1, 1, 'admin', 'pic02.png', '설명', '2020-08-14 10:15:29', 180, 80),
	(2, 1, 'admin', 'pic02.png', '설명', '2020-08-14 10:17:37', 180, 80),
	(3, 1, 'test4', 'test12.PNG', 'test4', '2020-08-14 13:54:53', 50, 160),
	(4, 1, 'test4', 'test2.PNG', 'teset4', '2020-08-14 13:57:28', 50, 160),
	(5, 1, 'test4', 'test3.PNG', 'test4', '2020-08-14 14:05:08', 50, 160),
	(6, 1, 'test4', 'test1.PNG', 'test4', '2020-08-14 14:11:21', 50, 160),
	(7, 1, 'admin', 'test11.PNG', '으아아아아아아아아', '2020-08-24 16:38:05', 150, 50),
	(8, 1, 'admin', 'test11.PNG', '으아아아아아아아아아', '2020-08-24 16:57:48', 150, 50),
	(9, 1, 'admin', 'test9.PNG', '으아아아아아아아', '2020-08-24 17:43:59', 0, 0),
	(10, 1, 'admin', 'test9.PNG', 'test', '2020-08-24 17:45:23', 0, 0),
	(11, 1, 'jennie', 'test10.PNG', 'test', '2020-08-25 14:38:14', 0, 0),
	(12, 1, 'jennie', 'test9.PNG', 'test', '2020-08-25 14:38:25', 0, 0),
	(13, 1, 'jennie', 'test11.PNG', 'test', '2020-08-25 14:38:34', 0, 0),
	(14, 1, 'aa', 'S_3.jpg', '', '2020-08-26 13:58:16', 150, 60);
/*!40000 ALTER TABLE `sns` ENABLE KEYS */;

-- 테이블 stylepick.snsitem 구조 내보내기
CREATE TABLE IF NOT EXISTS `snsitem` (
  `sns_no` int(11) NOT NULL COMMENT 'sns번호',
  `seq` int(11) NOT NULL COMMENT 'item단과 ootd 단 구별?',
  `category` varchar(50) DEFAULT NULL,
  `isshopitem` int(2) DEFAULT NULL,
  `detail` varchar(100) DEFAULT NULL COMMENT '상품코드 또는 브랜드명',
  PRIMARY KEY (`sns_no`,`seq`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 테이블 데이터 stylepick.snsitem:~13 rows (대략적) 내보내기
DELETE FROM `snsitem`;
/*!40000 ALTER TABLE `snsitem` DISABLE KEYS */;
INSERT INTO `snsitem` (`sns_no`, `seq`, `category`, `isshopitem`, `detail`) VALUES
	(6, 1, 'outer', 0, 'test4'),
	(8, 1, 'hat', 1, 'test1'),
	(8, 2, 'bottom', 5, 'test22'),
	(8, 3, 'shoes', 0, 'test3'),
	(9, 1, 'hat', 1, 'test1'),
	(9, 2, 'bottom', 5, 'test22'),
	(9, 3, 'shoes', 0, 'test3'),
	(10, 1, 'hat', 1, 'test1'),
	(10, 2, 'outer', 0, 'test2'),
	(11, 1, 'hat', 1, 'test1'),
	(12, 1, 'hat', 1, 'test1'),
	(13, 1, 'hat', 1, 'test1'),
	(14, 1, 'watch', 0, '오버워치');
/*!40000 ALTER TABLE `snsitem` ENABLE KEYS */;

-- 테이블 stylepick.sns_like 구조 내보내기
CREATE TABLE IF NOT EXISTS `sns_like` (
  `sns_no` int(11) NOT NULL COMMENT 'sns번호',
  `userid` varchar(30) NOT NULL COMMENT '회원아이디',
  `regdate` datetime NOT NULL COMMENT '좋아요날짜',
  PRIMARY KEY (`sns_no`,`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 테이블 데이터 stylepick.sns_like:~1 rows (대략적) 내보내기
DELETE FROM `sns_like`;
/*!40000 ALTER TABLE `sns_like` DISABLE KEYS */;
INSERT INTO `sns_like` (`sns_no`, `userid`, `regdate`) VALUES
	(1, 'admin', '0000-00-00 00:00:00'),
	(13, '', '2020-08-25 17:30:41');
/*!40000 ALTER TABLE `sns_like` ENABLE KEYS */;

-- 테이블 stylepick.todolist 구조 내보내기
CREATE TABLE IF NOT EXISTS `todolist` (
  `No` int(11) NOT NULL,
  `duedate` datetime DEFAULT NULL,
  `content` varchar(30) DEFAULT NULL,
  `fin` enum('y','n') NOT NULL,
  PRIMARY KEY (`No`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 테이블 데이터 stylepick.todolist:~0 rows (대략적) 내보내기
DELETE FROM `todolist`;
/*!40000 ALTER TABLE `todolist` DISABLE KEYS */;
/*!40000 ALTER TABLE `todolist` ENABLE KEYS */;

-- 테이블 stylepick.user 구조 내보내기
CREATE TABLE IF NOT EXISTS `user` (
  `no` int(100) NOT NULL,
  `userid` varchar(20) NOT NULL COMMENT '회원아이디',
  `password` varchar(30) NOT NULL COMMENT '회원비밀번호',
  `nickname` varchar(30) NOT NULL COMMENT '닉네임',
  `email` varchar(50) NOT NULL COMMENT '회원이메일',
  `tel` varchar(30) DEFAULT NULL COMMENT '회원전화번호',
  `age` int(20) DEFAULT NULL COMMENT '나이',
  `imgurl` varchar(200) DEFAULT NULL COMMENT '회원사진',
  `gender` int(5) DEFAULT NULL COMMENT '0남, 1여',
  `comment` varchar(100) DEFAULT NULL,
  `sns_type` int(10) DEFAULT NULL COMMENT '소셜구분',
  `sns_id` varchar(20) DEFAULT NULL COMMENT '소셜아이디',
  `seller` int(2) NOT NULL COMMENT '판매불가 0, 판매가능 1',
  `name` varchar(20) DEFAULT NULL COMMENT '회원이름(실명)',
  `com_name` varchar(30) DEFAULT NULL COMMENT '회사이름',
  `com_regist` varchar(50) DEFAULT NULL COMMENT '회사등록번호',
  `com_img` varchar(200) DEFAULT NULL COMMENT '회사프로필사진',
  `com_tel` varchar(30) DEFAULT NULL COMMENT '회사번호',
  `regdate` datetime DEFAULT NULL COMMENT '가입날짜',
  `address` varchar(100) DEFAULT NULL,
  `order_memo` varchar(100) DEFAULT NULL,
  `order_tel` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 테이블 데이터 stylepick.user:~12 rows (대략적) 내보내기
DELETE FROM `user`;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` (`no`, `userid`, `password`, `nickname`, `email`, `tel`, `age`, `imgurl`, `gender`, `comment`, `sns_type`, `sns_id`, `seller`, `name`, `com_name`, `com_regist`, `com_img`, `com_tel`, `regdate`, `address`, `order_memo`, `order_tel`) VALUES
	(1, 'admin', '1234', '관리자', 'admin@stylepick.shop', ' 012345678', 26, 'pic05.png', 1, '관리자입니다.', NULL, NULL, 1, '김관리', 'Una Coop', '1234', NULL, '1234', '2020-08-13 18:28:21', NULL, NULL, NULL),
	(2, 'test4', 'test4', 'test4', 'test4@aaa.com', '11', 21, NULL, 1, '', NULL, NULL, 1, 'test4', 'test4', 'test4', 'S_4.jpg', 'test4', '2020-08-14 10:01:58', NULL, NULL, NULL),
	(3, 'test3', '1234', 'test3', 'pyeon95@naver.com', '123456879', NULL, NULL, NULL, NULL, NULL, NULL, 1, 'test3', 'test3 comp', '111022', NULL, '12345678', '2020-08-21 14:37:31', NULL, NULL, NULL),
	(4, 'jennie', '1234', '김제니', 'jennie@google.com', '13070000000', 25, NULL, 2, '', NULL, NULL, 1, '김제니', '젠샵', '0000', NULL, '13070000000', '2019-08-13 18:28:21', NULL, NULL, NULL),
	(5, 'rosie', '1234', '박채영', 'rosie@google.com', '860000000000', 24, NULL, 2, '', NULL, NULL, 1, '박채영', '챙샵', '00001', NULL, '8600000000', '2019-05-05 18:28:21', NULL, NULL, NULL),
	(6, 'jieun', '1234', '이지은', 'jieun@google.com', '821000000000', 28, NULL, 2, '', NULL, NULL, 0, '', '', '', NULL, '', '2019-06-05 18:28:21', NULL, NULL, NULL),
	(7, 'gaeun', '1234', '이가은', 'gaeun@google.com', '82100000045454', 27, NULL, 2, '', NULL, NULL, 0, '', '', '', NULL, '', '2019-08-05 18:28:21', NULL, NULL, NULL),
	(8, 'stefan', '1234', '스테판', 'stefan@google.com', '44545454654010', 30, NULL, 1, '', NULL, NULL, 1, '스테판', '테팔', '1521212', NULL, '44545454545454', '2019-08-15 18:28:21', NULL, NULL, NULL),
	(9, 'maxime', '1234', '맥스', 'max@google.com', '100132145454', 34, NULL, 1, '', NULL, NULL, 1, '맥스', '맥시무스', '5857457', NULL, '10013214545454', '2019-08-16 18:28:21', NULL, NULL, NULL),
	(10, 'fion', '1234', '조진이', 'jianyi@google.com', '8640410457', 61, NULL, 2, '', NULL, NULL, 1, '조진이', '슈렉엔피온', '45450', NULL, '86404104547', '2019-08-17 18:28:21', NULL, NULL, NULL),
	(11, 'abcdef', '1234', 'hohoho', 'abc@naver.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '2020-08-24 15:30:30', NULL, NULL, NULL),
	(12, 'aa', 'aa', 'adsfasdf', 'aa@bb.cc', '111', 0, 'S_1.jpg', 0, '', NULL, NULL, 1, 'aa', 'aa company', '', 'pic03.png', '', '2020-08-26 10:36:12', NULL, NULL, NULL);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
