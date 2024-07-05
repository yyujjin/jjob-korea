package com.jjobkorea.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.jjobkorea.dto.JobPostingDTO;
import com.jjobkorea.service.JobPostingService;

@Controller
public class JobPostingController {

	@Autowired
	private JobPostingService jobPostingService;
	
	//채용 정보 리스트 조회
	@GetMapping("/postingList")
	public String getPostingList(Model model) {
			List<JobPostingDTO> postingList = jobPostingService.getPostingList();
			model.addAttribute("postingList", postingList);
			
		return "main/main-content";
	}
	
	
}
