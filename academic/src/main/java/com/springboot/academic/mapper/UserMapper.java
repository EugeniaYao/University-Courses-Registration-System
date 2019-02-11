package com.springboot.academic.mapper;

import com.springboot.academic.model.User;
import org.apache.ibatis.annotations.*;

import java.util.List;


public interface UserMapper {

    @Select("SELECT * FROM `user` where role=#{role}")
    List<User> findUserAll(@Param("role") String role);

    @Select("SELECT * FROM `user` WHERE userid = #{id}")
    User getOne(Integer id);

    @Insert("INSERT INTO `user` (username,pwd,role,code,sex,birthday," +
			"realname,college,major,tel,email,scorce,tuition) " +
            "VALUES(#{username}, #{pwd}, #{role},#{code},#{sex},#{birthday}," +
			"#{realname},#{college},#{major},#{tel},#{email},#{scorce},#{tuition})")
    void insert(User user);

    @Update("UPDATE `user` SET username=#{username},pwd=#{pwd},role=#{role},code=#{code}," +
			"sex=#{sex},birthday=#{birthday},realname=#{realname},college=#{college}," +
			"major=#{major},tel=#{tel},email=#{email},scorce=#{scorce},tuition=#{tuition} " +
			"WHERE userid =#{userid}")
    void update(User user);

    @Delete("DELETE FROM `user` WHERE userid =#{id}")
    void delete(Integer id);

    @Select("SELECT * FROM `user` where username=#{uname} and pwd=#{pwd} and role=#{role}")
    User login(@Param("uname") String uname, @Param("pwd")String pwd, @Param("role")String role);
}

