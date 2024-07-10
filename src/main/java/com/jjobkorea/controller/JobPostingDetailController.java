package com.jjobkorea.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import com.jjobkorea.entity.JobPostingDetail;
import com.jjobkorea.service.JobPostingDetailService;
import com.jjobkorea.service.AddSignupCpService;

import com.fasterxml.jackson.databind.ObjectMapper;

@Controller
public class JobPostingDetailController {

    @Autowired
    private JobPostingDetailService jobPostingDetailService;

    @Autowired
    private AddSignupCpService addSignupCpService;

    @GetMapping("/add-job-posting")
    public String addJobPostingForm(Model model) {
        model.addAttribute("jobPostingDetail", new JobPostingDetail());
        model.addAttribute("signupCpList", addSignupCpService.findAll());

        // Convert signupCpList to JSON
        try {
            ObjectMapper mapper = new ObjectMapper();
            String signupCpListJson = mapper.writeValueAsString(addSignupCpService.findAll());
            model.addAttribute("signupCpListJson", signupCpListJson);
        } catch (Exception e) {
            e.printStackTrace();
        }

        return "add-job-posting";
    }

    @PostMapping("/jobPostingDetail")
    public String submitJobPostingDetail(JobPostingDetail jobPostingDetail, Model model) {
        jobPostingDetailService.save(jobPostingDetail);
        return "redirect:/jobPostingDetail";
    }

    @GetMapping("/jobPostingDetail")
    public String jobPostingDetail(Model model) {
        model.addAttribute("jobPostings", jobPostingDetailService.findAll());
        model.addAttribute("signupCpList", addSignupCpService.findAll());
        return "job-posting-detail";
    }
}
