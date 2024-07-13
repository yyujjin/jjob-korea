package com.jjobkorea.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.jjobkorea.dto.FilterDTO;
import com.jjobkorea.dto.JobPostingDTO;
import com.jjobkorea.service.JobPostingService;

import jakarta.servlet.http.HttpServletResponse;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController
public class SearchFilterController {

@Autowired	
JobPostingService jobPostingService;
	

	@PostMapping("/searchFilter")
	public void searchFilter(@RequestBody List<String> filterList, HttpServletResponse response, Model model,FilterDTO dto)
			throws Exception {
		// 수신된 데이터 처리 (여기서는 단순히 출력)
		System.out.println("수신된 필터 리스트: " + filterList);

       // JSON 형식으로 응답 작성
        response.setContentType("application/json;charset=utf-8");
        response.getWriter().write("{\"message\": \"필터 리스트 수신에 성공하였습니다\"}");  
        
    	List<JobPostingDTO> searchList = jobPostingService.getSearchList(filterList,dto);
    	log.info("받아온 서치 리스트 : {} ",searchList);
       

	}
}