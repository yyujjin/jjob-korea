package com.jjobkorea.controller;

import com.jjobkorea.entity.SignupCp;
import com.jjobkorea.service.JobPostingCpService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.List;

@Controller
public class JobPostingCpController {
    
    @Autowired
    private JobPostingCpService jobPostingCpService;

    @GetMapping("/companies")
    public String getAllCompanies(Model model) {
        List<SignupCp> companies = jobPostingCpService.getAllCompanies();
        model.addAttribute("companies", companies);
        return "jobPostingDetails/companies";
    }
}
