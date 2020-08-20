package dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import dao.mapper.BoardMapper;
import logic.Board;

@Repository
public class BoardDao {
	@Autowired
	private SqlSessionTemplate template;

	public List<Board> list(int seq, String category) {
		List<Board> list = template.getMapper(BoardMapper.class).list(seq, category);
		int i = 1;
		for (Board b : list) {
			b.setNo(i++);
		}
		return list;
	}
}
