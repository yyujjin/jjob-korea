package com.jjobkorea.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class MainController {

//	 private static final Logger log = LoggerFactory.getLogger(MainController.class);

	// 메인 페이지로 이동
	@GetMapping("/main")
	public String enterMain(Model model) {
		String page = "main";
		log.info("메인 페이지 진입");
//		model.addAttribute("page",page);
		return "main/main";
	}

	// 요청 페이지 받기
	@GetMapping("requestPage/{page}")
	public String requestPage(@PathVariable("page") String page, Model model) {

		log.info("요청 페이지 -> " + page);
		
		if (page.equals("main")) {
			page = "main/main-content";
		}


		model.addAttribute("page", page);
		// 요청 페이지 내보내기
		return "main/main";
	}

	@GetMapping("/login")
	public String enterlogin() {
		log.info("로그인 페이지 진입");
		return "login";
	}

	@GetMapping("/signUp")
	public String enterSignUp() {
		log.info("회원가입 페이지 진입");
		return "signUp";
	}

	@GetMapping("/jobPosting")
	public String enterjobPosting() {
		log.info("채용 정보 페이지 진입");
		return "jobPosting";
	}

	@GetMapping("/jobSeekerBoard")
	public String enterJobSeekerBoard() {
		log.info("구직자 게시판 진입");
		return "jobSeekerBoard";
	}

	@GetMapping("/companyBoard")
	public String entercompanyBoard() {
		log.info("기업 게시판 진입");
		return "companyBoard";
	}

}
