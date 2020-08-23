package dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import dao.mapper.SaleItemMapper;
import logic.SaleItem;

@Repository
public class SaleItemDao {
	@Autowired
	private SqlSessionTemplate template;
	private Map<String, Object> param = new HashMap<String, Object>();
	
	public void insert(SaleItem saleItem) {
		template.getMapper(SaleItemMapper.class).insert(saleItem);
	}

	public List<SaleItem> list(int saleid) {
		param.clear();
		param.put("saleid", saleid);
		return template.getMapper(SaleItemMapper.class).select(param);
	}

	//[chyeon] 유저가 리뷰를 등록할때 review컬럼의 값을 0->1로 변경
	public void reviewed(int order_no, int seq) {
		template.getMapper(SaleItemMapper.class).reviewed(order_no,seq);
		
	}
}
