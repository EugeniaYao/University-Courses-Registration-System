package com.springboot.academic.mapper;

import com.springboot.academic.model.Choose;
import com.springboot.academic.model.User;
import org.apache.ibatis.annotations.*;

import java.util.List;


public interface ChooseMapper {

    @Select("SELECT ch.*,u.realname,c.coursename,c.scorce FROM choose ch " +
            "left join `user` u on ch.userid = u.userid " +
			"left join course c on c.courseid = ch.courseid " +
			"where u.realname is not null and c.coursename is not null")
    List<Choose> findChooseAll();

    @Select("SELECT * FROM choose WHERE chooseid = #{id}")
    Choose getOne(Integer id);

    @Insert("INSERT INTO choose (courseid,userid,addtime,grade,semester) " +
			"VALUES(#{courseid}, #{userid}, #{addtime}, #{grade}, #{semester})")
    void insert(Choose choose);

    @Update("UPDATE choose SET courseid=#{courseid},userid=#{userid} WHERE chooseid =#{chooseid}")
    void update(Choose choose);

    @Delete("DELETE FROM choose WHERE chooseid =#{id}")
    void delete(Integer id);

    @Select("SELECT ch.*,u.realname,c.coursename,c.scorce FROM choose ch " +
			"left join `user` u on ch.userid = u.userid " +
			"left join course c on c.courseid = ch.courseid " +
			"where u.realname is not null and c.coursename is not null and c.userid=#{teaId}")
    List<Choose> findChooseAllByTeaId(@Param("teaId") Integer teaId);

    @Select("SELECT ch.*,u.realname,c.coursename,c.scorce FROM choose ch " +
			"left join `user` u on ch.userid = u.userid " +
			"left join course c on c.courseid = ch.courseid " +
			"where u.realname is not null and c.coursename is not null and ch.userid=#{stuId}")
    List<Choose> findChooseAllByStuId(@Param("stuId")Integer stuId);
}

