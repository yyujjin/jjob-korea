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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.jjobkorea.dto.JobseekerBoardAttachDTO;
import com.jjobkorea.dto.JobseekerBoardDTO;
import com.jjobkorea.dto.JobseekerCommentDTO;
import com.jjobkorea.dto.JobseekerPageDTO;
import com.jjobkorea.service.JobseekerBoardService;
import com.jjobkorea.service.JobseekerCommentService;
import com.jjobkorea.service.JobseekerUploadService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class JobseekerBoardController {
	@Autowired
	private JobseekerBoardService service;
	
	@Autowired
	private JobseekerCommentService commentService;

	@Autowired
	private JobseekerUploadService uploadService;
	
//	@RequestMapping("/list")
	@RequestMapping("/jobseekerBoardList_old")
	public String list(Model model) {
		log.info("@# list");
		
		ArrayList<JobseekerBoardDTO> list = service.jobseekerBoardList();
		model.addAttribute("list", list);
				
		return "main/main";
	}
	
	@RequestMapping("/jobseekerWrite")
//	public String write(@RequestParam HashMap<String, String> param) {
	public String write(JobseekerBoardDTO boardDTO) {
		log.info("@# write");
		log.info("@# boardDTO=>"+boardDTO);
		
		if (boardDTO.getAttachList() != null) {
			boardDTO.getAttachList().forEach(attach -> log.info("@# attach=>"+attach));
		}
		
//		service.write(param);
		service.jobseekerWrite(boardDTO);
		
		return "redirect:jobseekerBoardList";
	}
	
	@RequestMapping("/jobseekerWrite_view")
	public String write_view() {
		log.info("@# write_view");
		
		return "jobseekerWrite_view";
	}
	
	@RequestMapping("/jobseekerContent_view")
	public String content_view(@RequestParam HashMap<String, String> param, Model model) {
		log.info("@# content_view");
		
		JobseekerBoardDTO dto = service.jobseekerContentView(param);
		model.addAttribute("content_view", dto);
		
//		content_view.jsp 에서 pageMaker 를 가지고 페이징 처리
		model.addAttribute("pageMaker", param);
		
		// 해당 게시글에 작성된 댓글 리스트를 가져옴
		ArrayList<JobseekerCommentDTO> commentList = commentService.findAll(param);
		model.addAttribute("commentList", commentList);
		
		int jobseekerCommunityBoardNum = Integer.parseInt(param.get("jobseekerCommunityBoardNum"));
	    service.jobseekerHit(jobseekerCommunityBoardNum);
		
		return "jobseekerContent_view";
	}
	
	@RequestMapping("/jobseekerModify")
//	public String modify(@RequestParam HashMap<String, String> param) {
	public String modify(@RequestParam HashMap<String, String> param, RedirectAttributes rttr) {
		log.info("@# modify");
		log.info("@# param=>"+param);
		
		service.jobseekerModify(param);
		
//		페이지 이동시 뒤에 페이지번호, 글 갯수 추가
		rttr.addAttribute("pageNum", param.get("pageNum"));
		rttr.addAttribute("amount", param.get("amount"));

		return "redirect:jobseekerBoardList";
	}
	
	@RequestMapping("/jobseekerDelete")
//	public String delete(@RequestParam HashMap<String, String> param) {
	public String delete(@RequestParam HashMap<String, String> param, RedirectAttributes rttr) {
		log.info("@# delete");
		log.info("@# param=>"+param);
		log.info("@# jobseekerCommunityBoardNum=>"+param.get("jobseekerCommunityBoardNum"));
		
		List<JobseekerBoardAttachDTO> fileList = uploadService.getFileList(Integer.parseInt(param.get("jobseekerCommunityBoardNum")));
		log.info("@# fileList=>"+fileList);
		
		service.jobseekerDelete(param);
		uploadService.deleteFiles(fileList);
		
//		페이지 이동시 뒤에 페이지번호, 글 갯수 추가
		rttr.addAttribute("pageNum", param.get("pageNum"));
		rttr.addAttribute("amount", param.get("amount"));
		
		return "redirect:jobseekerBoardList";
	}
	
}