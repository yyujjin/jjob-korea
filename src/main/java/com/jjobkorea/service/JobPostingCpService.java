package com.jjobkorea.service;

import com.jjobkorea.entity.SignupCp;
import com.jjobkorea.repository.SignupCpRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Optional;

@Service
public class JobPostingCpService {

    @Autowired
    private SignupCpRepository signupCpRepository;

    public Optional<SignupCp> getSignupCpById(Long id) {
        return signupCpRepository.findById(id);
    }
}
