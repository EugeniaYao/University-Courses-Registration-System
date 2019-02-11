package com.springboot.academic.service.impl;

import com.springboot.academic.mapper.CourseMapper;
import com.springboot.academic.model.Course;
import com.springboot.academic.service.CourseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("courseService")
public class CourseServiceImpl implements CourseService {

    @Autowired
    private CourseMapper courseMapper;

    @Override
    public List<Course> findCourseAll() {
        return courseMapper.findCourseAll();
    }

    @Override
    public Course findSingleCourse(Integer id) {
        return courseMapper.getOne(id);
    }

    @Override
    public void addCourse(Course obj) {
        courseMapper.insert(obj);
    }

    @Override
    public void updateCourse(Course obj) {
        courseMapper.update(obj);
    }

    @Override
    public void deleteCourse(Integer id) {
        courseMapper.delete(id);
    }

    @Override
    public List<Course> findCourseAllByTeaId(Integer teaId) {
        return courseMapper.findCourseAllByTeaId(teaId);
    }
}
