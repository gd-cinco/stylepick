package dao.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import logic.Line;

public interface LineMapper {

	@Insert("insert into line (line_no, item_no, userid,content ,evaluation, regdate) values (#{line_no},#{item_no},#{userid},#{content},#{evaluation},now())")
	void insert(Line line);

	@Select("select ifnull(max(line_no),0) from line")
	int maxnum();

	@Select("SELECT count(*) from buy_detail where reviewed=0 and order_no in(select order_no from buy where userid=#{userid})")
	int notMentionedCount(String userid);

	@Select("select count(*) from item_qna")
	int count(Map<String, Object> param);

	
	@Select({"<script>",
		"select * from line ",
		"<if test='item_no != null'> where item_no=#{item_no} </if>",
		"<if test='limit != null'>order by line_no desc limit #{startrow}, #{limit}</if>",
		"</script>"
		
	})
	List<Line> select(Map<String, Object> param);



}
