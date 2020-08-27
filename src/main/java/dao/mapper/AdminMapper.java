package dao.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import logic.Board;
import logic.Buy;
import logic.Line;
import logic.Sns;
import logic.SnsItem;
import logic.Statistics;
import logic.Todolist;
import logic.User;

public interface AdminMapper {
	
	//dashboard index 1-1 이달 가입회원
	@Select("SELECT COUNT(*) FROM user WHERE regdate > (NOW() - INTERVAL 1 MONTH)")
	int newusers();
	//dashboard index 1-2 전체 회원
	@Select("SELECT COUNT(*) FROM user")
	int numofusers();
	//dashboard index 1-3 이달 매출
	@Select("SELECT IFNULL(SUM(amount),45000) FROM buy WHERE orderdate > (NOW() - INTERVAL 1 MONTH)")
	long salesofthismonth();
	//dashboard index 1-4 누적 매출
	@Select("SELECT IFNULL(SUM(amount),700000) FROM buy")
	long salesdata();
	//dashboard index 1-5 누적 리뷰
	@Select("SELECT COUNT(evaluation) FROM line")
	long numofreviews();
	//dashboard index 2-1 주간 매출
	@Select("SELECT DATE_FORMAT(orderdate, \"%Y-%m-%d\") 'orderdate', SUM(amount)'amount' FROM buy WHERE orderdate > (NOW() - INTERVAL 1 WEEK) GROUP BY DATE_FORMAT(orderdate, \"%Y-%m-%d\")")
	List<Buy> weeklyrevenue();
	//dashboard index 2-2 최근 4주간 매출
	@Select("SELECT " + 
			"FLOOR( DATEDIFF( CURRENT_DATE , orderdate ) / 7 ) AS weeks_ago, " + 
			"SUM(amount) amount " + 
			"FROM buy " + 
			"GROUP BY weeks_ago " + 
			"HAVING weeks_ago <=4 " + 
			"ORDER BY weeks_ago DESC ")
	List<Buy> monthlyrevenue();
	
	//widgets index 1-1 daily sales report
	@Select("SELECT order_no, orderdate, userid, amount FROM buy WHERE amount !=0 ORDER BY order_no DESC LIMIT 5")
	List<Buy> getSales(Map<String, Object> param);
	
	//widgets index 1-2 recently joined users
	@Select("SELECT no, userid, gender, age, regdate FROM user ORDER BY no DESC LIMIT 5")
	List<User> getUsers(Map<String, Object> param);
	
	//widgets index 2-1 이번 달 구매 회원 랭킹
	@Select("SELECT userid, SUM(amount) amount FROM buy WHERE orderdate > (NOW() - INTERVAL 1 MONTH) GROUP BY userid ORDER BY amount DESC LIMIT 10")
	List<Buy> monthlyheavyusers(Map<String, Object> param);
	
	//widgets index 2-2 올해 최다 구매 회원 랭킹
	@Select("SELECT userid, SUM(amount) amount FROM buy WHERE DATE_FORMAT(orderdate,'%Y') = DATE_FORMAT(CURDATE(),'%Y') GROUP BY userid ORDER BY amount DESC LIMIT 10")
	List<Buy> yearlyheavyusers(Map<String, Object> param);
	
	//widgets index 3-1 우수 입점 스토어 차트
	@Select("SELECT u.com_name, FLOOR( DATEDIFF( CURRENT_DATE , l.regdate ) / 7 ) AS weeks_ago, AVG(evaluation) evaluation FROM line l JOIN item r ON l.item_no=r.item_no JOIN user u ON l.userid=u.userid GROUP BY weeks_ago, u.com_name HAVING weeks_ago <=4 AND u.com_name IS NOT NULL AND u.com_name !=\"\" and evaluation IS NOT NULL ORDER BY evaluation DESC, u.com_name DESC LIMIT 3;")
	List<Line> topthreestores(Map<String, Object> param);
	
	//widgets index 3-2 최근 4주 별점 평균 상위 3개 스토어
	@Select("SELECT com_name, AVG(evaluation) evaluation FROM user JOIN line ON user.userid = line.userid WHERE FLOOR( DATEDIFF( CURRENT_DATE , line.regdate ) / 7 ) <=4  AND com_name !='' GROUP BY com_name ORDER BY evaluation DESC LIMIT 3")
	List<Line> getEvaluation(Map<String, Object> param);
	
	//charts index 1 스타일픽 회원 수
	@Select("SELECT seller, COUNT(NO) num FROM user GROUP BY seller")
	List<User> totnumofusers(Map<String, Object> param);
	
	//charts index 3 Yearly : 연 매출 현황
	@Select("SELECT DATE_FORMAT(orderdate,'%Y-%m') month, SUM(amount) amount FROM buy WHERE DATE_FORMAT(orderdate,'%Y') = DATE_FORMAT(CURRENT_DATE, '%Y') GROUP BY month")
	List<Buy> yearlyrevenue(Map<String, Object> param);
	
	//charts index 5 구매건 기준 매출 산점도
	@Select("SELECT user.userid, SUM(buy.amount) amount, DATE_FORMAT(user.regdate,'%Y-%m') regdate  from buy LEFT JOIN user ON buy.userid = user.userid WHERE orderdate > (NOW() - INTERVAL 1 YEAR) GROUP BY user.userid ORDER BY regdate")
	List<Buy> scatterplot(Map<String, Object> param);
	
	//charts index 6-1 카테고리별 판매 현황(월)
	@Select("SELECT item.category, SUM(buy.amount) amount FROM buy LEFT OUTER JOIN buy_detail ON buy.order_no = buy_detail.order_no LEFT OUTER JOIN item ON buy_detail.item_no=item.item_no WHERE DATE_FORMAT(orderdate,'%Y') = DATE_FORMAT(CURRENT_DATE, '%Y') GROUP BY item.category")
	List<Buy> salesbycategories(Map<String, Object> param);
	
	//charts index 7-2 상위 10개 스토어 (월 매출 기준)
	@Select("SELECT IFNULL(user.com_name,'기본샵') com_name, SUM(buy.amount) amount FROM buy JOIN user ON buy.userid=user.userid WHERE DATE_FORMAT(buy.orderdate,'%Y-%m')=DATE_FORMAT(CURDATE(),'%Y-%m') GROUP BY user.com_name HAVING user.com_name IS NOT NULL AND user.com_name !=\"\" ORDER BY amount DESC LIMIT 10")
	List<Buy> toptenstores(Map<String, Object> param);
	
	// charts index 4-1 지역별 매출 평균 barplot
	//@Select("SELECT SUBSTRING_INDEX(address, '구', 1) address, amount FROM buy ORDER BY address ASC")
	@Select("SELECT SUBSTRING(address, 7, 6) address, amount FROM buy WHERE amount !=0 ORDER BY address ASC")
	List<Buy> boxplot(Map<String, Object> param);
	
	//salesmgr 매출 관리 0822
	@Select("select * from buy order by order_no DESC")
	List<Buy> saleslist(Map<String, Object> param);
	
	//유저리스트 가져오기
	@Select({"<script>",
		"select * from user",
		"<if test='searchtype!=null and searchcontent!=null'> WHERE ${searchtype} LIKE #{searchcontent}</if>",
		" limit ${startrow},${limit}",
		"</script>"})
	List<User> select(Map<String, Object> param);
	

}

