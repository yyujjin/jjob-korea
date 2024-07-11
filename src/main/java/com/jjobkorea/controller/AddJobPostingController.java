package com.jjobkorea.controller;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
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
        model.addAttribute("signupCp", new SignupCp());
        return "jobPostingDetails/addJobPosting";
    }

    @PostMapping("/addJobPosting")
    public String saveJobPosting(@ModelAttribute("signupCp") SignupCp signupCp, Model model) {
        if (jobPostingCpService.existsByCompanyRegistrationNum(signupCp.getCompanyRegistrationNum())) {
            model.addAttribute("errorMessage", "중복된 회사 등록 번호입니다.");
            return "jobPostingDetails/addJobPosting";
        }

        if (jobPostingCpService.existsByCompanyBusinessRegistration(signupCp.getCompanyBusinessRegistration())) {
            model.addAttribute("errorMessage", "중복된 사업자 등록 번호입니다.");
            return "jobPostingDetails/addJobPosting";
        }
        
        jobPostingCpService.saveCompany(signupCp);
        return "redirect:/jobPostingDetail?companyId=" + signupCp.getId();
    }
}