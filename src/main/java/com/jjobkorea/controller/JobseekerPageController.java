package com.jjobkorea.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.jjobkorea.dto.JobseekerBoardAttachDTO;
import com.jjobkorea.dto.JobseekerBoardDTO;
import com.jjobkorea.dto.JobseekerCommentDTO;
import com.jjobkorea.dto.JobseekerCriteria;
import com.jjobkorea.dto.JobseekerPageDTO;
import com.jjobkorea.service.JobseekerBoardService;
import com.jjobkorea.service.JobseekerCommentService;
import com.jjobkorea.service.JobseekerPageService;
import com.jjobkorea.service.JobseekerUploadService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class JobseekerPageController {
	@Autowired
	private JobseekerPageService service;
	
//	@RequestMapping("/listWithPaging")
	@RequestMapping("/jobseekerBoardList")
	public String listWithPaging(JobseekerCriteria cri, Model model) {
		log.info("@# list");
		log.info("@# cri=>"+cri);
		
		ArrayList<JobseekerBoardDTO> list = service.listWithPaging(cri);
		int total = service.getTotalCount(cri);
		log.info("@# total=>"+total);
		
		String page = "jobseekerBoardList";
		model.addAttribute("page", page);
		
		model.addAttribute("list", list);
		model.addAttribute("pageMaker", new JobseekerPageDTO(total, cri));
		
		return "main/main";
	}
	
}

