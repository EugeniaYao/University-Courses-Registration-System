package com.springboot.academic.service;

import com.springboot.academic.model.User;

import java.util.List;

public interface UserService {

    User login(String uname, String pwd, String role);

    List<User> findUserAll(String role);

    User findSingleUser(Integer id);

    void addUser(User obj);

    void updateUser(User obj);

    void deleteUser(Integer id);
}
