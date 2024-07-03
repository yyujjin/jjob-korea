package com.jjobkorea.controller;

import com.jjobkorea.entity.JobPosting;
import com.jjobkorea.service.CompanyService;
import com.jjobkorea.service.JobPostingService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/jobPostings")
public class JobPostingController {

    @Autowired
    private JobPostingService jobPostingService;

    @Autowired
    private CompanyService companyService;

    @GetMapping("/add")
    public String showAddJobPostingForm(Model model) {
        model.addAttribute("companies", companyService.findAll());
        model.addAttribute("jobPosting", new JobPosting());
        return "addJobPosting";  // addJobPosting.jsp로 이동
    }

    @PostMapping
    public String createJobPosting(@ModelAttribute JobPosting jobPosting, @RequestParam String cpId) {
        jobPosting.setCompany(companyService.findById(cpId).orElseThrow(() -> new IllegalArgumentException("Invalid company Id:" + cpId)));
        jobPostingService.saveJobPosting(jobPosting);
        return "redirect:/listJobPostings";  // listJobPostings.jsp로 이동
    }
}
