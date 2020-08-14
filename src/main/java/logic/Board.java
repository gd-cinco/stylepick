package logic;

import java.util.Date;

public class Board {
	private int no = 0;
	private String title = "";
	private String author = "";
//	private Date regtime;
	
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
//	public Date getRegtime() {
//		return regtime;
//	}
//	public void setRegtime(Date regtime) {
//		this.regtime = regtime;
//	}
//	@Override
//	public String toString() {
//		return "Board [no=" + no + ", title=" + title + ", author=" + author + ", regtime=" + regtime + "]";
//	}
	
}
