package com.jjobkorea.service;

import com.jjobkorea.entity.JobPostingDetail;
import com.jjobkorea.entity.SignupCp;
import com.jjobkorea.repository.JobPostingDetailRepository;
import com.jjobkorea.repository.SignupCpRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class JobPostingCpService {

    @Autowired
    private SignupCpRepository signupCpRepository;

    @Autowired
    private JobPostingDetailRepository jobPostingDetailRepository;

    public List<SignupCp> getAllCompanies() {
        return signupCpRepository.findAll();
    }

    public SignupCp getCompanyById(int id) {
        return signupCpRepository.findById(id).orElse(null);
    }

    public void saveJobPosting(JobPostingDetail jobPostingDetail) {
        signupCpRepository.save(jobPostingDetail.getCompany());
        jobPostingDetailRepository.save(jobPostingDetail);
    }
}
