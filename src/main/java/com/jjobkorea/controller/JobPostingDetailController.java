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
    public String viewJobPostingDetails(@RequestParam("jobPostingId") Long jobPostingId, Model model) {
        JobPostingDetail jobPostingDetail = jobPostingDetailService.getJobPostingById(jobPostingId);
        if (jobPostingDetail == null) {
            return "error/404"; // 404 에러 페이지로 리다이렉트
        }
        SignupCp signupCp = jobPostingDetail.getCompany();
        List<JobPostingDetail> jobPostingDetails = jobPostingDetailService.getJobPostingDetailsByCompanyId(signupCp.getId().longValue());
        
        model.addAttribute("signupCp", signupCp);
        model.addAttribute("jobPostingDetails", jobPostingDetails);
        return "jobPostingDetails/jobPostingDetail";
    }
}
