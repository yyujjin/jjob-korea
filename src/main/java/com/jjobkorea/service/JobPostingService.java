package com.jjobkorea.service;

import com.jjobkorea.entity.JobPosting;
import com.jjobkorea.repository.JobPostingRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class JobPostingService {
    @Autowired
    private JobPostingRepository jobPostingRepository;

    public JobPosting saveJobPosting(JobPosting jobPosting) {
        return jobPostingRepository.save(jobPosting);
    }

    public List<JobPosting> findAll() {
        return jobPostingRepository.findAll();
    }
}
