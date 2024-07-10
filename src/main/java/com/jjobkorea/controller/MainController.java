package com.jjobkorea.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import com.jjobkorea.dto.JobPostingDTO;
import com.jjobkorea.dto.JobseekerCriteria;
import com.jjobkorea.service.JobPostingService;
import com.jjobkorea.service.JobseekerPageService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class MainController {

	@Autowired
	private JobPostingService jobPostingService;

	// 로그인, 회원가입 컨트롤러
	@Autowired
	private MemController memController;

	// 채용 정보 컨트롤러
	@Autowired
	private JobPostingController jobPostingController;

	//구직자 게시판 컨트롤러
	@Autowired
	private JobseekerPageController jobseekerPageController;
	
	

	// 프로젝트 시작 페이지
	@GetMapping(value = { "/", "/main" })
	public String enterMain(Model model) {
		log.info("메인 페이지 진입");

		List<JobPostingDTO> postingList = jobPostingService.getPostingList();
		model.addAttribute("postingList", postingList);
		return "main/main";
	}

	// 메인 컨텐츠 페이지
	@GetMapping("/mainContent")
	public String enterMainContent(Model model) {
		log.info("메인 페이지 컨텐츠");

		//채용 정보 리스트 가져오기 
		List<JobPostingDTO> postingList = jobPostingService.getPostingList();
		model.addAttribute("postingList", postingList);
		String page = "main/main-content";

		model.addAttribute("page", page);

		return "main/main";
	}

	// 요청 파라미터에 따라 해당 페이지 컨트롤러 작동
	@GetMapping("requestPage/{page}")
	public String requestPage(@PathVariable("page") String page, Model model,JobseekerCriteria cri) {

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
			return jobPostingController.enterJobPosting(model);
		// 구직자 게시판 페이지 진입
		case "jobseekerBoard":
			return jobseekerPageController.listWithPaging(cri, model);
		}
		return "main/main";
	}

}