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

    public List<JobPostingDetail> findAll() {
        return jobPostingDetailRepository.findAll();
    }

    public void save(JobPostingDetail jobPostingDetail) {
        jobPostingDetailRepository.save(jobPostingDetail);
    }

    public JobPostingDetail findById(Long id) {
        return jobPostingDetailRepository.findById(id).orElse(null);
    }

    public void deleteById(Long id) {
        jobPostingDetailRepository.deleteById(id);
    }
}
