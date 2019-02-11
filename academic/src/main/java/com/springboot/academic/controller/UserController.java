package com.springboot.academic.controller;

import com.springboot.academic.model.User;
import com.springboot.academic.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/user")
public class UserController {

    @Autowired
    UserService userService;

    @RequestMapping("/login")
    public ModelAndView login(String uname, String pwd, String role, HttpSession httpSession) {
        ModelAndView modelAndView = new ModelAndView();
        User user = userService.login(uname, pwd, role);
        if (user == null) {
            modelAndView.setViewName("/login");
            modelAndView.addObject("msg", "User is not existed! Please log in again!");
        } else {
            httpSession.setAttribute("uname", user.getUsername());
            httpSession.setAttribute("uid", user.getUserid());
            httpSession.setAttribute("roler", user.getRole());

            modelAndView.addObject("msg", "");

            modelAndView.setViewName("/index");
        }

        return modelAndView;
    }

    @RequestMapping("/logout")
    public ModelAndView logout(HttpSession httpSession) {
        httpSession.setAttribute("uname", null);
        httpSession.setAttribute("uid", null);
        httpSession.setAttribute("roler", null);

        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("/login");

        modelAndView.addObject("msg", "");
        return modelAndView;
    }

    @RequestMapping("/findUserAll")
    public ModelAndView findUserAll(String role) {
        ModelAndView modelAndView = new ModelAndView();
        List<User> userList = userService.findUserAll(role);

        modelAndView.addObject("userList", userList);
        modelAndView.addObject("role", role);

        modelAndView.setViewName("/user_list");
        return modelAndView;
    }

    @RequestMapping("/beforeAddOrUpdateUser")
    public ModelAndView beforeAddOrUpdateUser(Integer userId, String role, HttpSession httpSession) {
        ModelAndView modelAndView = new ModelAndView();
        User user = new User();
        if (userId != null && !userId.equals("")) {
            user = userService.findSingleUser(userId);
        }

        modelAndView.addObject("userObj", user);
        modelAndView.addObject("role", role);
        String roler = (String)httpSession.getAttribute("roler");
        if("0".equals(roler)){
            modelAndView.setViewName("/user_addOrEdit");
        }else{
            modelAndView.setViewName("/user_info");
        }
        return modelAndView;
    }

    @RequestMapping("/addOrUpdateUser")
    public ModelAndView addOrUpdateUser(User user) {
        ModelAndView modelAndView = new ModelAndView();

        if (user.getUserid() == null) {
            userService.addUser(user);
        } else {
            userService.updateUser(user);
        }

        modelAndView.setViewName("redirect:/user/findUserAll?role="+user.getRole());
        return modelAndView;
    }

    @RequestMapping("/deleteUser")
    public ModelAndView deleteUser(Integer userId,String role) {
        ModelAndView modelAndView = new ModelAndView();
        userService.deleteUser(userId);

        modelAndView.setViewName("redirect:/user/findUserAll?role="+role);
        return modelAndView;
    }

    @RequestMapping("/setTuition")
    public ModelAndView setTuition(Integer userId,String role,String tuition) {
        ModelAndView modelAndView = new ModelAndView();
        User user = userService.findSingleUser(userId);
        user.setTuition(tuition);
        userService.updateUser(user);
        modelAndView.setViewName("redirect:/user/findUserAll?role="+role);
        return modelAndView;
    }


}
