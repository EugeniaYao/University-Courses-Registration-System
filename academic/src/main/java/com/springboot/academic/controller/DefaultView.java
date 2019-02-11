package com.springboot.academic.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/")
public class DefaultView {

    @RequestMapping("")
    public ModelAndView index()  {
        ModelAndView modelAndView = new ModelAndView("/login"); //设置对应JSP的模板文件
        return modelAndView;
    }
}
