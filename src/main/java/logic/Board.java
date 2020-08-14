package logic;

import java.text.SimpleDateFormat;
import java.util.Date;

public class Board {
	private Integer no = null;
	private Integer seq = null;
	private String category = null;
	private String title = null;
	private String author = null;
	private Date regtime = new Date();
	private String stat = null;
	
//	public Board(int no, String title, String author) {
//		this.no = no;
//		this.title = title;
//		this.author = author;
//		this.regtime = new Date();
//	}
	
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
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
		return category;
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
	@Override
	public String toString() {
		return "Board [no=" + no + ", seq=" + seq + ", category=" + category + ", title=" + title + ", author=" + author
				+ ", regtime=" + regtime + ", stat=" + stat + "]";
	}

	
}
