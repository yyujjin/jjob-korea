package com.jjobkorea.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import com.jjobkorea.dto.JobPostingDTO;
import com.jjobkorea.service.JobPostingService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class MainController {

	@Autowired
	private JobPostingService jobPostingService;

	// 로그인, 회원가입 컨트롤러
	@Autowired
	private MemController memController;
	
	
	//기업 게시판 컨트롤러

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

		List<JobPostingDTO> postingList = jobPostingService.getPostingList();
		model.addAttribute("postingList", postingList);
		String page = "main/main-content";

		model.addAttribute("page", page);

		return "main/main";
	}

	// 요청 파라미터에 따라 해당 페이지 컨트롤러 작동
	@GetMapping("requestPage/{page}")
	public String requestPage(@PathVariable("page") String page, Model model) {

		log.info("요청 페이지 -> " + page);

		switch (page) {
		// 메인 페이지
		case "main":
			return enterMainContent(model);
		// 로그인 페이지
		case "login":
			return memController.login(model);
		// 회원가입 페이지
		case "register":
			return memController.register(model);

		}
		return "main/main";
	}

}
