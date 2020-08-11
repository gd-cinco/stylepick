package dao.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import logic.User;

public interface UserMapper {
	
	@Select("select count(*) from user where ${key} = #{val}")
	int joincompare(@Param("key")String key,@Param("val") String val);
	
	@Select("select ifnull(max(no),0) from user")
	int getmaxno();
	
	@Insert("insert into user (no,userid,password,nickname,seller,imgurl,regdate)"
			+ "values(#{no},#{userid},#{password},#{nickname},0,#{imgurl},now())")
	void insert(User user);

	@Select({"<script>",
		"select * from user",
		"<if test='userid !=null'> where userid = #{userid} </if>",
		"<if test='userid ==null'> where userid != 'admin'</if>",
		"<if test='userids !=null'> and userid in ",
		"<foreach collection='userids' item='id' separator=',' ",
		"open='(' close=')'>#{id}</foreach></if>",
		"</script>"})
	List<User> select(Map<String, Object> param);

	@Update("update user set nickname=#{nickname},birthday=#{birthday},"
			+ "phoneno=#{phoneno},postcode=#{postcode},address=#{address},email=#{email} where userid=#{userid}")
	void update(User user);

	@Delete("delete from user where userid=#{userid}")
	void delete(Map<String, Object> param);

	
}
