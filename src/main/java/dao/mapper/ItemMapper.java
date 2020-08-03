package dao.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Select;

import logic.Item;

public interface ItemMapper {

	@Select("select * from item")
	List<Item> select(Map<String,Object> param);
}
