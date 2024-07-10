package com.jjobkorea.controller;
import com.fasterxml.jackson.databind.ObjectMapper;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import com.jjobkorea.entity.JobPostingDetail;
import com.jjobkorea.entity.SignupCp;
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
        List<SignupCp> signupCpList = addSignupCpService.findAll(); // 변경된 서비스 이름 사용
        model.addAttribute("signupCpList", signupCpList);

        // signupCpList를 JSON 문자열로 변환
        try {
            ObjectMapper objectMapper = new ObjectMapper();
            String signupCpListJson = objectMapper.writeValueAsString(signupCpList);
            model.addAttribute("signupCpListJson", signupCpListJson);
        } catch (Exception e) {
            e.printStackTrace();
        }

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
