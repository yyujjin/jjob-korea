package com.jjobkorea.controller;

import java.util.List;

import com.jjobkorea.service.UserSessionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;

import com.jjobkorea.dto.JobPostingDTO;
import com.jjobkorea.dto.JobseekerCriteria;
import com.jjobkorea.service.JobPostingService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class MainController {

    private final JobPostingService jobPostingService;
    private final UserSessionService userSessionService;

    public MainController(JobPostingService jobPostingService, UserSessionService userSessionService) {
        this.jobPostingService = jobPostingService;
        this.userSessionService = userSessionService;
    }

    // 메인
    @GetMapping("/")
    public String enterMainContent(Model model) {

        //채용 정보 리스트 가져오기
        List<JobPostingDTO> postingList = jobPostingService.getJobPostingSToMain();
        model.addAttribute("postingList", postingList);
        model.addAttribute("page","main/main-content");
        log.info("사용자 id : {}",userSessionService.getUserId());
        log.info("사용자 이름 : {}",userSessionService.getUserName());
        return "main/main";
    }
}
