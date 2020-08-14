package dao.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import logic.Buy;
import logic.Sns;
import logic.Statistics;

public interface AdminMapper {
	/*
	@Select("select ifnull(max(sns_no),0) from sns")
	int maxnum();

	@Insert("insert into sns (sns_no,type,userid,img1,description,regdate,height,weight) values (#{sns_no},#{type},#{userid},#{img1url},#{description},now(),#{height},#{weight})")
	void insert(Sns sns);
	
	@Select({"<script>",
		 "select count(*) from sns where type=#{type} ",
		 "</script>"})
	int count(Map<String, Object> param);

	@Select({"<script>",
		"select sns_no,type,userid,imgUrl,description,regdate from sns ",
		"<if test='sns_no != null'> where sns_no = #{sns_no} </if>",
		"<if test='sns_no == null'> where type = #{type} order by sns_no limit #{startrow}, #{limit} </if>",
		"</script>"})
	List<Sns> select1(Map<String, Object> param);
	
	@Select({"<script>",
		"select sns_no,type,userid,imgUrl,description,regdate from sns ",
		"<if test='sns_no != null'> where sns_no = #{sns_no} </if>",
		"<if test='sns_no == null'> where type = #{type} order by regdate limit #{startrow}, #{limit} </if>",
		"</script>"})
	List<Sns> select2(Map<String, Object> param);
	*/
	
	// 이달 가입회원
	@Select("SELECT COUNT(*) FROM user WHERE regdate > (NOW() - INTERVAL 1 MONTH)")
	int newusers();
	//전체 회원
	@Select("SELECT COUNT(*) FROM user")
	int numofusers();
	//이달 매출
	@Select("SELECT IFNULL(SUM(amount),45000) FROM buy WHERE orderdate > (NOW() - INTERVAL 1 MONTH)")
	long salesofthismonth();
	//누적 매출
	@Select("SELECT IFNULL(SUM(amount),700000) FROM buy")
	long salesdata();
	//누적 리뷰
	@Select("SELECT COUNT(evaluation) FROM line")
	long numofreviews();
	//주간 매출
	@Select("SELECT DATE_FORMAT(orderdate, \"%Y-%m-%d\") 'orderdate', SUM(amount)'amount' FROM buy WHERE orderdate > (NOW() - INTERVAL 1 WEEK) GROUP BY DATE_FORMAT(orderdate, \"%Y-%m-%d\")")
	List<Buy> weeklyrevenue();
}

