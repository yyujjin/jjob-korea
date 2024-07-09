package com.jjobkorea.service;

import com.jjobkorea.entity.JobPostingInfo;
import com.jjobkorea.repository.JobPostingInfoRepository;

import jakarta.transaction.Transactional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
@Transactional
public class JobPostingInfoService {

    @Autowired
    private JobPostingInfoRepository jobPostingInfoRepository;

    public List<JobPostingInfo> findAll() {
        List<JobPostingInfo> jobPostingInfos = jobPostingInfoRepository.findAll();
        if (jobPostingInfos.isEmpty()) {
            System.out.println("No job postings found in the database.");
        } else {
            System.out.println("Fetched job postings: " + jobPostingInfos.size());
            for (JobPostingInfo info : jobPostingInfos) {
                System.out.println(info.toString());
            }
        }
        return jobPostingInfos;
    }
}
