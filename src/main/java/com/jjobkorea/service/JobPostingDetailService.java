package com.jjobkorea.service;

import com.jjobkorea.entity.JobPostingDetail;
import com.jjobkorea.entity.SignupCp;
import com.jjobkorea.repository.JobPostingDetailRepository;
import com.jjobkorea.repository.SignupCpRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class JobPostingDetailService {

    @Autowired
    private JobPostingDetailRepository jobPostingDetailRepository;

    @Autowired
    private SignupCpRepository signupCpRepository;

    public List<JobPostingDetail> getJobPostingsByCompany(SignupCp signupCp) {
        return jobPostingDetailRepository.findBySignupCp(signupCp);
    }

   
}
