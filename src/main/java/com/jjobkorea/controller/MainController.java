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

	// 프로젝트 대문 페이지
	//독립된 매핑 존재로 주소창에 이거 적어도 바로들어갈 수 있음 
	//여기로 요청 다 보내기 
	// 슬러시 하나로도 되게 처리하기
	@GetMapping("/main")
	public String enterMain(Model model) {
		log.info("메인 페이지 진입");

		List<JobPostingDTO> postingList = jobPostingService.getPostingList();
		model.addAttribute("postingList", postingList);
		return "main/main";
	}

	
	//메인 컨텐츠 페이지 
	@GetMapping("/mainContent")
	public String handleMainPageRequest(Model model) {
		log.info("메인 페이지 컨텐츠");
		
		List<JobPostingDTO> postingList = jobPostingService.getPostingList();
		model.addAttribute("postingList", postingList);
		String page = "main/main-content";
		
		model.addAttribute("page", page);
		
		return "main/main";
	}
	
	
	
	// 요청 파라미터에 따라 해당 페이지 컨트롤러 작동
	@GetMapping("requestPage/{page}")
	public String requestPage(@PathVariable("page") String page, Model model) {

		log.info("요청 페이지 -> " + page);

		switch(page) {
		//각 메서드에서도 model이 필요하기에 파라미터를 맞춰줘야해서 여기도 model 넣어줘야 함 (각 메서드의 파라미터 맞추기) 
		case "main" : return handleMainPageRequest(model);
		}
		


		return "main/main";
	}
	
	
	
	
	

}
