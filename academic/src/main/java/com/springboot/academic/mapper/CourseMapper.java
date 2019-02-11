package com.springboot.academic.mapper;

import com.springboot.academic.model.Course;
import com.springboot.academic.model.User;
import org.apache.ibatis.annotations.*;

import java.util.List;


public interface CourseMapper {

    @Select("SELECT c.*,u.realname FROM course c " +
            "left join `user` u on c.userid = u.userid where u.realname is not null")
    List<Course> findCourseAll();

    @Select("SELECT * FROM course WHERE courseid = #{id}")
    Course getOne(Integer id);

    @Insert("INSERT INTO course (userid,coursename,scorce,type," +
			"address,algorithm,price,num,choosenum,semester) " +
			"VALUES(#{userid}, #{coursename}, #{scorce},#{type}, #{address}, " +
			"#{algorithm},#{price}, #{num}, #{choosenum}, #{semester})")
    void insert(Course course);

    @Update("UPDATE course SET userid=#{userid},coursename=#{coursename}," +
			"scorce=#{scorce},type=#{type},address=#{address},algorithm=#{algorithm}," +
			"price=#{price},num=#{num},choosenum=#{choosenum} " +
			"WHERE courseid =#{courseid}")
    void update(Course course);

    @Delete("DELETE FROM course WHERE courseid =#{id}")
    void delete(Integer id);

    @Select("SELECT c.*,u.realname FROM course c " +
			"left join `user` u on c.userid = u.userid " +
			"where u.realname is not null and c.userid=#{teaId}")
    List<Course> findCourseAllByTeaId(@Param("teaId") Integer teaId);
}

