package dao.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import logic.Qna;

public interface QnaMapper {

	@Select("select ifnull(max(qna_no),0) from item_qna")
	int maxnum();

	@Insert("insert into item_qna (qna_no,item_no, type, userid,content, regdate,grp,grplevel,grpstep) values (#{qna_no},#{item_no},#{type},#{userid},#{content}, now(),#{grp},#{grplevel},#{grpstep})")
	void insert(Qna qna);

	

	@Select({"<script>",
		"select count(*) from item_qna ",
		"<if test='searchcontent != null'>where ${searchtype} like '%${searchcontent}%'</if>",
		"</script>"
	})
	int count(Map<String, Object> param);
	
	@Select({"<script>",
		"select * from item_qna ",
		"<if test='searchcontent != null'>where ${searchtype} like '%${searchcontent}%'</if>",
		"<if test='item_no != null'> where item_no=#{item_no} </if>",
		"<if test='limit != null'>order by grp desc, grpstep limit #{startrow}, #{limit}</if>",
		"</script>"
		
	})
	List<Qna> select(Map<String, Object> param);

}