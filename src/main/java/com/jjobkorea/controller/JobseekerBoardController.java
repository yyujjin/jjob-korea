package com.jjobkorea.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.jjobkorea.dto.JobseekerBoardAttachDTO;
import com.jjobkorea.dto.JobseekerBoardDTO;
import com.jjobkorea.dto.JobseekerCommentDTO;
import com.jjobkorea.dto.MemDTO;
import com.jjobkorea.service.JobseekerBoardService;
import com.jjobkorea.service.JobseekerCommentService;
import com.jjobkorea.service.JobseekerUploadService;

import jakarta.servlet.http.HttpSession;
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
		
	 @PostMapping("/jobseekerWrite")
	    public String write(JobseekerBoardDTO boardDTO, HttpSession session) {
	        log.info("@# write");
	        log.info("@# boardDTO=>" + boardDTO);

	        if (session.getAttribute("user") == null) {
	            return "redirect:/login";
	        }

	        if (boardDTO.getAttachList() != null) {
	            boardDTO.getAttachList().forEach(attach -> log.info("@# attach=>" + attach));
	        }

	        service.jobseekerWrite(boardDTO);

	        return "redirect:/requestPage/jobseekerBoardList";
	    }
	
	 @RequestMapping("/jobseekerWrite_view")
	    public String write_view(HttpSession session) {
	        log.info("@# write_view");

	        if (session.getAttribute("user") == null) {
	            return "redirect:/login";
	        }

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
		//메인페이지로 연결 
		String page = "jobseekerContent_view";
		model.addAttribute("page", page);
		// return "jobseekerContent_view";
	    return "main/main";
	}
	
	// requestPage/jobseekerContent_view~로 연결하는걸 다시 여기로 연결
		@RequestMapping("/requestPage/jobseekerContent_view")
		public String redirectToJobseekerContentView(@RequestParam(value = "pageNum", required = false) String pageNum,
	                                                 @RequestParam(value = "amount", required = false) String amount,
	                                                 @RequestParam(value = "type", required = false) String type,
	                                                 @RequestParam(value = "keyword", required = false) String keyword,
	                                                 @RequestParam(value = "jobseekerCommunityBoardNum") String jobseekerCommunityBoardNum) {
			// URL을 구성합니다.
			String redirectUrl = String.format("redirect:/jobseekerContent_view?pageNum=%s&amount=%s&type=%s&keyword=%s&jobseekerCommunityBoardNum=%s",
	                                           pageNum, amount, type, keyword, jobseekerCommunityBoardNum);
			return redirectUrl;
		}
	
		@PostMapping("/jobseekerModify")
	    public String modify(@RequestParam HashMap<String, String> param, RedirectAttributes rttr, HttpSession session) {
	        log.info("@# modify");
	        log.info("@# param=>" + param);

	        if (session.getAttribute("user") == null) {
	            return "redirect:/login";
	        }

	        service.jobseekerModify(param);

	        rttr.addAttribute("pageNum", param.get("pageNum"));
	        rttr.addAttribute("amount", param.get("amount"));

	        return "redirect:/requestPage/jobseekerBoardList";
	    }
	

		 @PostMapping("/delete")
		    public String delete(@RequestParam HashMap<String, String> param, RedirectAttributes rttr, HttpSession session) {
		        log.info("@# delete");
		        log.info("@# param=>" + param);
		        log.info("@# jobseekerCommunityBoardNum=>" + param.get("jobseekerCommunityBoardNum"));

		        if (session.getAttribute("user") == null) {
		            return "redirect:/login";
		        }

		        List<JobseekerBoardAttachDTO> fileList = uploadService.getFileList(Integer.parseInt(param.get("jobseekerCommunityBoardNum")));
		        log.info("@# fileList=>" + fileList);

		        service.jobseekerDelete(param);
		        uploadService.deleteFiles(fileList);

		        rttr.addAttribute("pageNum", param.get("pageNum"));
		        rttr.addAttribute("amount", param.get("amount"));

		        return "redirect:/requestPage/jobseekerBoardList";
		}
		 	
}