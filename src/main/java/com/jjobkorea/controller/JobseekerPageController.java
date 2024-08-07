package com.jjobkorea.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import com.jjobkorea.service.*;
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

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class JobseekerPageController {
	@Autowired
	private JobseekerPageService service;
	private final UserSessionService userSessionService;

    public JobseekerPageController(UserSessionService userSessionService) {
        this.userSessionService = userSessionService;
    }

    //게시판 메인
	@RequestMapping("/board")
	public String listWithPaging(JobseekerCriteria cri, Model model) {
		log.info("@# list");
		log.info("@# cri=>"+cri);
		
		ArrayList<JobseekerBoardDTO> list = service.listWithPaging(cri);
		int total = service.getTotalCount(cri);
		log.info("@# total=>"+total);

		model.addAttribute("page", "jobseekerBoardList");
		
		model.addAttribute("list", list);
		model.addAttribute("pageMaker", new JobseekerPageDTO(total, cri));
		model.addAttribute("username",userSessionService.getUserName());

		return "main/main";
	}
	
}