package com.springboot.academic.service.impl;

import com.springboot.academic.mapper.StuworkMapper;
import com.springboot.academic.model.Stuwork;
import com.springboot.academic.service.StuworkService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("stuworkService")
public class StuworkServiceImpl implements StuworkService {

    @Autowired
    private StuworkMapper stuworkMapper;

    @Override
    public List<Stuwork> findStuworkAll() {
        return stuworkMapper.findStuworkAll();
    }

    @Override
    public Stuwork findSingleStuwork(Integer id) {
        return stuworkMapper.getOne(id);
    }

    @Override
    public void addStuwork(Stuwork obj) {
        stuworkMapper.insert(obj);
    }

    @Override
    public void updateStuwork(Stuwork obj) {
        stuworkMapper.update(obj);
    }

    @Override
    public void deleteStuwork(Integer id) {
        stuworkMapper.delete(id);
    }

    @Override
    public List<Stuwork> findStuworkAllByTeaId(Integer teaId) {
        return stuworkMapper.findStuworkAllByTeaId(teaId);
    }

    @Override
    public List<Stuwork> findStuworkAllByStuId(Integer stuId) {
        return stuworkMapper.findStuworkAllByStuId(stuId);
    }
}
