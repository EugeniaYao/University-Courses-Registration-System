package com.springboot.academic.mapper;

import com.springboot.academic.model.Homework;
import com.springboot.academic.model.User;
import org.apache.ibatis.annotations.*;

import java.util.List;


public interface HomeworkMapper {

    @Select("SELECT * FROM homework")
    List<Homework> findHomeworkAll();

    @Select("SELECT * FROM homework WHERE homeworkid = #{id}")
    Homework getOne(Integer id);

    @Insert("INSERT INTO homework (teaid,courseid,title,content,addtime," +
			"type,optiona,optionb,optionc,optiond) " +
            "VALUES(#{teaid}, #{courseid}, #{title},#{content}, #{addtime}, " +
			"#{type},#{optiona}, #{optionb}, #{optionc},#{optiond})")
    void insert(Homework homework);

    @Update("UPDATE homework SET teaid=#{teaid},courseid=#{courseid},title=#{title}," +
			"content=#{content},addtime=#{addtime},type=#{type},optiona=#{optiona}," +
			"optionb=#{optionb},optionc=#{optionc},optiond=#{optiond} " +
			"WHERE homeworkid =#{homeworkid}")
    void update(Homework homework);

    @Delete("DELETE FROM homework WHERE homeworkid =#{id}")
    void delete(Integer id);

    @Select("SELECT h.*,u.realname,c.coursename FROM homework h " +
			"left join `user` u on h.teaid = u.userid " +
			"left join course c on h.courseid = c.courseid " +
			"where u.realname is not null and c.coursename is not null and h.teaid=#{teaId}")
    List<Homework> findHomeworkAllByTeaId(@Param("teaId") Integer teaId);

    @Select("SELECT h.*,u.realname,c.coursename FROM homework h " +
			"left join `user` u on h.teaid = u.userid " +
			"left join course c on h.courseid = c.courseid " +
			"where u.realname is not null and c.coursename is not null " +
			"and h.courseid in (select courseid from choose where userid=#{stuId})")
    List<Homework> findHomeworkAllByStuId(@Param("stuId")Integer stuId);
}

