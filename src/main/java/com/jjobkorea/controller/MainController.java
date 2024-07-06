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

	// 메인 페이지
	@GetMapping("/main")
	public String enterMain(Model model) {
		log.info("메인 페이지 진입");

		List<JobPostingDTO> postingList = jobPostingService.getPostingList();
		model.addAttribute("postingList", postingList);
		return "main/main";
	}

	
	// 요청 페이지 받기
	@GetMapping("requestPage/{page}")
	public String requestPage(@PathVariable("page") String page, Model model) {

		log.info("요청 페이지 -> " + page);

		//메인 컨텐츠
		if (page.equals("main")) {

			List<JobPostingDTO> postingList = jobPostingService.getPostingList();
			model.addAttribute("postingList", postingList);

			page = "main/main-content";
		}

		
		model.addAttribute("page", page);
		// 요청 페이지 내보내기
		return "main/main";
	}

}
