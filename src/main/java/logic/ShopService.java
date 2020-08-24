package logic;

import java.io.File;
import java.util.Date;
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
import dao.LineDao;
import dao.QnaDao;
import dao.SaleDao;
import dao.SaleItemDao;
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
	private QnaDao qnaDao;

	@Autowired
	private SnsItemDao snsItemDao;
	
	@Autowired
	private AdminDao adminDao;
	
	@Autowired
	private BoardDao boardDao;

	@Autowired
	private CommentDao commentDao;
	
	@Autowired
	private LineDao lineDao;
	
	@Autowired
	private SaleDao saleDao;
	
	@Autowired
	private SaleItemDao saleItemDao;
 
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
	
	//[user] 내 주문리스트 요약보기
	public List<Userorder> getUserOrder(String userid) {
		return userDao.userorder(userid);
	}
	
	//[user] 내 한줄평 요약보기
	public List<Userorder> getline(String userid) {
		return userDao.userline(userid);
	}
	
	//[user] 주문배송 - 배송중
	public int getmyshipping(String userid) {
		return userDao.getmyshipping(userid);
	}
	
	//[user] 내 주문내역
	public List<Sale> getusersale(String userid) {
		return userDao.getusersale(userid);
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
	
	//[admin] 유저리스트 가져오기 0822 0728
	public List<User> list(String searchtype, String searchcontent) {
		// TODO Auto-generated method stub
		return userDao.list(searchtype, searchcontent);
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
	public List<Sns> getSnsList(String ksb,String type,int listAmount,int limit) {
		return snsDao.list(ksb,type,listAmount,limit);
	}
	
	//[sns] ootd 게시물 갯수
	public int getSnsCount(String type,String searchcontent) {
		return snsDao.listcount(type,searchcontent);
	}
	
	//[sns] ootd 좋아요
	public void addlike(int sns_no, String userid) {
		 snsDao.like(sns_no,userid);
	}
	
	//[sns] ootd 좋아요수
	public int getlikenum(int sns_no) {
		return snsDao.likenum(sns_no);
	}

	//[sns] ootd 댓글수
	public int getcommentnum(int sns_no) {
		return snsDao.commentnum(sns_no);
	}
	
	//[sns] ootd 수정
	public void snsUpdate(Sns sns, HttpServletRequest request) {
		if(sns.getImg1() != null && !sns.getImg1().isEmpty()) {
			uploadFileCreate(sns.getImg1(),request,"sns/file/");
			sns.setImg1url(sns.getImg1().getOriginalFilename());
		}
		snsDao.update(sns);
		for(SnsItem si : sns.getItemList()) {
			snsItemDao.update(si);
		}		
	}
	
	//[sns] ootd 삭제
	public void deleteSns(int sns_no) {
		snsDao.delete(sns_no);
		snsItemDao.delete(sns_no);
	}
	
	//[sns] mypage 내가쓴글
	public List<Sns> mysns(String userid,int listAmount,int limit) {
		return snsDao.mylist(userid,listAmount,limit);
	}
	
	//[sns] mypage sns수
	public int getmySnsCount(String userid) {
		return snsDao.mysnscount(userid);
	}
	
	//[sns] 팔로우 기능
	public void Follow(String loginuser, String followuser) {
		snsDao.userFollow(loginuser,followuser);
	}
	
	//[sns] 팔로잉수
	public int getFollowCount(String userid) {
		return snsDao.FollowCount(userid);
	}

	//[sns] 팔로워수
	public int getFollowerCount(String userid) {
		return snsDao.FollowerCount(userid);
	}

	
	// [아이템]상품 리스트 정보
	public List<Item> getItemList(Integer listAmount, int limit,String keyword,Integer category) {
		return itemDao.list(category,listAmount,keyword,limit);
	}
	
	public List<Item> getItemList2(Integer pageNum, int limit,String keyword,Integer category) {
		return itemDao.list2(category,pageNum,keyword,limit);
	}
	
	public int getItemCount(String searchtype, String searchcontent) {
		return itemDao.count(searchtype, searchcontent);
	}
	public int getItemCount2(String keyword,Integer category) {
		return itemDao.count2(keyword,category);
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
	


	// [아이템]상품 작성

	public void itmeCreate(Item item, HttpServletRequest request) {
		if (item.getImgurl() != null && !item.getImgurl().isEmpty()) {
			uploadFileCreate(item.getImgurl(), request, "item/img/");
			item.setPictureUrl(item.getImgurl().getOriginalFilename());
		}

		itemDao.insert(item);	
	}
	
	//[아이템]상품 한줄평
	public void lineWrite(Line line, HttpServletRequest request) {
		int max= lineDao.maxnum();
		line.setLine_no(++max);
		lineDao.insert(line);
//		saleItemDao.reviewed(line.getOrder_no(),line.getSeq());
	}
	
	
	//[item] 상품 수정
	public void itemUpdate(Item item, HttpServletRequest request) {
		if (item.getImgurl() != null && !item.getImgurl().isEmpty()) {
			uploadFileCreate(item.getImgurl(), request, "item/img/");
			item.setPictureUrl(item.getImgurl().getOriginalFilename());
		}

		itemDao.update(item);	
	}
	
	//[item] 상품 삭제
	public void itemDelete(int item_no) {
		itemDao.delete(item_no);
		
	}
	
	//[item] 인기상품
	public List<Item> getRankItems() {
		return itemDao.rankItems();
	}
	
	//[item] 최신상품
	public List<Item> getNewItems() {
		return itemDao.newItems();
	}


	//장바구니
	public Item getItem(Integer item_no) {
		return itemDao.selectOne(item_no);
	}
	
	
	// [admin] dashboard index 1-1 이달 가입회원 0813
	public int newusers() {
		// TODO Auto-generated method stub
		return adminDao.newusers();
	}

	// [admin] dashboard index 1-2 전체 회원 0813
	public long numofusers() {
		// TODO Auto-generated method stub
		return adminDao.numofusers();
	}

	// [admin] dashboard index 1-3 이달 매출 0813
	public long salesofthismonth() {
		// TODO Auto-generated method stub
		return adminDao.salesofthismonth();
	}

	// [admin] dashboard index 1-4 누적 매출 0813
	public long salesdata() {
		// TODO Auto-generated method stub
		return adminDao.salesdata();
	}

	// [admin] dashboard index 1-5 누적 리뷰 0813
	public long numofreviews() {
		// TODO Auto-generated method stub
		return adminDao.numofreviews();
	}

	// [admin] dashboard index 2-1 주간 매출 0814
	public List<Buy> weeklyrevenue() {
		// TODO Auto-generated method stub
		return adminDao.weeklyrevenue();
	}

	// [admin] dashboard index 2-2 최근 4주간 매출 0815
	public List<Buy> monthlyrevenue() {
		// TODO Auto-generated method stub
		return adminDao.monthlyrevenue();
	}

	// [admin] widgets index 1-1 daily sales report 0816
	public List<Buy> getSales() {
		// TODO Auto-generated method stub
		return adminDao.getSales();
	}

	// [admin] widgets index 1-2 recently joined users 0816
	public List<User> getUsers() {
		// TODO Auto-generated method stub
		return adminDao.getUsers();
	}

	// [admin] widgets index 2-1 이번 달 구매 회원 랭킹 0816
	public List<Buy> monthlyheavyusers() {
		// TODO Auto-generated method stub
		return adminDao.monthlyheavyusers();
	}

	// [admin] widgets index 2-2 올해 최다 구매 회원 랭킹 0817
	public List<Buy> yearlyheavyusers() {
		// TODO Auto-generated method stub
		return adminDao.yearlyheavyusers();
	}

	// [admin] widgets index 3-1 우수 입점 스토어 차트 0817
	public List<Line> topthreestores() {
		// TODO Auto-generated method stub
		return adminDao.topthreestores();
	}

	// [admin] dashboard index 3-1 To-do list 0817
	public void addtodolist(Line line) {
		// TODO Auto-generated method stub
		adminDao.addtodolist();
	}

	// [admin] widgets index 3-2 최근 4주 별점 평균 상위 3개 스토어 0818
	public List<Line> getEvaluation() {
		// TODO Auto-generated method stub
		return adminDao.getEvaluation();
	}

	// [admin] charts index 1 스타일픽 회원 수 0820
	public List<User> totnumofusers() {
		// TODO Auto-generated method stub
		return adminDao.totnumofusers();
	}

	// [admin] charts index 3 Yearly : 연 매출 현황 0818
	public List<Buy> yearlyrevenue() {
		// TODO Auto-generated method stub
		return adminDao.yearlyrevenue();
	}
	//[admin] charts index 4-1 지역별 매출 평균 boxplot 0822
	public List<Buy> boxplot() {
		// TODO Auto-generated method stub
		return adminDao.boxplot();
	}

	// [admin] charts index 5 구매건 기준 매출 산점도 0819
	public List<Buy> scatterplot() {
		// TODO Auto-generated method stub
		return adminDao.scatterplot();
	}

	// [admin] charts index 6-1 카테고리별 판매 현황(월) 0820
	public List<Buy> salesbycategories() {
		// TODO Auto-generated method stub
		return adminDao.salesbycategories();
	}

	// [admin] charts index 7-2 상위 10개 스토어 (월 매출 기준) 0820
	public List<Buy> toptenstores() {
		// TODO Auto-generated method stub
		return adminDao.toptenstores();
	}
	//[admin] storelist 스토어 관리 0822
	public List<User> storelist(String searchtype, String searchcontent) {
		// TODO Auto-generated method stub
		return userDao.storelist(searchtype, searchcontent);
	}
	
	//[admin] salesmgr 매출 관리 0822
	public List<Buy> saleslist() {
		// TODO Auto-generated method stub
		return adminDao.saleslist();
	}

	/**
	 * Board
	 */
	public List<Board> getBoardList(int seq) {
		return boardDao.list(seq);
	}

	public List<Board> getFaqList(String category) {
		return boardDao.faqlist(category);
	}

	public Board getBoard(Integer no, boolean readcntable) {
		if (readcntable) {
			boardDao.readcnt(no);
		}
		return boardDao.selectOne(no);
	}
	
	public List<String> getCategoryList() {
		return boardDao.categoryList();
	}
	
	public List<Board> getQnaList(String stat) {
		return boardDao.qnalist(stat);
	}
	/** Board End **/
	public void boardWrite(Board board, HttpServletRequest request) {
		int max = boardDao.maxno();
		board.setNo(++max);
		boardDao.insert(board);
	}

	public Sale checkend(Sale sale, Cart cart, User loginUser) {
		int maxno = saleDao.getMaxSaleid();
		sale.setOrder_no(++maxno);
		sale.setUser(loginUser);
		sale.setUserid(loginUser.getUserid());
		
		saleDao.insert(sale);
		// 장바구니 판매 상품 정보
		List<ItemSet> itemList = cart.getItemSetList();
		int seq = 0;
		for(ItemSet itemSet : itemList) {
			++seq;
			SaleItem saleItem = new SaleItem(sale.getOrder_no(), seq, itemSet);
			sale.getItemList().add(saleItem);
			saleItemDao.insert(saleItem);
		}
		
		return sale;
	}

	

	
	//Q&A 작성
	public void qnaWrite(Qna qna, HttpServletRequest request) {
		int max= qnaDao.maxnum();
		qna.setQna_no(++max);
		qna.setGrp(max);
		qnaDao.insert(qna);
	}

	//Q&A
	public int qnacount(String searchtype, String searchcontent) {
		return qnaDao.count(searchtype, searchcontent);
	}

	//Q&A 목록
	public List<Qna> qnalist(Integer pageNum, int limit, String searchtype, String searchcontent, Integer item_no) {
		return qnaDao.qnalist(pageNum,limit, searchtype, searchcontent,item_no);
	}



	public void qnaReply(Qna qna) {
		qnaDao.updateGrpStrp(qna);
		int max=qnaDao.maxnum();
		qna.setQna_no(++max);
		qna.setGrplevel(qna.getGrplevel() + 1);
		qna.setGrpstep(qna.getGrpstep() +1);
	 	qnaDao.insert(qna);
		
	}

	public List<SaleItem> getusersalelist(int order_no) {
		return userDao.getusersalelist(order_no);
	}

	public List<Item> getmyitem(String userid) {
		return userDao.getmyitem(userid);
	}

	public int getNotmentionedQna(int item_no) {
		return userDao.getNotmentionedQna(item_no);
	}

	public List<SaleItem> getmysalelist(String userid) {
		return userDao.getmysalelist(userid);
	}

	public String getbuyerid(int order_no) {
		return userDao.getbuyerid(order_no);
	}

	public int getthisstat(int order_no) {
		return userDao.getthisstat(order_no);
	}

	public int getNotMentionedCount(String userid) {
		return lineDao.getNotMentionedCount(userid);
	}

	public List<SaleItem> getusersaleitem(String userid) {
		return userDao.getusersaleitem(userid);
	}

	public Date getorderdate(int order_no) {
		return userDao.getorderdate(order_no);
	}

}
