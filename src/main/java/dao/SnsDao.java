package dao;

import java.util.HashMap;
import java.util.List;
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
	
	public int listcount(String type,String searchcontent) {
		param.clear();
		param.put("type",type);
		param.put("searchcontent",searchcontent);
		return template.getMapper(SnsMapper.class).count(param);
	}

	public List<Sns> list(String ksb,String type,Integer pageNum,int limit,String searchcontent) {
		param.clear();
		param.put("ksb",ksb);
		param.put("type",type);
		param.put("startrow",(pageNum-1)*20);
		param.put("limit",limit);
		param.put("searchcontent",searchcontent);
		if(ksb.equals("hot")) {
			return template.getMapper(SnsMapper.class).select1(param);
		} else {
			return template.getMapper(SnsMapper.class).select2(param);
		}
	}

	public Sns selectOne(int sns_no) {
		param.clear();
		param.put("sns_no",sns_no);
		return template.getMapper(SnsMapper.class).select(param);
	}

}
