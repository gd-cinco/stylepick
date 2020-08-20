package dao.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Select;

import logic.Board;

public interface BoardMapper {
	@Select("select * from board where seq=#{seq}")
	List<Board> list(int seq);
	
//	@Select("select * from board where seq=3 and substring_index(category,',',1)=#{category}")
//	List<Board> faqlist(String category);
	
	@Select({"<script>",
		"select * from board where seq=3",
		"<if test='category != null'> and substring_index(category,',',1)=#{category}</if>",
		"</script>"
	})
	List<Board> faqlist(Map<String, Object> param);
}
