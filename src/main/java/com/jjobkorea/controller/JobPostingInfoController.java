package com.jjobkorea.controller;

import com.jjobkorea.entity.JobPostingInfo;
import com.jjobkorea.service.JobPostingInfoService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.List;

@Controller
public class JobPostingInfoController {

    @Autowired
    private JobPostingInfoService jobPostingInfoService;

    @GetMapping("/jobPostingInfo/list")
    public String listJobPostingInfos(Model model) {
        List<JobPostingInfo> jobPostingInfos = jobPostingInfoService.findAll();
        if (jobPostingInfos.isEmpty()) {
            System.out.println("No job postings found to display.");
        } else {
            System.out.println("Controller fetched job postings: " + jobPostingInfos.size());
        }
        model.addAttribute("jobPostingInfos", jobPostingInfos);
        return "job-posting-info-list";
    }
}
