package dao.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import logic.Buy;
import logic.Sns;
import logic.Statistics;

public interface AdminMapper {
	
	// dashboard index 1-1 이달 가입회원
	@Select("SELECT COUNT(*) FROM user WHERE regdate > (NOW() - INTERVAL 1 MONTH)")
	int newusers();
	// dashboard index 1-2 전체 회원
	@Select("SELECT COUNT(*) FROM user")
	int numofusers();
	// dashboard index 1-3 이달 매출
	@Select("SELECT IFNULL(SUM(amount),45000) FROM buy WHERE orderdate > (NOW() - INTERVAL 1 MONTH)")
	long salesofthismonth();
	// dashboard index 1-4 누적 매출
	@Select("SELECT IFNULL(SUM(amount),700000) FROM buy")
	long salesdata();
	// dashboard index 1-5 누적 리뷰
	@Select("SELECT COUNT(evaluation) FROM line")
	long numofreviews();
	// dashboard index 2-1 주간 매출
	@Select("SELECT DATE_FORMAT(orderdate, \"%Y-%m-%d\") 'orderdate', SUM(amount)'amount' FROM buy WHERE orderdate > (NOW() - INTERVAL 1 WEEK) GROUP BY DATE_FORMAT(orderdate, \"%Y-%m-%d\")")
	List<Buy> weeklyrevenue();
	// dashboard index 2-2 최근 6주간 매출
		@Select("SELECT " + 
				"FLOOR( DATEDIFF( CURRENT_DATE , orderdate ) / 7 ) AS weeks_ago, " + 
				"SUM(amount) amount " + 
				"FROM buy " + 
				"GROUP BY weeks_ago " + 
				"HAVING weeks_ago <=6 " + 
				"ORDER BY weeks_ago ASC ")
		List<Buy> monthlyrevenue();
}

