package com.springboot.academic.controller;

import com.springboot.academic.model.Course;
import com.springboot.academic.service.CourseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/course")
public class CourseController {

    @Autowired
    CourseService courseService;

    @RequestMapping("/findCourseAll")
    public ModelAndView findCourseAll(HttpSession httpSession) {
        ModelAndView modelAndView = new ModelAndView();
        String roler = (String) httpSession.getAttribute("roler");
        List<Course> courseList = null;
        if("1".equals(roler)){
            Integer uid = (Integer) httpSession.getAttribute("uid");
            courseList = courseService.findCourseAllByTeaId(uid);
        }else {
            courseList = courseService.findCourseAll();
        }
        modelAndView.addObject("courseList", courseList);

        modelAndView.setViewName("/course_list");
        return modelAndView;
    }

    @RequestMapping("/beforeAddOrUpdateCourse")
    public ModelAndView beforeAddOrUpdateCourse(Integer courseId) {
        ModelAndView modelAndView = new ModelAndView();

        Course course = new Course();
        if (courseId != null && !courseId.equals("")) {
            course = courseService.findSingleCourse(courseId);
        }

        modelAndView.addObject("course", course);

        modelAndView.setViewName("/course_addOrEdit");
        return modelAndView;
    }

    @RequestMapping("/addOrUpdateCourse")
    public ModelAndView addOrUpdateCourse(Course course) {
        ModelAndView modelAndView = new ModelAndView();

        if (course.getCourseid() == null) {
            courseService.addCourse(course);
        } else {
            courseService.updateCourse(course);
        }

        modelAndView.setViewName("redirect:/course/findCourseAll");
        return modelAndView;
    }

    @RequestMapping("/deleteCourse")
    public ModelAndView deleteCourse(Integer courseId) {
        ModelAndView modelAndView = new ModelAndView();
        courseService.deleteCourse(courseId);

        modelAndView.setViewName("redirect:/course/findCourseAll");
        return modelAndView;
    }

    @RequestMapping("/setCoursePrice")
    public ModelAndView setCoursePrice(Integer courseId,Integer price) {
        ModelAndView modelAndView = new ModelAndView();
        Course course = courseService.findSingleCourse(courseId);
        course.setPrice(price);
        courseService.updateCourse(course);
        modelAndView.setViewName("redirect:/course/findCourseAll");
        return modelAndView;
    }
}
