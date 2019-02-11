package com.springboot.academic.service.impl;

import com.springboot.academic.mapper.UserMapper;
import com.springboot.academic.model.User;
import com.springboot.academic.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("userService")
public class UserServiceImpl implements UserService {

    @Autowired
    private UserMapper userMapper;


    @Override
    public User login(String uname, String pwd, String role) {
        return userMapper.login(uname,pwd,role);
    }

    @Override
    public List<User> findUserAll(String role) {
        return userMapper.findUserAll(role);
    }

    @Override
    public User findSingleUser(Integer id) {
        return userMapper.getOne(id);
    }

    @Override
    public void addUser(User obj) {
        userMapper.insert(obj);
    }

    @Override
    public void updateUser(User obj) {
        userMapper.update(obj);
    }

    @Override
    public void deleteUser(Integer id) {
        userMapper.delete(id);
    }
}
