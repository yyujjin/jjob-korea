package com.jjobkorea.service;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.jjobkorea.entity.JobPostingDetail;
import com.jjobkorea.repository.JobPostingDetailRepository;

@Service
public class JobPostingDetailService {

    @Autowired
    private JobPostingDetailRepository jobPostingDetailRepository;

    public List<JobPostingDetail> getAllJobPostings() {
        return jobPostingDetailRepository.findAll();
    }

    public void saveJobPosting(JobPostingDetail jobPostingDetail) {
        jobPostingDetailRepository.save(jobPostingDetail);
    }
}
