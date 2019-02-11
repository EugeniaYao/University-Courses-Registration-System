package com.springboot.academic.service.impl;

import com.springboot.academic.mapper.AchieveMapper;
import com.springboot.academic.model.Achieve;
import com.springboot.academic.service.AchieveService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("achieveService")
public class AchieveServiceImpl implements AchieveService {

    @Autowired
    private AchieveMapper achieveMapper;

    @Override
    public List<Achieve> findAchieveAll() {
        return achieveMapper.findAchieveAll();
    }

    @Override
    public Achieve findSingleAchieve(Integer id) {
        return achieveMapper.getOne(id);
    }

    @Override
    public void addAchieve(Achieve obj) {
        achieveMapper.insert(obj);
    }

    @Override
    public void updateAchieve(Achieve obj) {
        achieveMapper.update(obj);
    }

    @Override
    public void deleteAchieve(Integer id) {
        achieveMapper.delete(id);
    }

    @Override
    public List<Achieve> findAchieveAllByStuId(Integer stuId) {
        return achieveMapper.findAchieveAllByStuId(stuId);
    }
}
