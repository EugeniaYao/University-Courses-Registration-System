package com.springboot.academic.mapper;

import com.springboot.academic.model.Achieve;
import org.apache.ibatis.annotations.*;

import java.util.List;


public interface AchieveMapper {

	@Select("SELECT a.*,u.realname,s.scholarshipname,s.price FROM achieve a " +
			"left join `user` u on a.userid = u.userid " +
			"left join scholarship s on a.scholarshipid = s.scholarshipid " +
			"where u.realname is not null and s.scholarshipname is not null")
	List<Achieve> findAchieveAll();

	@Select("SELECT * FROM achieve WHERE achieveid = #{id}")
	Achieve getOne(Integer id);

	@Insert("INSERT INTO achieve (userid,scholarshipid,addtime) " +
			"VALUES(#{userid}, #{scholarshipid}, #{addtime})")
	void insert(Achieve achieve);

	@Update("UPDATE achieve SET userid=#{userid},scholarshipid=#{scholarshipid} WHERE achieveid =#{achieveid}")
	void update(Achieve achieve);

	@Delete("DELETE FROM achieve WHERE achieveid =#{id}")
	void delete(Integer id);

	@Select("SELECT a.*,u.realname,s.scholarshipname,s.price FROM achieve a " +
			"left join `user` u on a.userid = u.userid " +
			"left join scholarship s on a.scholarshipid = s.scholarshipid " +
			"where u.realname is not null and s.scholarshipname is not null and a.userid=#{stuId}")
	List<Achieve> findAchieveAllByStuId(@Param("stuId") Integer stuId);
}

