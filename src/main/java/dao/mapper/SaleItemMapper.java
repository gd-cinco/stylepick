package dao.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import logic.SaleItem;

public interface SaleItemMapper {

	@Insert("INSERT INTO saleitem "
			+ "(saleid, seq, itemid, quantity) "
			+ "VALUES (#{saleid}, #{seq}, #{itemid}, #{quantity}) ")
	void insert(SaleItem saleItem);

	@Select("SELECT * FROM saleitem WHERE saleid = #{saleid}")
	List<SaleItem> select(Map<String, Object> param);

}
