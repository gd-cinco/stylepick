package logic;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import dao.SnsDao;
import dao.SnsItemDao;
import dao.AdminDao;
import dao.BoardDao;
import dao.ItemDao;
import dao.UserDao;

@Service	//@Component + service ( Controller와 dao의 중간)
public class ShopService {

	@Autowired
	private UserDao userDao;
	
	@Autowired
	private SnsDao snsDao;

	@Autowired
	private ItemDao itemDao;

	@Autowired
	private SnsItemDao snsItemDao;
	
	@Autowired
	private AdminDao adminDao;
	
	@Autowired
	private BoardDao boardDao;
	
	public int joincompare(String key, String val) {
		return userDao.joincompare(key,val);
	}

	public int getmaxno() {
		return userDao.getmaxno();
	}
	
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
	
	//[admin] 메일 보낼 유저리스트 0728
	public List<User> userlist(String[] idchks) {
		return userDao.list(idchks);
	}
	
	//[admin] 그래프1 0728
	public Map<String, Object> graph1() {
		// TODO Auto-generated method stub
		Map<String,Object> map = new HashMap<String,Object>();
//		for(Map<String,Object> m : boardDao.graph1()) {
//			map.put((String)m.get("name"), m.get("cnt"));
//		}
		return map;
	}
	
	//[admin] 유저리스트 가져오기 0728
	public List<User> list() {
		// TODO Auto-generated method stub
		return userDao.list();
		}

	//[admin] 그래프2 0728
	public Map<String, Object> graph2() {
		// TODO Auto-generated method stub
		Map<String,Object> map = new HashMap<String,Object>();
//		for(Map<String,Object> m : boardDao.graph2()) {
//			map.put((String)m.get("regdate"), m.get("cnt"));
//		}
		return map;
	}
	
	//[admin] dashboard sales data
	public long salesdata() {
		// TODO Auto-generated method stub
		return adminDao.salesdata();
	}
			

	//[sns] ootd 번호
	public int snsNum() {
		int max = snsDao.maxnum();
		return ++max;
	}
	
	//[sns] ootd 작성
	public void snsWrite(Sns sns,HttpServletRequest request) {
		if(sns.getImg1() != null && !sns.getImg1().isEmpty()) {
			uploadFileCreate(sns.getImg1(),request,"sns/file/");
			sns.setImg1url(sns.getImg1().getOriginalFilename());
		}
		snsDao.insert(sns);
		for(SnsItem si : sns.getItemList()) {
			snsItemDao.insert(si);
		}		
	}
	
	//[sns] ootd 작성 관련 이미지 파일 업로드
	private void uploadFileCreate(MultipartFile picture, HttpServletRequest request, String path) {
		String orgFile = picture.getOriginalFilename();
		String uploadPath = request.getServletContext().getRealPath("/") + path;
		File fpath = new File(uploadPath);
		if(!fpath.exists()) fpath.mkdirs();
		try {
			picture.transferTo(new File(uploadPath + orgFile));
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	//[sns] ootd 목록 
	public List<Sns> getSnsList(String ksb,String type,Integer pageNum,int limit,String searchcontent) {
		return snsDao.list(ksb,type,pageNum,limit,searchcontent);
	}
	
	//[sns] ootd 게시물 갯수
	public int getSnsCount(String type,String searchcontent) {
		return snsDao.listcount(type,searchcontent);
	}


			
	// [아이템]상품 리스트 정보
	public List<Item> getItemList() {
		return itemDao.list();
	}

	/**
	 * Board
	 */
	public List<Board> getNoticeList() {
		return boardDao.list();
	}

}
