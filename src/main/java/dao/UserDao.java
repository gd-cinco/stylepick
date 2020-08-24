package dao;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.sql.DataSource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.namedparam.BeanPropertySqlParameterSource;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.jdbc.core.namedparam.SqlParameterSource;
import org.springframework.stereotype.Repository;

import dao.mapper.UserMapper;
import logic.Buy;
import logic.Item;
import logic.Sale;
import logic.SaleItem;
import logic.User;
import logic.Userorder;

@Repository
public class UserDao {
	@Autowired
	private SqlSessionTemplate template;
	private Map<String, Object> param = new HashMap<>();

	public int joincompare(String key, String val) {
		return template.getMapper(UserMapper.class).joincompare(key,val);
	}
	
	public void insert(User user) {
		template.getMapper(UserMapper.class).insert(user);
	}
	
	public void sellerinsert(User user) {
		template.getMapper(UserMapper.class).sellerinsert(user);	
	}

	public User selectOne(String userid) {
		param.clear();
		param.put("userid", userid);
		return template.getMapper(UserMapper.class).select(param).get(0);
	}

	public void update(User user) {
		template.getMapper(UserMapper.class).update(user);
	}
	
	public void sellerupdate(User user) {
		template.getMapper(UserMapper.class).sellerupdate(user);
	}

	public void delete(String userid) {
		param.clear();
		param.put("userid", userid);
		template.getMapper(UserMapper.class).delete(param);
		
	}

	public List<User> list() {
		return template.getMapper(UserMapper.class).select(null);
	}
	
	//[admin] user list 유저리스트
	public List<User> list(String searchtype, String searchcontent) {
		param.clear();
		if (searchtype != null && searchcontent != null) {
			//sql += " WHERE " + searchtype + " LIKE :searchcontent ";
			param.put("searchtype", searchtype);
			param.put("searchcontent", "%"+searchcontent+"%");
		}
		return template.getMapper(UserMapper.class).select(null);
	}

	public List<User> list(String[] idchks) {
		param.clear();
		param.put("userids", idchks);
		return template.getMapper(UserMapper.class).select(param);
	}


	public int getmaxno() {
		return template.getMapper(UserMapper.class).getmaxno();
	}

	public List<Userorder> userorder(String userid) {
		return template.getMapper(UserMapper.class).getuserorder(userid);
	}
	
	public List<Userorder> userline(String userid) {
		return template.getMapper(UserMapper.class).getuserline(userid);
	}
	
	public int getmyshipping(String userid) {
		return template.getMapper(UserMapper.class).getmyshipping(userid);
	}
	
	public List<Sale> getusersale(String userid) {
		return template.getMapper(UserMapper.class).getusersale(userid);
	}
	
	public List<SaleItem> getusersalelist(int order_no) {
		return template.getMapper(UserMapper.class).usersalelist(order_no);
	}
	
	//[admin] storelist 스토어 관리 0822
	public List<User> storelist(String searchtype, String searchcontent) {
		// TODO Auto-generated method stub
		param.clear();
		if (searchtype != null && searchcontent != null) {
			//sql += " WHERE " + searchtype + " LIKE :searchcontent ";
			param.put("searchtype", searchtype);
			param.put("searchcontent", "%"+searchcontent+"%");
		}
		return template.getMapper(UserMapper.class).storelist(null);
	}

	public List<Item> getmyitem(String userid) {
		return template.getMapper(UserMapper.class).myitem(userid);
	}

	public int getNotmentionedQna(int item_no) {
		return template.getMapper(UserMapper.class).notmentionedQna(item_no);
	}

	public List<SaleItem> getmysalelist(String userid) {
		return template.getMapper(UserMapper.class).getmysalelist(userid);
	}

	public String getbuyerid(int order_no) {
		return template.getMapper(UserMapper.class).getbuyerid(order_no);
	}

	public int getthisstat(int order_no,int seq) {
		return template.getMapper(UserMapper.class).getthisstat(order_no,seq);
	}

	public List<SaleItem> getusersaleitem(String userid) {
		return template.getMapper(UserMapper.class).getusersaleItem(userid);
	}

	public Date getorderdate(int order_no) {
		return template.getMapper(UserMapper.class).getorderdate(order_no);
	}

}
