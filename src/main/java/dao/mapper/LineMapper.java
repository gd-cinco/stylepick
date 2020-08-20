package dao.mapper;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import logic.Line;

public interface LineMapper {

	@Insert("insert into line (line_no, item_no, userid,content ,evaluation, regdate) values (#{line_no},#{item_no},#{userid},#{content},#{evaluation},now())")
	void insert(Line line);

	@Select("select ifnull(max(line_no),0) from line")
	int maxnum();

}
