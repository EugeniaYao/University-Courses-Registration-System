package com.springboot.academic.service;

import com.springboot.academic.model.Scholarship;
import com.springboot.academic.model.User;

import java.util.List;

public interface ScholarshipService {

    List<Scholarship> findScholarshipAll();

    Scholarship findSingleScholarship(Integer id);

    void addScholarship(Scholarship obj);

    void updateScholarship(Scholarship obj);

    void deleteScholarship(Integer id);
}
