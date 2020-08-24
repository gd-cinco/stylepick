package dao.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
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
		"<if test='category != null and keyword == null'> where category=#{category} limit #{startrow}, #{limit} </if>",
		"<if test='keyword != null and category != null'> where category=#{category} and (subject like #{keyword} or item_name like #{keyword} or keyword like #{keyword})</if>",
		"<if test='category == null and keyword == null'> limit #{startrow}, #{limit} </if>",
		"</script>"})
	List<Item> select(Map<String, Object> param);

	@Select({"<script>",
		"select count(*) from item ",
		"<if test='searchcontent != null'>where ${searchtype} like '%${searchcontent}%'</if>",
		"</script>"
	})
	int count(Map<String, Object> param);
	
	@Select("select count(*) from item where category=#{category} and (subject like #{keyword} or item_name like #{keyword} or keyword like #{keyword})")
	int count2(Map<String, Object> param);

		//조회수 증가
	@Update("update item set readcnt = readcnt+1 where item_no =#{item_no}")
	void readcntadd(Integer item_no);

	@Update("update item set subject=#{subject},item_name=#{item_name},price=#{price},keyword=#{keyword},pictureUrl=#{pictureUrl},content=#{content},item_option=#{item_option},size=#{size} where item_no=#{item_no}")
	void update(Item item);

	@Delete("delete from item where item_no=#{item_no}")
	void delete(int item_no);

	@Select("select * from item limit 0,4")
	List<Item> selectRank();
	
	@Select("select * from item order by regdate desc limit 0,4")
	List<Item> selectNew();

	





	



}
