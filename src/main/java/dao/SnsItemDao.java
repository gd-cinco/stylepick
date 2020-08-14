package dao;

import java.util.HashMap;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import dao.mapper.SnsItemMapper;
import logic.SnsItem;

@Repository
public class SnsItemDao {
	@Autowired
	private SqlSessionTemplate template;
	private Map<String,Object> param = new HashMap<>();
	
	public void insert(SnsItem snsItem) {
		template.getMapper(SnsItemMapper.class).insert(snsItem);
	}
/*	
	public List<SnsItem> list(int sns_no) {
		param.clear();
		param.put("saleid",saleid);
		return template.getMapper(SaleItemMapper.class).select(param); 
	}
*/
}
