package com.jjobkorea.controller;

import java.util.List;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.jjobkorea.dto.FilterDTO;
import com.jjobkorea.dto.JobPostingDTO;
import com.jjobkorea.service.JobPostingService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class JobPostingController {

	@Autowired
	JobPostingService jobPostingService;

	// 채용 정보 페이지 진입
	@GetMapping("jobPosting")
	public String enterJobPosting(HttpServletRequest request, HttpServletResponse response, Model model) {
		String pageNum="";
		if(request==null) {
			pageNum = "1";
		}else{
			pageNum =request.getParameter("pageNum");
		}

		log.info("요청받은 페이지: {}", pageNum);
		String page = "jobPosting/jobPostingMain";
		model.addAttribute("page", page);

		// 채용 정보 리스트 가져오는 메서드 실행시키기
		getPostingList(model);

		return "main/main";
	}

	// 채용 정보 페이지 진입 시 리스트 가져오기
	public String getPostingList(Model model) {
		log.info("채용정보 리스트 가져오기");

		// 채용 정보 서비스단 연결
		List<JobPostingDTO> postingList = jobPostingService.getPostingList();
		model.addAttribute("postingList", postingList);

		return "jobPosting/jobList";
	}

}
