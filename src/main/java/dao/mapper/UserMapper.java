package dao.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import logic.User;
import logic.Userorder;

public interface UserMapper {
	
	@Select("select count(*) from user where ${key} = #{val}")
	int joincompare(@Param("key")String key,@Param("val") String val);
	
	@Select("select ifnull(max(no),0) from user")
	int getmaxno();
	
	@Insert("insert into user (no,userid,password,nickname,email,seller,imgurl,regdate)"
			+ "values(#{no},#{userid},#{password},#{nickname},#{email},0,#{imgurl},now())")
	void insert(User user);

	@Update("update user set seller=1, name=#{name}, tel=#{tel}, com_name=#{com_name}, "
			+ "com_regist=#{com_regist}, com_tel=#{com_tel}, com_img=#{com_img} "
			+ "where userid=#{userid}")
	void sellerinsert(User user);
	
	@Select({"<script>",
		"select * from user",
		"<if test='userid !=null'> where userid = #{userid} </if>",
		"<if test='userid ==null'> where userid != 'admin'</if>",
		"<if test='userids !=null'> and userid in ",
		"<foreach collection='userids' item='id' separator=',' ",
		"open='(' close=')'>#{id}</foreach></if>",
		"</script>"})
	List<User> select(Map<String, Object> param);

	@Update("update user set nickname=#{nickname},age=#{age},"
			+ "gender=#{gender},tel=#{tel},comment=#{comment} where userid=#{userid}")
	void update(User user);
	
	@Update("update user set com_name=#{com_name}, com_regist=#{com_regist}, "
			+ "com_tel=#{com_tel}, com_img=#{com_img} where userid=#{userid}")
	void sellerupdate(User user);

	@Delete("delete from user where userid=#{userid}")
	void delete(Map<String, Object> param);

	@Select("select i.item_name, b.orderdate, d.quantity*i.price price, "
			+ " b.stat FROM item i,buy b,buy_detail d WHERE "
			+ " i.item_no=d.item_no AND b.order_no=d.order_no "
			+ " AND b.userid=#{userid}")
	List<Userorder> getuserorder(String userid);

	

}
