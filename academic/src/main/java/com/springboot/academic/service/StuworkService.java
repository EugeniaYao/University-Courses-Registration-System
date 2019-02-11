package com.springboot.academic.service;

import com.springboot.academic.model.Stuwork;
import com.springboot.academic.model.User;

import java.util.List;

public interface StuworkService {

    List<Stuwork> findStuworkAll();

    Stuwork findSingleStuwork(Integer id);

    void addStuwork(Stuwork obj);

    void updateStuwork(Stuwork obj);

    void deleteStuwork(Integer id);

    List<Stuwork> findStuworkAllByTeaId(Integer teaId);

    List<Stuwork> findStuworkAllByStuId(Integer stuId);
}
