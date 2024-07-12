package com.jjobkorea.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class ResumeController {
	
	//도훈씨 개인 작업 할 때 경로 
	
	@RequestMapping("/resume")
	public String resume(Model model) {
		log.info("@#hello");

		model.addAttribute("message", "핼로~");

		return "resume_page/resume_page";
	}

	// 메인에서 부를 경우 (샘플 용)
	//헤더 부분 주석처리
	//이력서 페이지 css, js 경로 상대경로로 걸려있던 거 ${pageContext.request.contextPath} 이용해서 절대 경로로 변경
	//변경한 코드에는 주석 달았음
	//해당 페이지 자체적으로 css가 걸려있어서 메인 css랑 충돌 
	public String resister(Model model) {
		log.info("@#hello");

		model.addAttribute("message", "핼로~");

		String page = "resume_page/resume_page";
		model.addAttribute("page", page);
		return "main/main";
	}

	@RequestMapping("/resume_write")
	public String resumeWrite() {
		log.info("@#resume_write");

		return "resume_page/resume_write/resume_write";
	}
}
