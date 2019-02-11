package com.springboot.academic.mapper;

import com.springboot.academic.model.Scholarship;
import com.springboot.academic.model.User;
import org.apache.ibatis.annotations.*;

import java.util.List;


public interface ScholarshipMapper {

    @Select("SELECT * FROM scholarship")
    List<Scholarship> findScholarshipAll();

    @Select("SELECT * FROM scholarship WHERE scholarshipid = #{id}")
    Scholarship getOne(Integer id);

    @Insert("INSERT INTO scholarship (scholarshipname,price,ptype,type) " +
            "VALUES(#{scholarshipname}, #{price}, #{ptype}, #{type})")
    void insert(Scholarship scholarship);

    @Update("UPDATE scholarship SET scholarshipname=#{scholarshipname}," +
			"price=#{price},ptype=#{ptype},type=#{type} " +
			"WHERE scholarshipid =#{scholarshipid}")
    void update(Scholarship scholarship);

    @Delete("DELETE FROM scholarship WHERE scholarshipid =#{id}")
    void delete(Integer id);
}

