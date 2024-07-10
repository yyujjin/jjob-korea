package com.jjobkorea.service;

import com.jjobkorea.entity.SignupCp;
import com.jjobkorea.repository.SignupCpRepository;

import jakarta.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@Transactional
public class AddSignupCpService {
    @Autowired
    private SignupCpRepository signupCpRepository;

    public List<SignupCp> findAll() {
        return signupCpRepository.findAll();
    }
}
