package com.jjobkorea.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.jjobkorea.dto.JobPostingDTO;
import com.jjobkorea.service.JobPostingService;

import lombok.extern.slf4j.Slf4j;
@Slf4j
@Controller
public class JobPostingController {

	@Autowired
	JobPostingService jobPostingService;
	
	
	//채용 정보 페이지 진입
	@GetMapping("jobPosting")
	public String enterJobPosting(Model model) {
		String page = "jobPosting/jobPostingMain";
		model.addAttribute("page",page);
		return "main/main";
	}
	
	//채용 리스트 가져오기
	@GetMapping("/getPostingList")
	public String getPostingList(Model model) {
		log.info("채용정보 리스트 가져오기");

		//채용 정보 서비스단 연결
		List<JobPostingDTO> postingList = jobPostingService.getPostingList();
		model.addAttribute("postingList", postingList);
		String page = "main/main-content";

		model.addAttribute("page", page);

		return "main/main";
	}
	

}
