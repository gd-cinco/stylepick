package dao.mapper;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import logic.Line;

public interface LineMapper {

	@Insert("insert into line (line_no, item_no, userid,content ,evaluation, regdate) values (#{line_no},#{item_no},#{userid},#{content},#{evaluation},now())")
	void insert(Line line);

	@Select("select ifnull(max(line_no),0) from line")
	int maxnum();

	@Select("SELECT count(*) FROM buy_detail d LEFT JOIN line l ON d.order_no=l.order_no"
			+ " AND d.seq=l.seq WHERE l.line_no IS NULL AND d.order_no"
			+ " IN(SELECT order_no FROM buy WHERE userid=#{userid})")
	int notMentionedCount(String userid);

}
