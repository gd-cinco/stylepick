package dao;

import java.util.HashMap;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import dao.mapper.SnsMapper;
import logic.Sns;

@Repository
public class SnsDao {
	
	@Autowired
	private SqlSessionTemplate template;
	private Map<String,Object> param = new HashMap<>();
	
	public int maxnum() {
		return template.getMapper(SnsMapper.class).maxnum();
	}

	public void insert(Sns sns) {
		template.getMapper(SnsMapper.class).insert(sns);
	}
}
