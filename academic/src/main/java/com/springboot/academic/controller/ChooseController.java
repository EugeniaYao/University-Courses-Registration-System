package com.springboot.academic.controller;

import com.springboot.academic.model.Choose;
import com.springboot.academic.model.Course;
import com.springboot.academic.model.User;
import com.springboot.academic.service.ChooseService;
import com.springboot.academic.service.CourseService;
import com.springboot.academic.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("/choose")
public class ChooseController {

    @Autowired
    ChooseService chooseService;

    @Autowired
    CourseService courseService;

    @Autowired
    UserService userService;

    @RequestMapping("/findChooseAll")
    public ModelAndView findChooseAll(HttpSession httpSession) {
        ModelAndView modelAndView = new ModelAndView();

        String roler = (String) httpSession.getAttribute("roler");
        Integer uid = (Integer) httpSession.getAttribute("uid");

        List<Choose> chooseList = null;
        if ("1".equals(roler)){
            chooseList = chooseService.findChooseAllByTeaId(uid);
        }else {
            chooseList = chooseService.findChooseAllByStuId(uid);
        }
        modelAndView.addObject("chooseList", chooseList);
        modelAndView.setViewName("/choose_list");
        return modelAndView;
    }

    @RequestMapping("/beforeAddOrUpdateChoose")
    public ModelAndView beforeAddOrUpdateChoose(Integer chooseId) {
        ModelAndView modelAndView = new ModelAndView();
        Choose choose = new Choose();
        if (chooseId != null && !chooseId.equals("")) {
            choose = chooseService.findSingleChoose(chooseId);
        }
        modelAndView.addObject("choose", choose);
        modelAndView.setViewName("/choose_addOrEdit");
        return modelAndView;
    }

    @RequestMapping("/addOrUpdateChoose")
    public ModelAndView addOrUpdateChoose(Choose choose) {
        ModelAndView modelAndView = new ModelAndView();
        if (choose.getChooseid() == null) {
            chooseService.addChoose(choose);
        } else {
            chooseService.updateChoose(choose);
        }
        modelAndView.setViewName("redirect:/choose/findChooseAll");
        return modelAndView;
    }

    @RequestMapping("/addChoose")
    public ModelAndView addChoose(Integer courseId, Integer userId) {
        ModelAndView modelAndView = new ModelAndView();
        Choose choose = new Choose();
        choose.setCourseid(courseId);
        choose.setUserid(userId);
        choose.setAddtime((new SimpleDateFormat("yyyy-MM-dd HH:mm:ss")).format(new Date()));
        chooseService.addChoose(choose);

        // update registered course number
        Course course = courseService.findSingleCourse(courseId);
        course.setChoosenum(course.getChoosenum()+1);
        courseService.updateCourse(course);

        //update user registered credit
        User user = userService.findSingleUser(userId);
        user.setScorce(user.getScorce()+course.getScorce());
        userService.updateUser(user);

        modelAndView.setViewName("redirect:/choose/findChooseAll");
        return modelAndView;
    }

    @RequestMapping("/deleteChoose")
    public ModelAndView deleteChoose(Integer chooseId) {
        ModelAndView modelAndView = new ModelAndView();
        Choose choose = chooseService.findSingleChoose(chooseId);
        chooseService.deleteChoose(chooseId);

        // update registered course
        Course course = courseService.findSingleCourse(choose.getCourseid());
        course.setChoosenum(course.getChoosenum() - 1);
        courseService.updateCourse(course);

        // update registered credit
        User user = userService.findSingleUser(choose.getUserid());
        user.setScorce(user.getScorce() - course.getScorce());
        userService.updateUser(user);

        modelAndView.setViewName("redirect:/choose/findChooseAll");
        return modelAndView;
    }

	@RequestMapping("/setGrade")
	public ModelAndView setScorce(Integer chooseId,Integer courseId,String grade) {
		ModelAndView modelAndView = new ModelAndView();
		Choose choose = chooseService.findSingleChoose(chooseId);
		Course course = courseService.findSingleCourse(courseId);

		course.setChooseGrade(grade);
		chooseService.updateChoose(choose);

		modelAndView.setViewName("redirect:/stuwork/findStuworkAll");
		return modelAndView;
	}

}
