package com.jjobkorea.service;

import com.jjobkorea.entity.SignupCp;
import com.jjobkorea.repository.SignupCpRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class AddSignupCpService {

    @Autowired
    private SignupCpRepository signupCpRepository;

    public List<SignupCp> findAll() {
        return signupCpRepository.findAll();
    }

    public Optional<SignupCp> findById(Long id) {
        return signupCpRepository.findById(id);
    }
}
