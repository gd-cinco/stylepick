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
import dao.CommentDao;
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

	@Autowired
	private CommentDao commentDao;

	//[user] 입력창 중복확인
	public int joincompare(String key, String val) {
		return userDao.joincompare(key,val);
	}
	
	//[user] no 최댓값확인
	public int getmaxno() {
		return userDao.getmaxno();
	}
	
	//[user] 일반회원가입
	public void userInsert(User user) {
		userDao.insert(user);
	}
	
	//[user] 판매자 회원 가입
	public void sellerEntry(User user) {
		userDao.sellerinsert(user);
	}
	
	//[user] 1명 정보 가져오기
	public User getUser(String userid) {
		return userDao.selectOne(userid);
	}
	
	//[user] 일반회원 정보 수정
	public void userUpdate(User user) {
		userDao.update(user);
	}
	
	//[user] 판매자 정보 수정
	public void sellerUpdate(User user) {
		userDao.sellerupdate(user);
	}

	//[user] 회원 삭제
	public void delete(String userid) {
		userDao.delete(userid);
	}

	//[user] 유저 리스트로 가져오기
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
	
	//[sns] ootd 상세보기
	public Sns getSns(int sns_no) {
		return snsDao.selectOne(sns_no);
	}
	
	//[sns] ootd 상세보기 - 스타일정보
	public List<SnsItem> getSnsItem(int sns_no) {
		return snsItemDao.list(sns_no);
	}

	
	//[sns] ootd 댓글 번호
	public int replyNum(int sns_no) {
		int max = commentDao.maxnum(sns_no);
		return ++max;
	}
	
	//[sns] ootd 댓글 작성
	public void replyWrite(Comment comment) {
		commentDao.insert(comment);	
	}
	
	//[sns] ootd 댓글 목록
	public List<Comment> getCommentList(int sns_no) {
		return commentDao.list(sns_no);
	}
	
	//[sns] ootd 목록 
	public List<Sns> getSnsList(String ksb,String type,int pageNum,int limit,String searchcontent) {
		return snsDao.list(ksb,type,pageNum,limit,searchcontent);
	}
	
	//[sns] ootd 게시물 갯수
	public int getSnsCount(String type,String searchcontent) {
		return snsDao.listcount(type,searchcontent);
	}
	
	//[sns] ootd 좋아요
	public void addlike(int sns_no, String userid) {
		 snsDao.like(sns_no,userid);
	}
	
	//[sns] ootd 좋아요 개수
	public int getlikenum(int sns_no) {
		return snsDao.likenum(sns_no);
	}

			
	// [아이템]상품 리스트 정보
	public List<Item> getItemList(Integer pageNum, int limit, String searchtype, String searchcontent) {
		return itemDao.list();
	}
	public int getItemCount(String searchtype, String searchcontent) {
		return itemDao.count(searchtype, searchcontent);
	}
	//[아이템]상품 상세보기
	public Item getItem(Integer item_no, boolean able) {
		if(able) {
			itemDao.readcntadd(item_no);
		}
		return itemDao.selectOne(item_no);
	}
	
	public int getmaxnum() {
		// TODO Auto-generated method stub
		return itemDao.maxnum();
	}
	

	
	//[아이템]상품 작성
	public void itmeCreate(Item item, HttpServletRequest request) {
		if(item.getImgurl() != null && !item.getImgurl().isEmpty()) {
			uploadFileCreate(item.getImgurl(),request, "item/img/");
			item.setPictureUrl(item.getImgurl().getOriginalFilename());
		}
		itemDao.insert(item);
		
	}

		//[admin] dashboard index 1-1 이달 가입회원 0813
		public int newusers() {
			// TODO Auto-generated method stub
			return adminDao.newusers();
		}
		//[admin] dashboard index 1-2 전체 회원 0813
		public long numofusers() {
			// TODO Auto-generated method stub
			return adminDao.numofusers();
		}
		//[admin] dashboard index 1-3 이달 매출 0813
		public long salesofthismonth() {
			// TODO Auto-generated method stub
			return adminDao.salesofthismonth();
		}
		//[admin] dashboard index 1-4 누적 매출 0813
		public long salesdata() {
			// TODO Auto-generated method stub
			return adminDao.salesdata();
		}
		//[admin] dashboard index 1-5 누적 리뷰 0813
		public long numofreviews() {
			// TODO Auto-generated method stub
			return adminDao.numofreviews();
		}
		//[admin] dashboard index 2-1 주간 매출 0814
		public List<Buy> weeklyrevenue() {
			// TODO Auto-generated method stub
			return adminDao.weeklyrevenue();
		}
		//[admin] dashboard index 2-2 최근 4주간 매출 0815
		public List<Buy> monthlyrevenue() {
			// TODO Auto-generated method stub
			return adminDao.monthlyrevenue();
		}
		//[admin] widgets index 1-1 daily sales report 0816
		public List<Buy> getSales() {
			// TODO Auto-generated method stub
			return adminDao.getSales();
		}
		//[admin] widgets index 1-2 recently joined users 0816
		public List<User> getUsers() {
			// TODO Auto-generated method stub
			return adminDao.getUsers();
		}
		//[admin] widgets index 2-1 이번 달 구매 회원 랭킹 0816
		public List<Buy> monthlyheavyusers() {
			// TODO Auto-generated method stub
			return adminDao.monthlyheavyusers();
		}
		//[admin] widgets index 2-2 올해 최다 구매 회원 랭킹 0817
		public List<Buy> yearlyheavyusers() {
			// TODO Auto-generated method stub
			return adminDao.yearlyheavyusers();
		}
		//[admin] widgets index 3-1 우수 입점 스토어 차트 0817
		public List<Line> topthreestores() {
			// TODO Auto-generated method stub
			return adminDao.topthreestores();
		}
		//[admin] dashboard index 3-1 To-do list 0817
		public void addtodolist(Line line) {
			// TODO Auto-generated method stub
			adminDao.addtodolist();
		}
		//[admin] dashboard index 3-2 To-do list show 0817
		public List<Line> selectTodolistByCode(Line line) {
			// TODO Auto-generated method stub
			return adminDao.selectTodolistByCode(line);
		}
		//[admin] widgets index 3-2 최근 4주 별점 평균 상위 3개 스토어 0818
		public List<Line> getEvaluation() {
			// TODO Auto-generated method stub
			return adminDao.getEvaluation();
		}
		
		//[admin] charts index 3 Yearly : 연 매출 현황 0818
		public List<Buy> yearlyrevenue() {
			// TODO Auto-generated method stub
			return adminDao.yearlyrevenue();
		}
		
	/**
	 * Board
	 */
	public List<Board> getBoardList(int seq) {
		return boardDao.list(seq);
	}






}
