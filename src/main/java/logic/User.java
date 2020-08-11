package logic;

import java.util.Date;

import javax.validation.constraints.Past;
import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.NotEmpty;
import org.springframework.format.annotation.DateTimeFormat;

public class User {
	private int no;
	@NotEmpty(message="필수정보입니다.")
	private String userid;
	@NotEmpty(message="필수정보입니다.")
	private String password;
	private String password2;
	@NotEmpty(message="필수정보입니다.")
	private String nickname;
	@Email(message="email 형식으로 입력하세요.")
	private String email;
	private String phoneno;
	private int age;
	private String imgurl;
	private int gender; //1:남 2:여
	private int sns_type;
	private String sns_id;
	private int seller; //0:아님 1:판매자임
	private String name;
	private String com_name;
	private int com_regist;
	private String com_img;
	private String com_tel;
	private Date regdate;
	private String address;
	private String order_memo;
	private String order_tel;
	
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}

	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getPassword2() {
		return password2;
	}
	public void setPassword2(String password2) {
		this.password2 = password2;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPhoneno() {
		return phoneno;
	}
	public void setPhoneno(String phoneno) {
		this.phoneno = phoneno;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	public String getImgurl() {
		return imgurl;
	}
	public void setImgurl(String imgurl) {
		this.imgurl = imgurl;
	}
	public int getGender() {
		return gender;
	}
	public void setGender(int gender) {
		this.gender = gender;
	}
	public int getSns_type() {
		return sns_type;
	}
	public void setSns_type(int sns_type) {
		this.sns_type = sns_type;
	}
	public String getSns_id() {
		return sns_id;
	}
	public void setSns_id(String sns_id) {
		this.sns_id = sns_id;
	}
	public int getSeller() {
		return seller;
	}
	public void setSeller(int seller) {
		this.seller = seller;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getCom_name() {
		return com_name;
	}
	public void setCom_name(String com_name) {
		this.com_name = com_name;
	}
	public int getCom_regist() {
		return com_regist;
	}
	public void setCom_regist(int com_regist) {
		this.com_regist = com_regist;
	}
	public String getCom_img() {
		return com_img;
	}
	public void setCom_img(String com_img) {
		this.com_img = com_img;
	}
	public String getCom_tel() {
		return com_tel;
	}
	public void setCom_tel(String com_tel) {
		this.com_tel = com_tel;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getOrder_memo() {
		return order_memo;
	}
	public void setOrder_memo(String order_memo) {
		this.order_memo = order_memo;
	}
	public String getOrder_tel() {
		return order_tel;
	}
	public void setOrder_tel(String order_tel) {
		this.order_tel = order_tel;
	}
	@Override
	public String toString() {
		return "User [no=" + no + ", userid=" + userid + ", password=" + password + ", password2=" + password2
				+ ", nickname=" + nickname + ", email=" + email + ", phoneno=" + phoneno + ", age=" + age + ", imgurl="
				+ imgurl + ", gender=" + gender + ", sns_type=" + sns_type + ", sns_id=" + sns_id + ", seller=" + seller
				+ ", name=" + name + ", com_name=" + com_name + ", com_regist=" + com_regist + ", com_img=" + com_img
				+ ", com_tel=" + com_tel + ", regdate=" + regdate + ", address=" + address + ", order_memo="
				+ order_memo + ", order_tel=" + order_tel + "]";
	}
	
	
	

	
	
}
