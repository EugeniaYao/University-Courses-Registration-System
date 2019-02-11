package com.springboot.academic.controller;

import com.springboot.academic.model.Achieve;
import com.springboot.academic.model.Scholarship;
import com.springboot.academic.model.User;
import com.springboot.academic.service.AchieveService;
import com.springboot.academic.service.ScholarshipService;
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
@RequestMapping("/achieve")
public class AchieveController {

    @Autowired
    AchieveService achieveService;

    @Autowired
    UserService userService;

    @Autowired
    ScholarshipService scholarshipService;

    @RequestMapping("/findAchieveAll")
    public ModelAndView findAchieveAll(HttpSession httpSession) {
        ModelAndView modelAndView = new ModelAndView();
        String roler = (String) httpSession.getAttribute("roler");
        List<Achieve> achieveList = null;
        if ("2".equals(roler)){
            Integer uid = (Integer) httpSession.getAttribute("uid");
            achieveList = achieveService.findAchieveAllByStuId(uid);
        }else {
            achieveList = achieveService.findAchieveAll();
        }
        modelAndView.addObject("achieveList", achieveList);
        modelAndView.setViewName("/achieve_list");
        return modelAndView;
    }

    @RequestMapping("/beforeAddOrUpdateAchieve")
    public ModelAndView beforeAddOrUpdateAchieve(Integer achieveId) {
        ModelAndView modelAndView = new ModelAndView();
        Achieve achieve = new Achieve();
        if (achieveId != null && !achieveId.equals("")) {
            achieve = achieveService.findSingleAchieve(achieveId);
        }
        modelAndView.addObject("achieve", achieve);

        List<User> users = userService.findUserAll("2");
        modelAndView.addObject("users", users);

        List<Scholarship> scholarships = scholarshipService.findScholarshipAll();
        modelAndView.addObject("scholarships", scholarships);

        modelAndView.setViewName("/achieve_addOrEdit");
        return modelAndView;
    }

    @RequestMapping("/addOrUpdateAchieve")
    public ModelAndView addOrUpdateAchieve(Achieve achieve) {
        ModelAndView modelAndView = new ModelAndView();

        if (achieve.getAchieveid() == null) {
            achieve.setAddtime((new SimpleDateFormat("yyyy-MM-dd HH:mm:ss")).format(new Date()));
            achieveService.addAchieve(achieve);
        } else {
            achieveService.updateAchieve(achieve);
        }

        modelAndView.setViewName("redirect:/achieve/findAchieveAll");
        return modelAndView;
    }

    @RequestMapping("/deleteAchieve")
    public ModelAndView deleteAchieve(Integer achieveId) {
        ModelAndView modelAndView = new ModelAndView();
        achieveService.deleteAchieve(achieveId);

        modelAndView.setViewName("redirect:/achieve/findAchieveAll");
        return modelAndView;
    }
}
