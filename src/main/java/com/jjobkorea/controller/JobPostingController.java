package com.jjobkorea.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.jjobkorea.dto.JobPostingDTO;
import com.jjobkorea.service.JobPostingService;

import jakarta.servlet.http.HttpServletResponse;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class JobPostingController {

	@Autowired
	JobPostingService jobPostingService;
	

	// 채용 정보 페이지 진입
	@GetMapping("jobPosting")
	public String enterJobPosting(Model model) {
		String page = "jobPosting/jobPostingMain";
		model.addAttribute("page", page);

		// 채용 정보 리스트 가져오는 메서드 실행시키기
		getPostingList(model);
		

		return "main/main";
	}
	
	//위에랑 똑같은 함수 만드는데 겟매핑을 다르게 해서 유알엘을 새로 만들어서 이걸 연결하고

	//채용 정보 리스트 가져오는 메서드를 새로 만들어서 그거 연결하기
	
	
	
	// 채용 정보 페이지 진입 시 리스트 가져오기
	public String getPostingList(Model model) {
		log.info("채용정보 리스트 가져오기");

		// 채용 정보 서비스단 연결
		List<JobPostingDTO> postingList = jobPostingService.getPostingList();
		model.addAttribute("postingList", postingList);

		return "jobPosting/jobList";
	}

	//상세조건 검색
	public void getSearchFilterList( List<String> filterList) {
		log.info("getSearchFilterList 실행됨!!!");
		List<JobPostingDTO> searchList = jobPostingService.getSearchList(filterList);
		
		
	}

	
	
}