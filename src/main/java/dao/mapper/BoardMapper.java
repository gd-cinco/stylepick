package dao.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import logic.Board;

public interface BoardMapper {
	@Select("select * from board where seq=#{seq}")
	List<Board> list(int seq);
	
	@Select({"<script>",
		"select * from board where seq=2",
		"<if test='stat != null'> and stat=#{stat}</if>",
		" order by no desc",
		"</script>"
	})
	List<Board> qnalist(Map<String, Object> param);
	
	@Select({"<script>",
		"select * from board where seq=3",
		"<if test='category != null'> and substring_index(category,',',1)=#{category}</if>",
		" order by category desc",
		"</script>"
	})
	List<Board> faqlist(Map<String, Object> param);

	@Update("UPDATE board SET readcnt = readcnt + 1 WHERE no = #{no}")
	void readcnt(Map<String, Object> param);

	@Select("select * from board where no=#{no}")
	Board selectOne(int no);

	@Select("SELECT IFNULL(MAX(no),0) FROM board")
	int maxno();

	@Insert("INSERT INTO board " 
			+ " (no, title, author, seq, category, stat, regtime, readcnt, content, file1) "
			+ " VALUES (#{no}, #{title}, #{author}, #{seq}, #{category}, #{stat}, NOW(), 0, #{content}, #{file1}) ")
	void insert(Board board);

	@Select("SELECT SUBSTRING_INDEX(category,',',1) FROM board GROUP BY 1")
	List<String> clist();

}
