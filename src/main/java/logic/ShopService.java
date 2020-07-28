package logic;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.UserDao;

@Service	//@Component + service ( Controller와 dao의 중간)
public class ShopService {

	@Autowired
	private UserDao userDao;

	public void userInsert(User user) {
		userDao.insert(user);
	}

	public User getUser(String userid) {
		return userDao.selectOne(userid);
	}

	public void userUpdate(User user) {
		userDao.update(user);
	}

	public void delete(String userid) {
		userDao.delete(userid);
	}

	public List<User> getUserList() {
		return userDao.list();
	}
	
	//[관리자] 메일 보낼 유저리스트 0728
	public List<User> userlist(String[] idchks) {
		return userDao.list(idchks);
	}
	
	//[관리자] 그래프1 0728
	public Map<String, Object> graph1() {
		// TODO Auto-generated method stub
		Map<String,Object> map = new HashMap<String,Object>();
//		for(Map<String,Object> m : boardDao.graph1()) {
//			map.put((String)m.get("name"), m.get("cnt"));
//		}
		return map;
	}
	
	//[관리자] 유저리스트 가져오기 0728
	public List<User> list() {
		// TODO Auto-generated method stub
		return userDao.list();
		}

	//[관리자] 그래프2 0728
			public Map<String, Object> graph2() {
				// TODO Auto-generated method stub
				Map<String,Object> map = new HashMap<String,Object>();
//				for(Map<String,Object> m : boardDao.graph2()) {
//					map.put((String)m.get("regdate"), m.get("cnt"));
//				}
				return map;
			}
}
