package com.jjobkorea.controller;

import java.util.List;

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

    @Autowired
    JobPostingService jobPostingService;

    // 채용 정보 페이지 진입
    @GetMapping("jobPosting")
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

        String page = "jobPosting/jobPostingMain";
        model.addAttribute("page", page);

        return "main/main";
    }

}
