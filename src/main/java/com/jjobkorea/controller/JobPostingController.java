package com.jjobkorea.controller;

import java.util.List;
import com.jjobkorea.service.UserSessionService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.jjobkorea.dto.JobPostingDTO;
import com.jjobkorea.service.JobPostingService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.RequestParam;

@Slf4j
@Controller
public class JobPostingController {

    private final JobPostingService jobPostingService;

    public JobPostingController(JobPostingService jobPostingService, UserSessionService userSessionService) {
        this.jobPostingService = jobPostingService;
    }
    
    // 채용 정보 리스트
    @GetMapping("jobPosts")
    public String enterJobPosting(@RequestParam (value = "pageNum", required = false, defaultValue = "1") String pageNum, Model model) {

        List<JobPostingDTO> postingList = jobPostingService.getPostingList( Integer.parseInt(pageNum));
        model.addAttribute("postingList", postingList);
        model.addAttribute("page", "jobPosting/jobPostingMain");

        return "main/main";
    }

    //공고 등록 페이지
    @GetMapping("/jobPost/create")
    public String addpostingwrite(Model model) {
    	log.info("공고등록model", model);
  	
        model.addAttribute("page","jobPosting/addJobPosting");

        return "main/main";
    }
    
    // 공고 등록 처리 (POST 요청)
    @PostMapping("/jobPost/create")
    public String createJobPost(JobPostingDTO jobPostingDTO) {
        log.info("공고 등록: {}", jobPostingDTO);

        // 공고 등록 처리 로직 (예: DB 저장)
        jobPostingService.addpostingwrite(jobPostingDTO);

        // 공고 등록 후 성공 페이지로 리다이렉트
        return "redirect:/jobPosts";
    }
    
    
    
    
    //공고 상세보기 페이지
    @GetMapping ("/jobPosting")
    public String view_jobPosting (@RequestParam (value = "companyId") int companyId,Model model) {

        model.addAttribute("company",jobPostingService.getCompanyInfo(companyId));
        model.addAttribute("jobPosting",jobPostingService.getJobPosting(companyId));
        model.addAttribute("page","jobPosting/view-jobPosting");
        return "main/main";
    }

}
