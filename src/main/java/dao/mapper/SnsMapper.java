package dao.mapper;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import logic.Sns;

public interface SnsMapper {

	@Select("select ifnull(max(sns_no),0) from sns")
	int maxnum();

	@Insert("insert into sns (sns_no,type,userid,imgUrl,description,regdate) values (#{sns_no},#{type},#{userid},#{imgUrl},#{description},now())")
	void insert(Sns sns);

}

