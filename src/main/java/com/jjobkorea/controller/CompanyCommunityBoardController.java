package com.jjobkorea.controller;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.jjobkorea.dto.CompanyCommunityBoardDTO;
import com.jjobkorea.service.CompanyCommunityBoardService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class CompanyCommunityBoardController {
	@Autowired
	private CompanyCommunityBoardService service;
//	@Autowired
//	private CompanyBoardCommentService commentService;
	
	
	@RequestMapping("/companyBoardList")
	public String list(Model model) {
		log.info("@# 컨트롤러 접근 list로");
		
		ArrayList<CompanyCommunityBoardDTO> CompanyBoardList = service.companyBoardList();
		model.addAttribute("list", CompanyBoardList);
		
		return "companyBoardList";
	}
	
	
	@RequestMapping("/write")
//	public String write(CompanyCommunityBoardDTO companyCommunityBoardDTO) {
	public String write(@RequestParam HashMap<String, String> param) {
		log.info("@# 컨트롤러 write 접근");
		
		service.companyBoardWrite(param);
		
		return "redirect:companyBoardList";
	}

	@RequestMapping("/companyBoardWrite_view")
	public String write_view() {
		log.info("@# write_view");
		
		return "companyBoardWrite_view";
	}
	
	@RequestMapping("/companyBoardContent_view")
	public String content_view(@RequestParam HashMap<String, String> param, Model model) {
		log.info("@# content_view 컨트롤러 접근" );
		
		service.companyBoardHit(param);
		
		CompanyCommunityBoardDTO dto = service.companyBoardContentView(param);
		model.addAttribute("content_view", dto);
		
		model.addAttribute("pageMaker", param);
		
//		ArrayList<CompanyBoardCommentDTO> commentList = commentService.findAll(param);
//		model.addAttribute("commentList", commentList);
		
		return "companyBoardContent_view";
	}
	
	@RequestMapping("/companyBoardModify_view")
	public String modify_view(@RequestParam HashMap<String, String> param, Model model) {
		log.info("@# modify_view 컨트롤러 접근" );
		
		CompanyCommunityBoardDTO dto = service.companyBoardContentView(param);
		model.addAttribute("modify_view", dto);
		
		return "companyBoardModify_view";
	}
	
	@RequestMapping("/companyBoardModify")
	public String modify(@RequestParam HashMap<String, String> param) {
		log.info("@# modify");
		
		service.companyBoardModify(param);
		
		return "redirect:/companyBoardContent_view?companyCommunityBoardNum=" + param.get("companyCommunityBoardNum");
	}
//	
	@RequestMapping("/companyBoardDelete")
	public String delete(@RequestParam HashMap<String, String> param) {
		log.info("@# delete");
		
		service.companyBoardDelete(param);
		
		return "redirect:companyBoardList";
	}
	
	
}















