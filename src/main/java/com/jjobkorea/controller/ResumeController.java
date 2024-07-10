package com.jjobkorea.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class ResumeController {
	@RequestMapping("/resume")
	public String hello(Model model) {
		log.info("@#hello");
		
		model.addAttribute("message", "핼로~");
		
		return "resume_page/resume_page";
	}
	@RequestMapping("/resume_write")
	public String resumeWrite() {
		log.info("@#resume_write");
		
		return "resume_page/resume_write/resume_write";
	}
}
