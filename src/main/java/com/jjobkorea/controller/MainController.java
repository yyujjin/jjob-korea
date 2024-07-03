package com.jjobkorea.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class MainController {
	@RequestMapping("/main")
	@GetMapping
	public String enterMain(@RequestParam(required = false) String page) {
//		if(page==null) {
//			return "redirect:/main";
//		}
		System.err.println("메인 페이지 진입");
		System.err.println("요청 page "+page);
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
