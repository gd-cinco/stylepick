package dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import dao.mapper.AdminMapper;
import dao.mapper.SnsMapper;
import logic.Buy;
import logic.Sns;
import logic.Statistics;

@Repository
public class AdminDao {
	
	@Autowired
	private SqlSessionTemplate template;
	private Map<String,Object> param = new HashMap<>();

	//이달의 가입 회원
	public int newusers() {
		// TODO Auto-generated method stub
		return template.getMapper(AdminMapper.class).newusers();
	}
	//전체 회원
	public long numofusers() {
		// TODO Auto-generated method stub
		return template.getMapper(AdminMapper.class).numofusers();
	}
	//이번 달 매출
	public long salesofthismonth() {
		// TODO Auto-generated method stub
		return template.getMapper(AdminMapper.class).salesofthismonth();
	}
	//누적 매출
	public long salesdata() {
		// TODO Auto-generated method stub
		return template.getMapper(AdminMapper.class).salesdata();
	}
	//누적 리뷰
	public long numofreviews() {
		// TODO Auto-generated method stub
		return template.getMapper(AdminMapper.class).numofreviews();
	}
	//주간 매출 graph on dashboard
	public List<Buy> weeklyrevenue() {
		// TODO Auto-generated method stub
		return template.getMapper(AdminMapper.class).weeklyrevenue();
	}

}
