package dao.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import logic.Sns;

public interface SnsMapper {

	@Select("select ifnull(max(sns_no),0) from sns")
	int maxnum();

	@Insert("insert into sns (sns_no,type,userid,imgUrl,description,regdate) values (#{sns_no},#{type},#{userid},#{imgUrl},#{description},now())")
	void insert(Sns sns);
	
	@Select({"<script>",
		 "select count(*) from sns where type=#{type} ",
		 "</script>"})
	int count(Map<String, Object> param);

	@Select({"<script>",
		"select sns_no,type,userid,imgUrl,description,regdate from sns ",
		"<if test='sns_no != null'> where sns_no = #{sns_no} </if>",
		"<if test='sns_no == null'> where type = #{type} order by sns_no limit #{startrow}, #{limit} </if>",
		"</script>"})
	List<Sns> select1(Map<String, Object> param);
	
	@Select({"<script>",
		"select sns_no,type,userid,imgUrl,description,regdate from sns ",
		"<if test='sns_no != null'> where sns_no = #{sns_no} </if>",
		"<if test='sns_no == null'> where type = #{type} order by regdate limit #{startrow}, #{limit} </if>",
		"</script>"})
	List<Sns> select2(Map<String, Object> param);

}

