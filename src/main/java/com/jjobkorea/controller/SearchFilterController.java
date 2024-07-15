package com.jjobkorea.controller;

import java.util.List;

import jakarta.servlet.http.HttpServletRequest;
import org.hibernate.transform.AliasToEntityMapResultTransformer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import com.jjobkorea.dto.FilterDTO;
import com.jjobkorea.dto.JobPostingDTO;
import com.jjobkorea.service.JobPostingService;

import jakarta.servlet.http.HttpServletResponse;
import lombok.extern.slf4j.Slf4j;
import net.sf.json.JSONArray;

@Slf4j
@RestController
public class SearchFilterController {

@Autowired	
JobPostingService jobPostingService;
	

	@PostMapping("/searchFilter")
	public void searchFilter(@RequestBody List<String> filterList, HttpServletRequest request, HttpServletResponse response, Model model, FilterDTO dto)
			throws Exception {
		// 수신된 데이터 처리 (여기서는 단순히 출력)
		System.out.println("수신된 필터 리스트: " + filterList);

		int pageNum=0;
		if(request.getParameter("pageNum")==null) {
			pageNum =1;
		}else{
			pageNum = Integer.parseInt(request.getParameter("pageNum"));
		}
		log.info("요청받은 페이지: {}", pageNum);

		// JSON 형식으로 응답 작성
		//요청 받은 페이지 넘기기
    	List<JobPostingDTO> searchList = jobPostingService.getSearchList(filterList,dto,pageNum);
    	log.info("받아온 서치 리스트 : {} ",searchList);
    	
    	JSONArray json = JSONArray.fromObject(searchList);
    	String result = json.toString();
    	log.info("제이슨 결과 = {}",result );
    	
    	response.setContentType("application/json;charset=utf-8");
    	response.getWriter().write(result);  
	}


}