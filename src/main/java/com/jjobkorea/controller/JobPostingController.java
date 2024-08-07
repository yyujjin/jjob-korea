package com.jjobkorea.controller;

import java.util.List;

import com.jjobkorea.service.JobPostingDetailService;
import com.jjobkorea.service.UserSessionService;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.jjobkorea.dto.FilterDTO;
import com.jjobkorea.dto.JobPostingDTO;
import com.jjobkorea.service.JobPostingService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class JobPostingController {

    private final JobPostingService jobPostingService;

    public JobPostingController(JobPostingService jobPostingService, UserSessionService userSessionService) {
        this.jobPostingService = jobPostingService;
    }

    // 채용 정보 리스트
    @GetMapping("jobPosts")
    public String enterJobPosting(HttpServletRequest request, Model model) {
        int pageNum = 0;
        if (request.getParameter("pageNum") == null) {
            pageNum = 1;
        } else {
            pageNum = Integer.parseInt(request.getParameter("pageNum"));
        }

        log.info("요청받은 페이지: {}", pageNum);

        //요청 받은 페이지 넘기기
        List<JobPostingDTO> postingList = jobPostingService.getPostingList(pageNum);
        model.addAttribute("postingList", postingList);
        model.addAttribute("page", "jobPosting/jobPostingMain");

        return "main/main";
    }

    //공고 등록 페이지
    @GetMapping("/jobPost/create")
    public String createJobPost(Model model) {

        model.addAttribute("page","jobPostingDetails/addJobPosting");

        return "main/main";
    }

    //공고 상세보기 페이지
    @GetMapping ("jobPost")
    public String view_jobPosting (Model model) {

        model.addAttribute("page","jobPosting/view-jobPosting");

        return "main/main";
    }

}
