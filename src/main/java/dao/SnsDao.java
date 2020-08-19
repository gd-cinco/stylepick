package dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import dao.mapper.ItemMapper;
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

	public List<Sns> list(String ksb,String type,Integer pageNum,int limit) {
		param.clear();
		param.put("ksb",ksb);
		param.put("type",type);
		param.put("startrow",(pageNum-1)*20);
		param.put("limit",limit);
		System.out.println(param);
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

	public void like(int sns_no, String userid) {
		param.clear();
		param.put("sns_no",sns_no);
		param.put("userid",userid);
		template.getMapper(SnsMapper.class).like(param);
	}

	public int likenum(int sns_no) {
		param.clear();
		param.put("sns_no",sns_no);
		return template.getMapper(SnsMapper.class).likenum(param);
	}

	public int commentnum(int sns_no) {
		param.clear();
		param.put("sns_no",sns_no);
		return template.getMapper(SnsMapper.class).commentnum(param);
	}

	public void update(Sns sns) {
		template.getMapper(SnsMapper.class).update(sns);
	}

	public List<Sns> mylist(String userid) {
		param.clear();
		param.put("userid",userid);
		return template.getMapper(SnsMapper.class).mylist(param);
	}

	public int mysnscount(String userid) {
		param.clear();
		param.put("userid",userid);
		return template.getMapper(SnsMapper.class).mysnsnum(param);
	}

	public void delete(int sns_no) {
		param.clear();
		param.put("sns_no",sns_no);
		template.getMapper(SnsMapper.class).delete(param);
	}

}
