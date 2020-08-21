package logic;

import java.util.Date;

public class Userorder {
	private String item_name;
	private Date orderdate;
	private int price;
	private int stat;
	
	public String getItem_name() {
		return item_name;
	}
	public void setItem_name(String item_name) {
		this.item_name = item_name;
	}

	public Date getOrderdate() {
		return orderdate;
	}
	public void setOrderdate(Date orderdate) {
		this.orderdate = orderdate;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getStat() {
		return stat;
	}
	public void setStat(int stat) {
		this.stat = stat;
	}
	@Override
	public String toString() {
		return "Userorder [item_name=" + item_name + ", orderdate=" + orderdate + ", price=" + price + ", stat=" + stat
				+ "]";
	}
	
}
