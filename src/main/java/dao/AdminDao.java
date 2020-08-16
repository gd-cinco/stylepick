package dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import dao.mapper.AdminMapper;
import dao.mapper.BoardMapper;
import dao.mapper.SnsItemMapper;
import dao.mapper.SnsMapper;
import logic.Board;
import logic.Buy;
import logic.Sns;
import logic.SnsItem;
import logic.Statistics;
import logic.Todolist;

@Repository
public class AdminDao {
	
	@Autowired
	private SqlSessionTemplate template;
	private Map<String,Object> param = new HashMap<>();

	//dashboard index 1-1 이달 가입회원
	public int newusers() {
		// TODO Auto-generated method stub
		return template.getMapper(AdminMapper.class).newusers();
	}
	//dashboard index 1-2 전체 회원
	public long numofusers() {
		// TODO Auto-generated method stub
		return template.getMapper(AdminMapper.class).numofusers();
	}
	//dashboard index 1-3 이달 매출
	public long salesofthismonth() {
		// TODO Auto-generated method stub
		return template.getMapper(AdminMapper.class).salesofthismonth();
	}
	//dashboard index 1-4 누적 매출
	public long salesdata() {
		// TODO Auto-generated method stub
		return template.getMapper(AdminMapper.class).salesdata();
	}
	//dashboard index 1-5 누적 리뷰
	public long numofreviews() {
		// TODO Auto-generated method stub
		return template.getMapper(AdminMapper.class).numofreviews();
	}
	//dashboard index 2-1 주간 매출
	public List<Buy> weeklyrevenue() {
		// TODO Auto-generated method stub
		return template.getMapper(AdminMapper.class).weeklyrevenue();
	}
	//dashboard index 2-2 최근 4주간 매출
	public List<Buy> monthlyrevenue() {
		// TODO Auto-generated method stub
		return template.getMapper(AdminMapper.class).monthlyrevenue();
	}
	//[admin] widget index 1-1 daily sales report
	public List<Buy> getSales() {
		// TODO Auto-generated method stub
		param.clear();
		return template.getMapper(AdminMapper.class).getSales(param);
	}

	
	
}
