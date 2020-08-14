package logic;

import java.util.Date;

public class Board {
	private Integer no = null;
	private String title = null;
	private String author = null;
	private Date regtime = null;
	
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
	public Date getRegtime() {
		return regtime;
	}
	public void setRegtime(Date regtime) {
		this.regtime = regtime;
	}
	@Override
	public String toString() {
		return "Board [no=" + no + ", title=" + title + ", author=" + author + ", regtime=" + regtime + "]";
	}
	
}
