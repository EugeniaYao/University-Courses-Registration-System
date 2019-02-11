package com.springboot.academic.service.impl;

import com.springboot.academic.mapper.ChooseMapper;
import com.springboot.academic.model.Choose;
import com.springboot.academic.service.ChooseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("chooseService")
public class ChooseServiceImpl implements ChooseService {

    @Autowired
    private ChooseMapper chooseMapper;

    @Override
    public List<Choose> findChooseAll() {
        return chooseMapper.findChooseAll();
    }

    @Override
    public Choose findSingleChoose(Integer id) {
        return chooseMapper.getOne(id);
    }

    @Override
    public void addChoose(Choose obj) {
        chooseMapper.insert(obj);
    }

    @Override
    public void updateChoose(Choose obj) {
        chooseMapper.update(obj);
    }

    @Override
    public void deleteChoose(Integer id) {
        chooseMapper.delete(id);
    }

    @Override
    public List<Choose> findChooseAllByTeaId(Integer teaId) {
        return chooseMapper.findChooseAllByTeaId(teaId);
    }

    @Override
    public List<Choose> findChooseAllByStuId(Integer stuId) {
        return chooseMapper.findChooseAllByStuId(stuId);
    }
}
