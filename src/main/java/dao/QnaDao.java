package dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import dao.mapper.QnaMapper;
import logic.Qna;


@Repository
public class QnaDao {
	@Autowired
	private SqlSessionTemplate template;

	Map<String,Object>param = new HashMap<>();
	public int maxnum() {
		return template.getMapper(QnaMapper.class).maxnum();
	}

	public void insert(Qna qna) {
		template.getMapper(QnaMapper.class).insert(qna);
		
	}

	public Qna selectOne(Integer qna_no) {
	
		return null;
	}

	public int count(String searchtype, String searchcontent) {
		param.clear();
		param.put("searchtype", searchtype );
		param.put("searchcontent", searchcontent );
		return template.getMapper(QnaMapper.class).count(param);
	}

	public List<Qna> qnalist(Integer pageNum, int limit, String searchtype, String searchcontent) {
		param.clear();
		param.put("searchtype", searchtype );
		param.put("searchcontent", searchcontent );
		param.put("startrow", (pageNum-1) * limit);
		param.put("limit",limit);
		return template.getMapper(QnaMapper.class).select(param);
	}

	public void updateGrpStrp(Qna qna) {
		param.clear();
		param.put("grp",qna.getGrp());

		param.put("grpstep",qna.getGrpstep());
		template.getMapper(QnaMapper.class).grpStep(param);
		}



}
