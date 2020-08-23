package dao.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import logic.Sale;

public interface SaleMapper {

	@Select("SELECT IFNULL(MAX(order_no),0) FROM buy")
	int maxid();

	@Insert("INSERT INTO buy "
			+ "(order_no, userid, orderdate, name, address, tel, stat, amount, memo) "
			+ "VALUES (#{saleid}, #{userid}, NOW()), #{name}, #{address}, #{tel}, 'wait', #{amount}, #{memo} ")
	void insert(Sale sale);

	@Select("SELECT * FROM buy WHERE userid = #{userid}")
	List<Sale> select(Map<String, Object> param);

}
