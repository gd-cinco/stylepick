package dao.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import logic.Item;

public interface ItemMapper {
	@Select("select ifnull(max(item_no),0) from item")
	int maxnum();

	@Insert("insert into item (item_no, userid, code, category, subject, item_name, price, keyword, pictureUrl, content, regdate, readcnt, item_option, size)"
			+ "values(#{item_no}, #{userid}, #{code},#{category},#{subject},#{item_name},#{price},#{keyword},#{pictureUrl},#{content},now(),0,#{item_option},#{size})")
	void insert(Item item);

	@Select({"<script>",
		"select * from item",
		"<if test='item_no != null'> where item_no=#{item_no} </if>",
		"</script>"})
	List<Item> select(Map<String, Object> param);

	
	//조회수 증가
//	@Update("update item set readcnt = readcnt+1 where item_no =#{item_no}")
//	void readcntadd(Integer item_no);
}
