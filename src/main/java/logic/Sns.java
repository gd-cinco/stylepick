package logic;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class Sns {
	private int sns_no;
	private int type;
	private String userid;
	private String imgUrl;
	private List<MultipartFile> imgs;
	private String description;
	private Date regdate;
	private List<SnsItem> itemList = new ArrayList<SnsItem>();
	public int getSns_no() {
		return sns_no;
	}
	public void setSns_no(int sns_no) {
		this.sns_no = sns_no;
	}
	public int getType() {
		return type;
	}
	public void setType(int type) {
		this.type = type;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getImgUrl() {
		return imgUrl;
	}
	public void setImgUrl(String imgUrl) {
		this.imgUrl = imgUrl;
	}
	public List<MultipartFile> getImgs() {
		return imgs;
	}
	public void setImgs(List<MultipartFile> imgs) {
		this.imgs = imgs;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	public List<SnsItem> getItemList() {
		return itemList;
	}
	public void setItemList(List<SnsItem> itemList) {
		this.itemList = itemList;
	}
	@Override
	public String toString() {
		return "Sns [sns_no=" + sns_no + ", type=" + type + ", userid=" + userid + ", imgUrl=" + imgUrl + ", imgs=" + imgs
				+ ", description=" + description + ", regdate=" + regdate + ", itemList=" + itemList + "]";
	}
	
}
