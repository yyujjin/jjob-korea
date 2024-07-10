package com.jjobkorea.controller;

import com.jjobkorea.entity.JobPostingDetail;
import com.jjobkorea.entity.SignupCp;
import com.jjobkorea.service.JobPostingDetailService;
import com.jjobkorea.repository.SignupCpRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
public class JobPostingDetailController {

    @Autowired
    private SignupCpRepository signupCpRepository;

    @Autowired
    private JobPostingDetailService jobPostingDetailService;

    @GetMapping("/jobPostingDetails/addJobPosting")
    public String showAddJobPostingPage(Model model) {
        List<SignupCp> signupCpList = (List<SignupCp>) signupCpRepository.findAll();
        model.addAttribute("signupCpList", signupCpList);
        return "/jobPostingDetails/addJobPosting";
    }


    @PostMapping("/jobPostingDetails/addJobPosting")
    public String addJobPosting(@RequestParam("companyId") Long companyId,
                                @RequestParam("jobTitle") String jobTitle,
                                @RequestParam("jobDescription") String jobDescription,
                                @RequestParam("jobRequirements") String jobRequirements,
                                @RequestParam("employmentType") String employmentType,
                                @RequestParam("salary") String salary,
                                @RequestParam("location") String location,
                                @RequestParam("applicationDeadline") String applicationDeadline,
                                @RequestParam("contactEmail") String contactEmail) {

        jobPostingDetailService.addJobPosting(companyId, jobTitle, jobDescription, jobRequirements, employmentType, salary, location, applicationDeadline, contactEmail);

        return "redirect:/jobPostingDetail?companyId=" + companyId;

    //진입 페이지
    @GetMapping("/addJobPosting")
    public String addJobPostingForm(Model model) {
        model.addAttribute("jobPostingDetail", new JobPostingDetail());
        
        //메인 페이지로 연결
        String page = "addJobPosting";
        model.addAttribute("page",page);
        return "main/main";

    }

    @GetMapping("/jobPostingDetails/jobPostingDetail")
    public String showJobPostingDetailPage(@RequestParam("companyId") Long companyId, Model model) {
        SignupCp signupCp = signupCpRepository.findById(companyId).orElseThrow(() -> new IllegalArgumentException("Invalid company Id:" + companyId));
        List<JobPostingDetail> jobPostingDetails = jobPostingDetailService.getJobPostingsByCompany(signupCp);

        model.addAttribute("signupCp", signupCp);
        model.addAttribute("jobPostingDetails", jobPostingDetails);

        return "/jobPostingDetails/jobPostingDetail";
    }
}
