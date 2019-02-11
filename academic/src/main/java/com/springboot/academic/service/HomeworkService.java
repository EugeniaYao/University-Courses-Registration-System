package com.springboot.academic.service;

import com.springboot.academic.model.Homework;
import com.springboot.academic.model.User;

import java.util.List;

public interface HomeworkService {

    List<Homework> findHomeworkAll();

    Homework findSingleHomework(Integer id);

    void addHomework(Homework obj);

    void updateHomework(Homework obj);

    void deleteHomework(Integer id);

    List<Homework> findHomeworkAllByTeaId(Integer teaId);

    List<Homework> findHomeworkAllByStuId(Integer stuId);
}
