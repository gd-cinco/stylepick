package logic;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class Sns {
	private int sns_no;
	private int type;
	private String userid;
	private String img1url;
	private MultipartFile img1;
	private MultipartFile img2;
	private MultipartFile img3;
	private String description;
	private Date regdate;
	private List<SnsItem> itemList = new ArrayList<SnsItem>();
	private int weight;
	private int height;
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
	public String getImg1url() {
		return img1url;
	}
	public void setImg1url(String img1url) {
		this.img1url = img1url;
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
	public MultipartFile getImg1() {
		return img1;
	}
	public void setImg1(MultipartFile img1) {
		this.img1 = img1;
	}
	public MultipartFile getImg2() {
		return img2;
	}
	public void setImg2(MultipartFile img2) {
		this.img2 = img2;
	}
	public MultipartFile getImg3() {
		return img3;
	}
	public void setImg3(MultipartFile img3) {
		this.img3 = img3;
	}
	public int getWeight() {
		return weight;
	}
	public void setWeight(int weight) {
		this.weight = weight;
	}
	public int getHeight() {
		return height;
	}
	public void setHeight(int height) {
		this.height = height;
	}
	@Override
	public String toString() {
		return "Sns [sns_no=" + sns_no + ", type=" + type + ", userid=" + userid + ", img1url=" + img1url + ", img1="
				+ img1 + ", img2=" + img2 + ", img3=" + img3 + ", description=" + description + ", regdate=" + regdate
				+ ", itemList=" + itemList + ", weight=" + weight + ", height=" + height + "]";
	}
	
	
}
