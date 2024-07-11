package com.jjobkorea.controller;

import com.jjobkorea.entity.JobPostingDetail;
import com.jjobkorea.entity.SignupCp;
import com.jjobkorea.service.JobPostingDetailService;
import com.jjobkorea.service.JobPostingCpService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
public class JobPostingDetailController {

    @Autowired
    private JobPostingDetailService jobPostingDetailService;

    @Autowired
    private JobPostingCpService jobPostingCpService;

    @GetMapping("/jobPostingDetail")
    public String viewJobPostingDetails(@RequestParam("companyId") int companyId, Model model) {
        SignupCp signupCp = jobPostingCpService.getCompanyById(companyId);
        List<JobPostingDetail> jobPostingDetails = jobPostingDetailService.getJobPostingDetailsByCompanyId(companyId);
        
        model.addAttribute("signupCp", signupCp);
        model.addAttribute("jobPostingDetails", jobPostingDetails);
        return "jobPostingDetails/JobPostingDetail";
    }
}
