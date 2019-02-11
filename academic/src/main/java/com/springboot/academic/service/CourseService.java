package com.springboot.academic.service;

import com.springboot.academic.model.Course;
import com.springboot.academic.model.User;

import java.util.List;

public interface CourseService {

    List<Course> findCourseAll();

    Course findSingleCourse(Integer id);

    void addCourse(Course obj);

    void updateCourse(Course obj);

    void deleteCourse(Integer id);

    List<Course> findCourseAllByTeaId(Integer teaId);
}
