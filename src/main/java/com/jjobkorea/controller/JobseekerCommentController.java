package com.jjobkorea.controller;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jjobkorea.dto.JobseekerCommentDTO;
import com.jjobkorea.service.JobseekerCommentService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/jobseekercomment")
public class JobseekerCommentController {
	//서비스단
	@Autowired
	private JobseekerCommentService service;
	
	@PostMapping("/jobseekerSave")
	public @ResponseBody ArrayList<JobseekerCommentDTO> save(@RequestParam HashMap<String, String> param) {
		log.info("@# save");
		log.info("@# param=>"+param);
		
		service.save(param);
		
		// 해당 게시글에 작성된 댓글 리스트를 가져옴
		ArrayList<JobseekerCommentDTO> jobseekerlistCommentList = service.findAll(param);
		return jobseekerlistCommentList;
	}
}
