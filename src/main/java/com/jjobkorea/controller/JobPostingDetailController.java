package com.jjobkorea.controller;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.jjobkorea.entity.JobPostingDetail;
import com.jjobkorea.entity.SignupCp;
import com.jjobkorea.service.JobPostingDetailService;
import com.jjobkorea.service.AddSignupCpService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PathVariable;

import java.util.List;

@Controller
public class JobPostingDetailController {

    @Autowired
    private JobPostingDetailService jobPostingDetailService;

    @Autowired
    private AddSignupCpService addSignupCpService;

    @GetMapping("/addJobPosting")
    public String addJobPostingForm(Model model) {
        model.addAttribute("jobPostingDetail", new JobPostingDetail());
        List<SignupCp> signupCpList = addSignupCpService.findAll();
        model.addAttribute("signupCpList", signupCpList);

        // Convert signupCpList to JSON for JavaScript usage
        try {
            ObjectMapper mapper = new ObjectMapper();
            String signupCpListJson = mapper.writeValueAsString(signupCpList);
            model.addAttribute("signupCpListJson", signupCpListJson);
        } catch (Exception e) {
            e.printStackTrace();
        }

        return "addJobPosting";
    }

    @PostMapping("/jobPostingDetail")
    public String submitJobPostingDetail(JobPostingDetail jobPostingDetail) {
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
