package com.jjobkorea.controller;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.jjobkorea.dto.CompanyBoardCommentDTO;
import com.jjobkorea.dto.CompanyCommunityBoardDTO;
import com.jjobkorea.service.CompanyBoardCommentService;
import com.jjobkorea.service.CompanyCommunityBoardService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class CompanyCommunityBoardController {
	@Autowired
	private CompanyCommunityBoardService service;
	@Autowired
	private CompanyBoardCommentService commentService;
	
	
	@RequestMapping("/list old")
	public String list(Model model) {
		log.info("@# 컨트롤러 접근 list로");
		
		ArrayList<CompanyCommunityBoardDTO> list = service.list();
		model.addAttribute("list", list);
		
		return "list";
	}
	
	
	@RequestMapping("/write")
//	public String write(CompanyCommunityBoardDTO companyCommunityBoardDTO) {
	public String write(@RequestParam HashMap<String, String> param) {
		log.info("@# 컨트롤러 write 접근");
		
		service.write(param);
		
		return "redirect:list";
	}

	@RequestMapping("/write_view")
	public String write_view() {
		log.info("@# write_view");
		
		return "write_view";
	}
	
	@RequestMapping("/content_view")
	public String content_view(@RequestParam HashMap<String, String> param, Model model) {
		log.info("@# content_view 컨트롤러 접근" );
		
		service.hit(param);
		
		CompanyCommunityBoardDTO dto = service.contentView(param);
		model.addAttribute("content_view", dto);
		
		model.addAttribute("pageMaker", param);
		
		ArrayList<CompanyBoardCommentDTO> commentList = commentService.findAll(param);
		model.addAttribute("commentList", commentList);
		
		return "content_view";
	}
	
	@RequestMapping("/modify_view")
	public String modify_view(@RequestParam HashMap<String, String> param, Model model) {
		log.info("@# modify_view 컨트롤러 접근" );
		
		CompanyCommunityBoardDTO dto = service.contentView(param);
		model.addAttribute("modify_view", dto);
		
		return "modify_view";
	}
	
	@RequestMapping("/modify")
	public String modify(@RequestParam HashMap<String, String> param) {
		log.info("@# modify");
		
		service.modify(param);
		
		return "redirect:/content_view?companyCommunityBoardNum=" + param.get("companyCommunityBoardNum");
	}
	
	@RequestMapping("/delete")
	public String delete(@RequestParam HashMap<String, String> param) {
		log.info("@# delete");
		
		service.delete(param);
		
		return "redirect:list";
	}
	
	
}
















