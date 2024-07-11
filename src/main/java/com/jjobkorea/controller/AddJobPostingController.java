package com.jjobkorea.controller;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.jjobkorea.entity.JobPostingDetail;
import com.jjobkorea.entity.SignupCp;
import com.jjobkorea.service.JobPostingCpService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import java.util.List;

@Controller
public class AddJobPostingController {

    @Autowired
    private JobPostingCpService jobPostingCpService;

    @GetMapping("/addJobPosting")
    public String showJobPostingForm(Model model) throws JsonProcessingException {
        List<SignupCp> companies = jobPostingCpService.getAllCompanies();
        ObjectMapper objectMapper = new ObjectMapper();
        String signupCpListJson = objectMapper.writeValueAsString(companies);
        model.addAttribute("signupCpList", companies);
        model.addAttribute("signupCpListJson", signupCpListJson);
        model.addAttribute("jobPostingDetail", new JobPostingDetail());
        return "jobPostingDetails/addJobPosting";
    }

    @PostMapping("/addJobPosting")
    public String saveJobPosting(@ModelAttribute("jobPostingDetail") JobPostingDetail jobPostingDetail, Model model) {
        jobPostingCpService.saveJobPosting(jobPostingDetail);
        return "redirect:/jobPostingDetail?jobPostingId=" + jobPostingDetail.getId();
    }
}
