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
import logic.Line;
import logic.Sns;
import logic.SnsItem;
import logic.Statistics;
import logic.Todolist;
import logic.User;

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
	//widgets index 1-1 daily sales report
	public List<Buy> getSales() {
		// TODO Auto-generated method stub
		param.clear();
		return template.getMapper(AdminMapper.class).getSales(param);
	}
	//widgets index 1-2 recently joined users
	public List<User> getUsers() {
		// TODO Auto-generated method stub
		param.clear();
		return template.getMapper(AdminMapper.class).getUsers(param);
	}
	//widgets index 2-1 이번 달 구매 회원 랭킹
	public List<Buy> monthlyheavyusers() {
		// TODO Auto-generated method stub
		param.clear();
		return template.getMapper(AdminMapper.class).monthlyheavyusers(param);
	}
	//widgets index 2-2 올해 최다 구매 회원 랭킹
	public List<Buy> yearlyheavyusers() {
		// TODO Auto-generated method stub
		param.clear();
		return template.getMapper(AdminMapper.class).yearlyheavyusers(param);
	}
	//widgets index 3-1 우수 입점 스토어 차트
	public List<Line> topthreestores() {
		// TODO Auto-generated method stub
		return template.getMapper(AdminMapper.class).topthreestores(param);
	}
	//dashboard index 3-1 To-do list
	public void addtodolist() {
		// TODO Auto-generated method stub
		template.getMapper(AdminMapper.class).addtodolist();
	}
	//dashboard index 3-2 To-do list show
	public List<Line> selectTodolistByCode(Line line) {
		// TODO Auto-generated method stub
		return template.getMapper(AdminMapper.class).selectTodolistByCodes();
	}

	
	
}
