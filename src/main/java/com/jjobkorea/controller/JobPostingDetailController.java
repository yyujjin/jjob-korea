package com.jjobkorea.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import com.jjobkorea.entity.JobPostingDetail;
import com.jjobkorea.service.JobPostingDetailService;
import com.jjobkorea.service.AddSignupCpService;

@Controller
public class JobPostingDetailController {

    @Autowired
    private JobPostingDetailService jobPostingDetailService;

    @Autowired
    private AddSignupCpService addSignupCpService;

    @GetMapping("/add-job-posting")
    public String addJobPostingForm(Model model) {
        model.addAttribute("jobPostingDetail", new JobPostingDetail());
        return "add-job-posting";
    }

    @PostMapping("/jobPostingDetail")
    public String submitJobPosting(JobPostingDetail jobPostingDetail, Model model) {
        jobPostingDetailService.saveJobPosting(jobPostingDetail);
        return "redirect:/jobPostingDetail";
    }

    @GetMapping("/jobPostingDetail")
    public String jobPostingDetail(Model model) {
        model.addAttribute("jobPostings", jobPostingDetailService.getAllJobPostings());
        model.addAttribute("signupCpList", addSignupCpService.findAll());
        return "job-posting-detail";
    }
}
