package dao.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import logic.Board;
import logic.Buy;
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
	
	//widget index 1-1 daily sales report
	@Select("SELECT order_no, orderdate, userid, amount FROM buy ORDER BY order_no DESC LIMIT 5")
	List<Buy> getSales(Map<String, Object> param);
	
	//widget index 1-2 recently joined users
	@Select("SELECT no, userid, gender, age, regdate FROM user ORDER BY no DESC LIMIT 5")
	List<User> getUsers(Map<String, Object> param);
	
	//widgets index 2-1 이번 달 구매 회원 랭킹
	@Select("SELECT userid, SUM(amount) amount FROM buy WHERE orderdate > (NOW() - INTERVAL 1 MONTH) GROUP BY userid ORDER BY amount DESC LIMIT 10")
	List<Buy> monthlyheavyusers(Map<String, Object> param);


}

