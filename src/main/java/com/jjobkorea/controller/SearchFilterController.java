package com.jjobkorea.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.jjobkorea.dto.FilterDTO;

import jakarta.servlet.http.HttpServletResponse;

@RestController
public class SearchFilterController {

	@Autowired
	JobPostingController jobPostingController;

	@PostMapping("/searchFilter")
	public void searchFilter(@RequestBody List<String> filterList, HttpServletResponse response, Model model,FilterDTO dto)
			throws Exception {
		// 수신된 데이터 처리 (여기서는 단순히 출력)
		System.out.println("수신된 필터 리스트: " + filterList);

//        // JSON 형식으로 응답 작성
        response.setContentType("application/json;charset=utf-8");
        response.getWriter().write("{\"message\": \"필터 리스트 수신에 성공하였습니다\"}");  

		//컨트롤러 하나 만들어서 리스트 넘기기
		//리스트로 질의문 작성하고 매핑값 받아오기
		//만든 컨트롤러에서는 받아와서 jsp 리스트로 리다이렉트하는 코드 만들고 
		//js에서도 요청완료하면 페이지 채용정보 페이지 자체로 리다이렉트 되니까 list ㅓjsp에서 쓸수있어 
        
        
       //필터 서비스 선택 
       
       
       
		jobPostingController.getSearchFilterList(filterList, dto);

	}
}