package com.jjobkorea.service;

import com.jjobkorea.entity.JobPostingDetail;
import com.jjobkorea.entity.SignupCp;
import com.jjobkorea.repository.JobPostingDetailRepository;
import com.jjobkorea.repository.SignupCpRepository;
import com.jjobkorea.service.JobPostingCpService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class JobPostingCpServiceImpl implements JobPostingCpService {

    @Autowired
    private SignupCpRepository signupCpRepository;

    @Autowired
    private JobPostingDetailRepository jobPostingDetailRepository;

    @Override
    public List<SignupCp> getAllCompanies() {
        return signupCpRepository.findAll();
    }

    @Override
    public SignupCp getCompanyById(int id) {
        return signupCpRepository.findById(id).orElse(null);
    }

    @Override
    public void saveJobPosting(JobPostingDetail jobPostingDetail) {
        jobPostingDetailRepository.save(jobPostingDetail);
    }
}
