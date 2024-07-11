package com.jjobkorea.service;

import com.jjobkorea.entity.JobPostingDetail;
import com.jjobkorea.repository.JobPostingDetailRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class JobPostingDetailService {

    @Autowired
    private JobPostingDetailRepository jobPostingDetailRepository;

    public List<JobPostingDetail> getJobPostingDetailsByCompanyId(int companyId) {
        return jobPostingDetailRepository.findByCompanyId(companyId);
    }
    
    public JobPostingDetail getJobPostingById(Long jobPostingId) {
        return jobPostingDetailRepository.findById(jobPostingId).orElse(null);
    }
}
