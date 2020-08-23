package dao.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import logic.SnsItem;

public interface SnsItemMapper {
	
	@Insert("insert into snsitem (sns_no,seq,category,detail,reviewed) values (#{sns_no},#{seq},#{category},#{detail},0)")
	void insert(SnsItem snsItem);
	
	@Select("select sns_no,seq,category,detail from snsitem where sns_no=#{sns_no}")
	List<SnsItem> select(Map<String,Object> param);

	@Delete("delete from snsitem where sns_no=#{sns_no}")
	void delete(SnsItem si);

	@Delete("delete from snsitem where sns_no=#{sns_no}")
	void delete2(Map<String, Object> param);
}
