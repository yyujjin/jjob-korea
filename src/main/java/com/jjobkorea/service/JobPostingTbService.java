package com.jjobkorea.service;

import com.jjobkorea.entity.SignupTb;
import com.jjobkorea.repository.SignupTbRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Optional;

@Service
public class JobPostingTbService {

    @Autowired
    private SignupTbRepository signupTbRepository;

    public Optional<SignupTb> getSignupTbByMemId(String memId) {
        // memId를 사용하여 SignupTb를 찾는 로직을 추가합니다.
        return signupTbRepository.findByMemId(memId);
    }
    
}
