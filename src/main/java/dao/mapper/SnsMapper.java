package dao.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import logic.Sns;

public interface SnsMapper {

	@Select("select ifnull(max(sns_no),0) from sns")
	int maxnum();

	@Insert("insert into sns (sns_no,type,userid,img1,description,regdate,height,weight) values (#{sns_no},#{type},#{userid},#{img1url},#{description},now(),#{height},#{weight})")
	void insert(Sns sns);
	
	@Select({"<script>",
		 "select count(*) from sns where type=#{type} ",
		 "</script>"})
	int count(Map<String, Object> param);

	@Select({"<script>",
		"select sns_no,type,userid,img1,description,regdate from sns ",
		"<if test='sns_no == null'> where type = #{type} order by sns_no limit #{startrow}, #{limit}</if>",
		"</script>"})
	List<Sns> select1(Map<String, Object> param);
	
	@Select({"<script>",
		"select sns_no,type,userid,img1,description,regdate from sns ",
		"<if test='sns_no == null'> where type = #{type} order by regdate limit #{startrow}, #{limit}</if>",
		"</script>"})
	List<Sns> select2(Map<String, Object> param);

	@Select("select sns_no,type,userid,img1 img1url,description,regdate,height,weight from sns where sns_no=#{sns_no}")
	Sns select(Map<String, Object> param);

	@Insert("insert into sns_like (sns_no,userid) values (#{sns_no},#{userid})")
	void like(Map<String, Object> param);

	@Select("select count(*) from sns_like where sns_no=#{sns_no}")
	int likenum(Map<String, Object> param);

	@Select("select count(*) from comment where sns_no=#{sns_no}")
	int commentnum(Map<String, Object> param);

	@Update("update sns set img1=#{img1url},description=#{description},height=#{height},weight=#{weight} where sns_no=#{sns_no}")
	void update(Sns sns);

	@Select("select sns_no,type,userid,img1 img1url,description,regdate,height,weight from sns where userid=#{userid}")
	List<Sns> mylist(Map<String, Object> param);

	@Select("select count(*) from sns where userid=#{userid}")
	int mysnsnum(Map<String, Object> param);
	
	

}

