package com.springboot.academic.controller;

import com.springboot.academic.model.Homework;
import com.springboot.academic.service.HomeworkService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("/homework")
public class HomeworkController {

    @Autowired
    HomeworkService homeworkService;

    @RequestMapping("/findHomeworkAll")
    public ModelAndView findHomeworkAll(HttpSession httpSession) {
        ModelAndView modelAndView = new ModelAndView();
        String roler = (String) httpSession.getAttribute("roler");
        Integer uid = (Integer) httpSession.getAttribute("uid");

        List<Homework> homeworkList = null;
        if ("1".equals(roler)){
            homeworkList = homeworkService.findHomeworkAllByTeaId(uid);
        }else{
            homeworkList = homeworkService.findHomeworkAllByStuId(uid);
        }
        modelAndView.addObject("homeworkList", homeworkList);
        modelAndView.setViewName("/homework_list");
        return modelAndView;
    }

    @RequestMapping("/beforeAddOrUpdateHomework")
    public ModelAndView beforeAddOrUpdateHomework(Integer homeworkId,Integer courseId) {
        ModelAndView modelAndView = new ModelAndView();
        Homework homework = new Homework();
        if (homeworkId != null && !homeworkId.equals("")) {
            homework = homeworkService.findSingleHomework(homeworkId);
        }
        modelAndView.addObject("homework", homework);
        modelAndView.addObject("courseId", courseId);

        modelAndView.setViewName("/homework_addOrEdit");
        return modelAndView;
    }

    @RequestMapping("/addOrUpdateHomework")
    public ModelAndView addOrUpdateHomework(Homework homework) {
        ModelAndView modelAndView = new ModelAndView();
        if (homework.getHomeworkid() == null) {
            homework.setAddtime((new SimpleDateFormat("yyyy-MM-dd HH:mm:ss")).format(new Date()));
            homeworkService.addHomework(homework);
        } else {
            homeworkService.updateHomework(homework);
        }
        modelAndView.setViewName("redirect:/homework/findHomeworkAll");
        return modelAndView;
    }

    @RequestMapping("/deleteHomework")
    public ModelAndView deleteHomework(Integer homeworkId) {
        ModelAndView modelAndView = new ModelAndView();
        homeworkService.deleteHomework(homeworkId);
        modelAndView.setViewName("redirect:/homework/findHomeworkAll");
        return modelAndView;
    }
}
