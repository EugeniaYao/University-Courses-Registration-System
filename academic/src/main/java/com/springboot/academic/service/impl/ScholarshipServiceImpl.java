package com.springboot.academic.service.impl;

import com.springboot.academic.mapper.ScholarshipMapper;
import com.springboot.academic.model.Scholarship;
import com.springboot.academic.service.ScholarshipService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("scholarshipService")
public class ScholarshipServiceImpl implements ScholarshipService {

    @Autowired
    private ScholarshipMapper scholarshipMapper;

    @Override
    public List<Scholarship> findScholarshipAll() {
        return scholarshipMapper.findScholarshipAll();
    }

    @Override
    public Scholarship findSingleScholarship(Integer id) {
        return scholarshipMapper.getOne(id);
    }

    @Override
    public void addScholarship(Scholarship obj) {
        scholarshipMapper.insert(obj);
    }

    @Override
    public void updateScholarship(Scholarship obj) {
        scholarshipMapper.update(obj);
    }

    @Override
    public void deleteScholarship(Integer id) {
        scholarshipMapper.delete(id);
    }
}
