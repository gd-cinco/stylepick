package dao.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Select;

import logic.Board;

public interface BoardMapper {
	@Select({"<script>",
		"select * from board where seq=#{seq}",
		"<if test='category != null'> and substring_index(category,',',1)=#{category}</if>",
		"</script>"
	})
	List<Board> list(int seq, String category);
}
