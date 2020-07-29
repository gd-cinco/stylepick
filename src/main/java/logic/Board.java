package logic;

import java.util.Date;

public class Board {
	private int num;
	private int seq;
	private String category;
	private String author;
	private String title;
	private String content;
	private String fileurl;
	private Date regtime;
	private String stat;
	
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public int getSeq() {
		return seq;
	}
	public void setSeq(int seq) {
		this.seq = seq;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getFileurl() {
		return fileurl;
	}
	public void setFileurl(String fileurl) {
		this.fileurl = fileurl;
	}
	public Date getRegtime() {
		return regtime;
	}
	public void setRegtime(Date regtime) {
		this.regtime = regtime;
	}
	public String getStat() {
		return stat;
	}
	public void setStat(String stat) {
		this.stat = stat;
	}
	
	@Override
	public String toString() {
		return "Board [num=" + num + ", seq=" + seq + ", category=" + category + ", author=" + author + ", title="
				+ title + ", content=" + content + ", fileurl=" + fileurl + ", regtime=" + regtime + ", stat=" + stat
				+ "]";
	}
	
}
