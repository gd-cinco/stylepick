package dao.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import logic.Sale;

public interface SaleMapper {

	@Select("SELECT IFNULL(MAX(saleid),0) FROM sale")
	int maxid();

	@Insert("INSERT INTO sale "
			+ "(saleid, userid, saledate) "
			+ "VALUES (#{saleid}, #{userid}, NOW()) ")
	void insert(Sale sale);

	@Select("SELECT * FROM sale WHERE userid = #{userid}")
	List<Sale> select(Map<String, Object> param);

}
