package logic;

import java.text.SimpleDateFormat;
import java.util.Date;


public class Buy {
	private int order_no;
	private String userid;
	private String name;
	private String address;
	private int tel;
	private Date orderdate;
	private int stat;
	private int amount;
	private String memo;
	
	private String weeks_ago;
	
	public String getWeeks_ago() {
		return weeks_ago+"주전";
	}
	public void setWeeks_ago(String weeks_ago) {
		this.weeks_ago = weeks_ago;
	}
	public int getOrder_no() {
		return order_no;
	}
	public void setOrder_no(int order_no) {
		this.order_no = order_no;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public int getTel() {
		return tel;
	}
	public void setTel(int tel) {
		this.tel = tel;
	}
	
	public String getOrderdateinString() {
		return new SimpleDateFormat("yyyy-MM-dd").format(orderdate);
	}
	
	public Date getOrderdate() {
		return orderdate;
	}
	public void setOrderdate(Date orderdate) {
		this.orderdate = orderdate;
	}
	public int getStat() {
		return stat;
	}
	public void setStat(int stat) {
		this.stat = stat;
	}
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}
	public String getMemo() {
		return memo;
	}
	public void setMemo(String memo) {
		this.memo = memo;
	}
	/*
	@Override
	public String toString() {
		return "Buy [order_no=" + order_no + ", userid=" + userid + ", name=" + name + ", address=" + address + ", tel="
				+ tel + ", orderdate=" + orderdate + ", stat=" + stat + ", amount=" + amount + ", memo=" + memo + "]";
	}
	*/
	@Override
	public String toString() {
		return "Buy [order_no=" + order_no + ", userid=" + userid + ", name=" + name + ", address=" + address + ", tel="
				+ tel + ", orderdate=" + orderdate + ", stat=" + stat + ", amount=" + amount + ", memo=" + memo
				+ ", weeks_ago=" + weeks_ago + "]";
	}
	
	
	
	
}


/*
 * CREATE TABLE buy
(
	-- 주문번호
	order_no int(100) NOT NULL COMMENT '주문번호',
	-- 회원아이디
	userid int(100) NOT NULL COMMENT '회원아이디',
	-- 수령자이름
	name varchar(20) NOT NULL COMMENT '수령자이름',
	-- 수령지주소
	address varchar(100) NOT NULL COMMENT '수령지주소',
	-- 수령자번호
	tel varchar(30) NOT NULL COMMENT '수령자번호',
	-- 주문날짜
	orderdate datetime NOT NULL COMMENT '주문날짜',
	-- 출고여부
	stat int NOT NULL COMMENT '출고여부',
	-- 총 금액
	amount int(100) NOT NULL COMMENT '총 금액',
	-- 배송메모
	memo varchar(200) COMMENT '배송메모',
	PRIMARY KEY (order_no)
);
 */
