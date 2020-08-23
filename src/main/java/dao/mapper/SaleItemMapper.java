package dao.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import logic.SaleItem;

public interface SaleItemMapper {

	@Insert("INSERT INTO buy_detail "
			+ "(order_no, seq, item_no, quantity, item_option, size) "
			+ "VALUES (#{order_no}, #{seq}, #{item_no}, #{quantity}, #{item_option}, #{size}) ")
	void insert(SaleItem saleItem);

	@Select("SELECT * FROM buy_detail WHERE order_no = #{order_no}")
	List<SaleItem> select(Map<String, Object> param);

	@Select("update buy_detail set reviewed=1 where order_no=#{order_no} and seq=#{seq}")
	void reviewed(@Param("order_no")int order_no, @Param("seq")int seq);

}
