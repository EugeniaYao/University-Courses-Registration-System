package com.springboot.academic.service;

import com.springboot.academic.model.Achieve;

import java.util.List;

public interface AchieveService {

    List<Achieve> findAchieveAll();

    Achieve findSingleAchieve(Integer id);

    void addAchieve(Achieve obj);

    void updateAchieve(Achieve obj);

    void deleteAchieve(Integer id);

    List<Achieve> findAchieveAllByStuId(Integer stuId);
}
