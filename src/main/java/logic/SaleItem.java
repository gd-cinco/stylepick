package logic;

public class SaleItem {
	private int order_no;
	private int seq;
	private int item_no;
	private int quantity;
	private Item item;
	private String item_option;
	private String size;

	public SaleItem() {}

	public SaleItem(int saleid, int seq, ItemSet itemSet) {
		this.order_no = saleid;
		this.seq = seq;
		this.item = itemSet.getItem();
		this.item_no = item.getItem_no();
		this.quantity = itemSet.getQuantity();
		this.item_option = itemSet.getItem_option();
		this.size = itemSet.getSize();
	}

	public int getSaleid() {
		return order_no;
	}

	public void setSaleid(int saleid) {
		this.order_no = saleid;
	}

	public int getSeq() {
		return seq;
	}

	public void setSeq(int seq) {
		this.seq = seq;
	}

	public int getItemid() {
		return item_no;
	}

	public void setItemid(int itemid) {
		this.item_no = itemid;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public Item getItem() {
		return item;
	}

	public void setItem(Item item) {
		this.item = item;
	}

	public String getItem_option() {
		return item_option;
	}

	public void setItem_option(String item_option) {
		this.item_option = item_option;
	}

	public String getSize() {
		return size;
	}

	public void setSize(String size) {
		this.size = size;
	}

	@Override
	public String toString() {
		return "SaleItem [order_no=" + order_no + ", seq=" + seq + ", item_no=" + item_no + ", quantity=" + quantity
				+ ", item=" + item + ", item_option=" + item_option + ", size=" + size + "]";
	}
	
}
