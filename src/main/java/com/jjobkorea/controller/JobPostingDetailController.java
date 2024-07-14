package com.jjobkorea.controller;

import com.jjobkorea.entity.JobPostingDetail;
import com.jjobkorea.service.JobPostingDetailService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

@Controller
public class JobPostingDetailController {

    @Autowired
    private JobPostingDetailService jobPostingDetailService;

    @GetMapping("/jobPostingDetails/{id}")
    public String getJobPostingDetail(@PathVariable("id") Long id, Model model) {
        JobPostingDetail jobPostingDetail = jobPostingDetailService.getJobPostingDetail(id);
        model.addAttribute("jobPostingDetail", jobPostingDetail);
        return "jobPostingDetail";
    }
}
