package com.jjobkorea.controller.bin;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.jjobkorea.dto.bin.CompanyCommunityBoardDTO;
import com.jjobkorea.dto.bin.Criteria;
import com.jjobkorea.dto.bin.PageDTO;
import com.jjobkorea.service.bin.PageService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class PageController {
	@Autowired
	private PageService service;
	
//	@RequestMapping("/listWithPaging")
	@RequestMapping("/list")
	public String listWithPaging(Criteria cri, Model model) {
		log.info("@# list");
		log.info("@# cri=>"+cri);
		
		ArrayList<CompanyCommunityBoardDTO> list = service.listWithPaging(cri);
//		int total = service.getTotalCount();
		int total = service.getTotalCount(cri);
		log.info("@# total=>"+total);
		
		model.addAttribute("list", list);
//		model.addAttribute("pageMaker", new PageDTO(123, cri));
		model.addAttribute("pageMaker", new PageDTO(total, cri));
		
		return "list";
	}
	
}
















