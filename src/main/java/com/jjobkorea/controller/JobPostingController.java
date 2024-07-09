package com.jjobkorea.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class JobPostingController {

	@GetMapping("jobPosting")
	public String enterJobPosting(Model model) {
		String page = "jobPosting/jobPostingMain";
		model.addAttribute("page",page);
		return "main/main";
	}

}
