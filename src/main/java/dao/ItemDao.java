package dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import dao.mapper.ItemMapper;
import logic.Item;

@Repository
public class ItemDao {
	@Autowired
	private SqlSessionTemplate template;
	private Map<String,Object> param =new HashMap<>();
	
	public int maxnum() {
		return template.getMapper(ItemMapper.class).maxnum();
	}
	
	public List<Item> list(int category) {
		return template.getMapper(ItemMapper.class).list(category);
	}

	public void insert(Item item) {

		template.getMapper(ItemMapper.class).insert(item);
	}

	
	//조회수 증가
//	public void readcntadd(Integer item_no) {
//		param.clear();
//		param.put("num", item_no);
//		template.getMapper(ItemMapper.class).readcntadd(item_no);
//	}
	
}
