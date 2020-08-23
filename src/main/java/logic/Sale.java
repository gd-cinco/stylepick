package logic;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class Sale {
	private int order_no;
	private String userid;
	private Date orderdate;
	private User user;
	private List<SaleItem> itemList = new ArrayList<SaleItem>();
	private String name;
	private String address;
	private String tel;
	private String memo;
	private long amount;
	private String stat;

	public long getAmount() {
		long sum = 0;
		for(SaleItem si : itemList) {
			sum += si.getItem().getPrice() * si.getQuantity();
		}
		return sum;
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

	public Date getOrderdate() {
		return orderdate;
	}

	public void setOrderdate(Date orderdate) {
		this.orderdate = orderdate;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public List<SaleItem> getItemList() {
		return itemList;
	}

	public void setItemList(List<SaleItem> itemList) {
		this.itemList = itemList;
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

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getMemo() {
		return memo;
	}

	public void setMemo(String memo) {
		this.memo = memo;
	}

	public String getStat() {
		return stat;
	}

	public void setStat(String stat) {
		this.stat = stat;
	}

	public String getAddress_qu() {
		int idx = this.address.indexOf("구");
		String rtn = this.address.substring(0, idx);
		return rtn;
	}

	@Override
	public String toString() {
		return "Sale [order_no=" + order_no + ", userid=" + userid + ", orderdate=" + orderdate + ", user=" + user
				+ ", itemList=" + itemList + ", name=" + name + ", address=" + address + ", tel=" + tel + ", memo="
				+ memo + ", amount=" + getAmount() + ", stat=" + stat + "]";
	}

}
