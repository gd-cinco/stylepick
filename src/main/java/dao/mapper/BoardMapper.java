package dao.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Select;

import logic.Board;

public interface BoardMapper {
	@Select("select * from board where seq=#{seq}")
	List<Board> list(int seq);
}
