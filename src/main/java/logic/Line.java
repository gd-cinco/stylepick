package logic;

import java.util.Date;

public class Line {
	private int line_no ;
	private int item_no;
	private String userid;
	private String subject;
	private String content;
	private long evaluation;
	private Date regdate;
	private String com_name;
	
	
	public int getLine_no() {
		return line_no;
	}
	public void setLine_no(int line_no) {
		this.line_no = line_no;
	}
	public int getItem_no() {
		return item_no;
	}
	public void setItem_no(int item_no) {
		this.item_no = item_no;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public long getEvaluation() {
		return evaluation;
	}
	public void setEvaluation(long evaluation) {
		this.evaluation = evaluation;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	public String getCom_name() {
		return com_name;
	}
	public void setCom_name(String com_name) {
		this.com_name = com_name;
	}
	@Override
	public String toString() {
		return "Line [line_no=" + line_no + ", item_no=" + item_no + ", userid=" + userid + ", subject=" + subject
				+ ", content=" + content + ", evaluation=" + evaluation + ", regdate=" + regdate + ", com_name="
				+ com_name + "]";
	}
	
	
	
	
}
