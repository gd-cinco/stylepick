package dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import dao.mapper.LineMapper;
import logic.Line;

@Repository
public class LineDao { //한줄평
	@Autowired
	private SqlSessionTemplate template;
	private Map<String,Object> param =new HashMap<>();
	
	//한줄평 작성
	public void insert(Line line) {
		template.getMapper(LineMapper.class).insert(line);
	}

	public int maxnum() {
		return template.getMapper(LineMapper.class).maxnum();
	}

	//[user] 쓰지않은 한줄평 카운트 
	public int getNotMentionedCount(String userid) {
		return template.getMapper(LineMapper.class).notMentionedCount(userid);
	}

	public String getreviewcontent(int order_no, int seq) {
		return template.getMapper(LineMapper.class).getreviewcontent(order_no,seq);
	}

	
}
