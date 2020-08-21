package logic;

import java.text.SimpleDateFormat;
import java.util.Date;

public class Board {
	private Integer no = null;
	private Integer count = null;
	private Integer seq = null;
	private String category = null;
	private String title = null;
	private String author = null;
	private Date regtime = null;
	private String stat = null;
	private Integer readcnt = null;
	private String content;
	private String file1;
	
	public Board() {
		
	}
	
	public Board(Integer no, String title, String author, Integer seq, String category, String stat, Date regtime, int readcnt, String content, String file1) {
		this.no = no;
		this.seq = seq;
		this.category = category;
		this.title = title;
		this.author = author;
		this.regtime = regtime;
		this.stat = stat;
		this.readcnt = readcnt;
		this.content = content;
		this.file1 = file1;
	}
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
	public String getRegtime() {
		return new SimpleDateFormat("yyyy-MM-dd").format(regtime);
	}
	public void setRegtime(Date regtime) {
		this.regtime = regtime;
	}
	public Integer getSeq() {
		return seq;
	}
	public void setSeq(Integer seq) {
		this.seq = seq;
	}
	public String getCategory() {
		return category.replace(",", " >> ");
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getStat() {
		return stat;
	}
	public void setStat(String stat) {
		this.stat = stat;
	}
	public void setNo(Integer no) {
		this.no = no;
	}

	public Integer getReadcnt() {
		return readcnt;
	}

	public void setReadcnt(Integer readcnt) {
		this.readcnt = readcnt;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getFile1() {
		return file1;
	}

	public void setFile1(String file1) {
		this.file1 = file1;
	}
	
	
	
}
