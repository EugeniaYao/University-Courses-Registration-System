package com.springboot.academic.controller;

import com.springboot.academic.model.Scholarship;
import com.springboot.academic.service.ScholarshipService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
@RequestMapping("/scholarship")
public class ScholarshipController {

    @Autowired
    ScholarshipService scholarshipService;

    @RequestMapping("/findScholarshipAll")
    public ModelAndView findScholarshipAll() {
        ModelAndView modelAndView = new ModelAndView();
        List<Scholarship> scholarshipList = scholarshipService.findScholarshipAll();
        modelAndView.addObject("scholarshipList", scholarshipList);
        modelAndView.setViewName("/scholarship_list");
        return modelAndView;
    }

    @RequestMapping("/beforeAddOrUpdateScholarship")
    public ModelAndView beforeAddOrUpdateScholarship(Integer scholarshipId) {
        ModelAndView modelAndView = new ModelAndView();
        Scholarship scholarship = new Scholarship();
        if (scholarshipId != null && !scholarshipId.equals("")) {
            scholarship = scholarshipService.findSingleScholarship(scholarshipId);
        }
        modelAndView.addObject("scholarship", scholarship);
        modelAndView.setViewName("/scholarship_addOrEdit");
        return modelAndView;
    }

    @RequestMapping("/addOrUpdateScholarship")
    public ModelAndView addOrUpdateScholarship(Scholarship scholarship) {
        ModelAndView modelAndView = new ModelAndView();
        if (scholarship.getScholarshipid() == null) {
            scholarshipService.addScholarship(scholarship);
        } else {
            scholarshipService.updateScholarship(scholarship);
        }
        modelAndView.setViewName("redirect:/scholarship/findScholarshipAll");
        return modelAndView;
    }

    @RequestMapping("/deleteScholarship")
    public ModelAndView deleteScholarship(Integer scholarshipId) {
        ModelAndView modelAndView = new ModelAndView();
        scholarshipService.deleteScholarship(scholarshipId);
        modelAndView.setViewName("redirect:/scholarship/findScholarshipAll");
        return modelAndView;
    }
}
