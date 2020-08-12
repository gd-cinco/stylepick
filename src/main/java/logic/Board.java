package logic;

import java.util.Date;

public class Board {
	private int no;
	private String title;
	private String author;
	private String regtime;
	
	public Board() {
		no = 1;
		title = "test1";
		author = "admin";
		regtime = "2020-08-12";
	}
	
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
		return regtime;
	}
	public void setRegtime(String regtime) {
		this.regtime = regtime;
	}
	@Override
	public String toString() {
		return "Board [no=" + no + ", title=" + title + ", author=" + author + ", regtime=" + regtime + "]";
	}
	
}
