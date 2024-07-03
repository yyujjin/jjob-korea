package com.jjobkorea.controller.bin;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jjobkorea.dto.bin.CompanyBoardCommentDTO;
import com.jjobkorea.service.bin.CompanyBoardCommentService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/comment")
public class CompanyBoardCommentController {
	//서비스단
	@Autowired
	private CompanyBoardCommentService service;
	
	@PostMapping("/save")
//	public ArrayList<CommentDTO> save(@RequestParam HashMap<String, String> param) {
	public @ResponseBody ArrayList<CompanyBoardCommentDTO> save(@RequestParam HashMap<String, String> param) {
		log.info("@# save");
		log.info("@# param=>"+param);
		
		service.save(param);
		
		// 해당 게시글에 작성된 댓글 리스트를 가져옴
		ArrayList<CompanyBoardCommentDTO> commentList = service.findAll(param);
		return commentList;
	}
}











