package com.springboot.academic.service;

import com.springboot.academic.model.Choose;
import com.springboot.academic.model.User;

import java.util.List;

public interface ChooseService {

    List<Choose> findChooseAll();

    Choose findSingleChoose(Integer id);

    void addChoose(Choose obj);

    void updateChoose(Choose obj);

    void deleteChoose(Integer id);

    List<Choose> findChooseAllByTeaId(Integer teaId);

    List<Choose> findChooseAllByStuId(Integer stuId);
}
