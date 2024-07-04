package com.jjobkorea.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import jakarta.annotation.Resource;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class MainController {
	
//	 private static final Logger log = LoggerFactory.getLogger(MainController.class);
	
	// 메인 페이지로 이동
	@GetMapping("/main")
	public String enterMain() {
		log.info("메인 페이지 진입");
		
		return "main/main";
	}
	
	@GetMapping("requestPage/{page}")
	public String requestPage (@PathVariable("page") String page) {
		
		log.info("요청 페이지 -> " + page);
		System.err.println(page);
		return "main/main";
	}
			
	
	
	
	@GetMapping("/login")
	public String enterlogin() {
		System.err.println("로그인 페이지 진입");
		return "login";
	}
	
	@GetMapping("/signUp")
	public String enterSignUp() {
		System.err.println("회원가입 페이지 진입");
		return "signUp";
	}
	
	@GetMapping("/jobPosting")
	public String enterjobPosting() {
		System.err.println("채용 정보 진입");
		return "jobPosting";
	}
	
	@GetMapping("/jobSeekerBoard")
	public String enterJobSeekerBoard() {
		System.err.println("구직자 게시판 진입");
		return "jobSeekerBoard";
	}
	
	@GetMapping("/companyBoard")
	public String entercompanyBoard() {
		System.err.println("기업 게시판 진입");
		return "companyBoard";
	}
}
