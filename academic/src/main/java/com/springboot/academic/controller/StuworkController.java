package com.springboot.academic.controller;

import com.springboot.academic.model.Stuwork;
import com.springboot.academic.service.StuworkService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("/stuwork")
public class StuworkController {

    @Autowired
    StuworkService stuworkService;

    @RequestMapping("/findStuworkAll")
    public ModelAndView findStuworkAll(HttpSession httpSession) {
        ModelAndView modelAndView = new ModelAndView();
        String roler = (String) httpSession.getAttribute("roler");
        Integer uid = (Integer) httpSession.getAttribute("uid");

        List<Stuwork> stuworkList = null;
        if ("1".equals(roler)){
            stuworkList = stuworkService.findStuworkAllByTeaId(uid);
        }else {
            stuworkList = stuworkService.findStuworkAllByStuId(uid);
        }
        modelAndView.addObject("stuworkList", stuworkList);
        modelAndView.setViewName("/stuwork_list");
        return modelAndView;
    }

    @RequestMapping("/beforeAddOrUpdateStuwork")
    public ModelAndView beforeAddOrUpdateStuwork(Integer stuworkId,Integer homeworkId) {
        ModelAndView modelAndView = new ModelAndView();

        Stuwork stuwork = new Stuwork();
        if (stuworkId != null && !stuworkId.equals("")) {
            stuwork = stuworkService.findSingleStuwork(stuworkId);
        }
        modelAndView.addObject("stuwork", stuwork);
        modelAndView.addObject("homeworkId", homeworkId);
        modelAndView.setViewName("/stuwork_addOrEdit");
        return modelAndView;
    }

    @RequestMapping("/addOrUpdateStuwork")
    public ModelAndView addOrUpdateStuwork(Stuwork stuwork) {
        ModelAndView modelAndView = new ModelAndView();

        if (stuwork.getStuworkid() == null) {
            stuwork.setAddtime((new SimpleDateFormat("yyyy-MM-dd HH:mm:ss")).format(new Date()));
            stuworkService.addStuwork(stuwork);
        } else {
            stuworkService.updateStuwork(stuwork);
        }

        modelAndView.setViewName("redirect:/stuwork/findStuworkAll");
        return modelAndView;
    }

    @RequestMapping("/deleteStuwork")
    public ModelAndView deleteStuwork(Integer stuworkId) {
        ModelAndView modelAndView = new ModelAndView();
        stuworkService.deleteStuwork(stuworkId);

        modelAndView.setViewName("redirect:/stuwork/findStuworkAll");
        return modelAndView;
    }

    @RequestMapping("/setScorce")
    public ModelAndView setScorce(Integer stuworkId,Integer scorce) {
        ModelAndView modelAndView = new ModelAndView();
        Stuwork stuwork = stuworkService.findSingleStuwork(stuworkId);
        stuwork.setScorce(scorce);
        stuworkService.updateStuwork(stuwork);

        modelAndView.setViewName("redirect:/stuwork/findStuworkAll");
        return modelAndView;
    }

}
