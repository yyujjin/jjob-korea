package com.jjobkorea.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import com.jjobkorea.entity.JobPostingDetail;
import com.jjobkorea.service.JobPostingDetailService;

@Controller
public class JobPostingDetailController {

    @Autowired
    private JobPostingDetailService jobPostingDetailService;

    @GetMapping("/jobPostingDetail")
    public String getJobPostings(Model model) {
        model.addAttribute("jobPostings", jobPostingDetailService.getAllJobPostings());
        return "job-posting-list";
    }

    //진입 페이지
    @GetMapping("/addJobPosting")
    public String addJobPostingForm(Model model) {
        model.addAttribute("jobPostingDetail", new JobPostingDetail());
        
        //메인 페이지로 연결
        String page = "addJobPosting";
        model.addAttribute("page",page);
        return "main/main";
    }

    @PostMapping("/jobPostingDetail")
    public String submitJobPosting(@ModelAttribute JobPostingDetail jobPostingDetail) {
        jobPostingDetailService.saveJobPosting(jobPostingDetail);
        return "redirect:/jobPostingDetail";
    }
}
