package dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import dao.mapper.BoardMapper;
import logic.Board;

@Repository
public class BoardDao {
	@Autowired
	private SqlSessionTemplate template;
	private Map<String,Object> param = new HashMap<>();

	public List<Board> list(int seq) {
		List<Board> list = template.getMapper(BoardMapper.class).list(seq);
		int i = 1;
		for (Board b : list) {
			b.setNo(i++);
		}
		return list;
	}

	public List<Board> faqlist(String category) {
		param.put("category", category);
		List<Board> list = template.getMapper(BoardMapper.class).faqlist(param);
		int i = 1;
		for (Board b : list) {
			b.setNo(i++);
		}
		return list;
	}
}
