package logic;

public class SaleItem {
	private int saleid;
	private int seq;
	private int itemid;
	private int quantity;
	private Item item;
	private String item_option;
	private String size;

	public SaleItem() {}

	public SaleItem(int saleid, int seq, ItemSet itemSet) {
		this.saleid = saleid;
		this.seq = seq;
		this.item = itemSet.getItem();
		this.itemid = item.getItem_no();
		this.quantity = itemSet.getQuantity();
		this.item_option = itemSet.getItem_option();
		this.size = itemSet.getSize();
	}

	public int getSaleid() {
		return saleid;
	}

	public void setSaleid(int saleid) {
		this.saleid = saleid;
	}

	public int getSeq() {
		return seq;
	}

	public void setSeq(int seq) {
		this.seq = seq;
	}

	public int getItemid() {
		return itemid;
	}

	public void setItemid(int itemid) {
		this.itemid = itemid;
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
		return "SaleItem [saleid=" + saleid + ", seq=" + seq + ", itemid=" + itemid + ", quantity=" + quantity
				+ ", item=" + item + "]";
	}
	
	
}
