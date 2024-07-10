package com.jjobkorea.service;

import com.jjobkorea.entity.JobPostingDetail;
import com.jjobkorea.repository.JobPostingDetailRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class JobPostingDetailService {

    @Autowired
    private JobPostingDetailRepository jobPostingDetailRepository;

    public List<JobPostingDetail> findAll() {
        return jobPostingDetailRepository.findAll();
    }

    public Optional<JobPostingDetail> findById(Long id) {
        return jobPostingDetailRepository.findById(id);
    }

    public void save(JobPostingDetail jobPostingDetail) {
        jobPostingDetailRepository.save(jobPostingDetail);
    }
}
