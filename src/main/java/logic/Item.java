package logic;

import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

public class Item {
	private String item_no; //상품번호
	private String userid; //판매자 아이디
	private String code;	//상품 코드
	private int category; //카테고리
	private String subject; //상품 제목
	private String name; //상품이름
	private int price; //상품 가격
	private String keyword; //키워드
	private MultipartFile imgurl; //상품사진
	private String content; //상품내용
	private Date regdate; //등록일
	private int readcnt; //조회수
	
	//옵션은 추후 db에 할지 한번에 할지 정함
	
	
	public String getItem_no() {
		return item_no;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public int getReadcnt() {
		return readcnt;
	}
	public void setReadcnt(int readcnt) {
		this.readcnt = readcnt;
	}
	public void setItem_no(String item_no) {
		this.item_no = item_no;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public int getCategory() {
		return category;
	}
	public void setCategory(int category) {
		this.category = category;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	public MultipartFile getImgurl() {
		return imgurl;
	}
	public void setImgurl(MultipartFile imgurl) {
		this.imgurl = imgurl;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	
}
