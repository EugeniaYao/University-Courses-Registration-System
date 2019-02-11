package com.springboot.academic.mapper;

import com.springboot.academic.model.Stuwork;
import com.springboot.academic.model.User;
import org.apache.ibatis.annotations.*;

import java.util.List;


public interface StuworkMapper {

    @Select("SELECT * FROM stuwork")
    List<Stuwork> findStuworkAll();

    @Select("SELECT * FROM stuwork WHERE stuworkid = #{id}")
    Stuwork getOne(Integer id);

    @Insert("INSERT INTO stuwork (stuid,homeworkid,addtime,filepath,scorce,type) " +
			"VALUES(#{stuid}, #{homeworkid}, #{addtime}, #{filepath}, #{scorce}, #{type})")
    void insert(Stuwork stuwork);

    @Update("UPDATE stuwork SET stuid=#{stuid},homeworkid=#{homeworkid},addtime=#{addtime}," +
			"filepath=#{filepath},scorce=#{scorce},type=#{type} WHERE stuworkid =#{stuworkid}")
    void update(Stuwork stuwork);

    @Delete("DELETE FROM stuwork WHERE stuworkid =#{id}")
    void delete(Integer id);

    @Select("SELECT s.*,u.realname,h.title FROM stuwork s " +
			"left join `user` u on s.stuid=u.userid " +
			"left join homework h on s.homeworkid=h.homeworkid " +
			"where u.realname is not null and h.title is not null and h.teaid = #{teaId} ")
    List<Stuwork> findStuworkAllByTeaId(@Param("teaId") Integer teaId);

    @Select("SELECT s.*,u.realname,h.title FROM stuwork s " +
			"left join `user` u on s.stuid=u.userid " +
			"left join homework h on s.homeworkid=h.homeworkid " +
			"where u.realname is not null and h.title is not null and s.stuid = #{stuId} ")
    List<Stuwork> findStuworkAllByStuId(@Param("stuId") Integer stuId);
}

