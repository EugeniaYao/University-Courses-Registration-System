package com.springboot.academic.service.impl;

import com.springboot.academic.mapper.HomeworkMapper;
import com.springboot.academic.model.Homework;
import com.springboot.academic.service.HomeworkService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("homeworkService")
public class HomeworkServiceImpl implements HomeworkService {

    @Autowired
    private HomeworkMapper homeworkMapper;

    @Override
    public List<Homework> findHomeworkAll() {
        return homeworkMapper.findHomeworkAll();
    }

    @Override
    public Homework findSingleHomework(Integer id) {
        return homeworkMapper.getOne(id);
    }

    @Override
    public void addHomework(Homework obj) {
        homeworkMapper.insert(obj);
    }

    @Override
    public void updateHomework(Homework obj) {
        homeworkMapper.update(obj);
    }

    @Override
    public void deleteHomework(Integer id) {
        homeworkMapper.delete(id);
    }

    @Override
    public List<Homework> findHomeworkAllByTeaId(Integer teaId) {
        return homeworkMapper.findHomeworkAllByTeaId(teaId);
    }

    @Override
    public List<Homework> findHomeworkAllByStuId(Integer stuId) {
        return homeworkMapper.findHomeworkAllByStuId(stuId);
    }
}
