package dao.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Select;

import logic.Board;

public interface BoardMapper {
	@Select("select no, title, author from board")
	List<Board> list();
}
