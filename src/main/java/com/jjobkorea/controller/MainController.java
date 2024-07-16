package com.jjobkorea.controller;

import java.util.List;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;

import com.jjobkorea.dto.JobPostingDTO;
import com.jjobkorea.dto.JobseekerCriteria;
import com.jjobkorea.service.JobPostingService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class MainController {

    @Autowired
    private JobPostingService jobPostingService;
    @Autowired
    private HttpSession session;
    
    @Autowired
    private AddJobPostingController addJobPostingController;

    // 로그인, 회원가입 컨트롤러
    @Autowired
    private MemController memController;

    // 채용 정보 컨트롤러
    @Autowired
    private JobPostingController jobPostingController;

    //구직자 게시판 컨트롤러
    @Autowired
    private JobseekerPageController jobseekerPageController;

    //이력서 컨트롤러
    @Autowired
    private ResumeController resumeController;


    //공고 등록 컨트롤러
    @Autowired
    private JobPostingDetailController jobPostingDetailController;

    // 메인 컨텐츠 페이지
    @GetMapping(value = {"/", "/main"})
    public String enterMainContent(Model model) {
        log.info("메인 페이지 컨텐츠");

        //채용 정보 리스트 가져오기
        List<JobPostingDTO> postingList = jobPostingService.getJobPostingSToMain();
        model.addAttribute("postingList", postingList);
        String page = "main/main-content";

        model.addAttribute("page", page);

        return "main/main";
    }

    // 요청 파라미터에 따라 해당 페이지 컨트롤러 작동
    @GetMapping("requestPage/{page}")
    public String requestPage(@PathVariable("page") String page, Model model, JobseekerCriteria cri, HttpServletRequest request) {

        log.info("요청 페이지 -> " + page);

        switch (page) {
            // 메인 페이지 진입
            case "main":
                return enterMainContent(model);
            // 로그인 페이지 진입
            case "login":
                return memController.login(model);
            // 회원가입 페이지 진입
            case "register":
                return memController.register(model);
            // 채용 정보 페이지 진입
            case "jobPosting":
                return jobPostingController.enterJobPosting(request, model);
            // 구직자 게시판 페이지 진입
            case "jobseekerBoard":
                return jobseekerPageController.listWithPaging(cri, model);

            //이력서 등록 페이지 진입
            case "resume":
                return resumeController.resister(model, session);

            //공고 등록 페이지 진입
            case "jobPostingResister":
                return addJobPostingController.showAddJobPostingForm(model,session);
        }
        return "main/main";
    }

}