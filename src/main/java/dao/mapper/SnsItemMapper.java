package dao.mapper;

import org.apache.ibatis.annotations.Insert;

import logic.SnsItem;

public interface SnsItemMapper {
	
	@Insert("insert into snsitem (sns_no,seq,category,detail) values (#{sns_no},#{seq},#{category},#{detail})")
	void insert(SnsItem snsItem);
}
