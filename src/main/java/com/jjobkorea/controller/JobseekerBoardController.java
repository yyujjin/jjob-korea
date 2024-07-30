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
import com.jjobkorea.dto.UserDTO;
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
	
	 @RequestMapping("/requestPage/jobseekerWrite_view")
	    public String write_view(HttpSession session, Model model) {
	        log.info("@# write_view");

	        if (session.getAttribute("user") == null) {
	            return "redirect:/requestPage/login";
	        }
	        String page = "jobseekerWrite_view";
			model.addAttribute("page", page);
		    return "main/main";
	    }
	
	// 여기서부터 문제임
	// JobseekerBoardController.java content_view 메서드
	 @RequestMapping("/jobseekerContent_view")
	 	public String content_view(@RequestParam HashMap<String, String> param, Model model, HttpSession session) {
	 		log.info("글 보기");
	 			
	 		JobseekerBoardDTO dto = service.jobseekerContentView(param);
	 		model.addAttribute("content_view", dto);
	 		
//	 		content_view.jsp 에서 pageMaker 를 가지고 페이징 처리
	 		model.addAttribute("pageMaker", param);
	 			
	 		// 해당 게시글에 작성된 댓글 리스트를 가져옴
	 		ArrayList<JobseekerCommentDTO> commentList = commentService.findAll(param);
	 		model.addAttribute("commentList", commentList);
	 			
	 		
	 		
	 		
	 		// 로그인한 사용자 정보를 얻는다
	 		UserDTO  userObj = session.getAttribute("user");
	        UserDTO loggedInUser = null;
	        if (userObj instanceof UserDTO) {
	            loggedInUser = (UserDTO) userObj;
	        } else {
	            log.error("세션에서 UserDTO 객체를 가져오지 못했습니다. 현재 객체 타입: {}", userObj != null ? userObj.getClass().getName() : "null");
	        }

	        // 로그인 상태인지 확인하고 사용자 이름을 얻는다
	        String userName = null;
	        if (loggedInUser != null) {
	            userName = loggedInUser.getName(); // UserDTO 객체에서 이름을 가져온다
	        }

	        // 게시글 작성자 ID 얻기
	        String jobseekerCommunityBoardName = dto.getJobseekerCommunityBoardName(); // DTO에서 작성자 ID를 가져온다

	        // 조회수 증가 로직
	        if (!userName.equals(jobseekerCommunityBoardName)) { // 본인 글이 아닐 때
	            int jobseekerCommunityBoardNum = dto.getJobseekerCommunityBoardNum(); // DTO에서 게시글 번호를 가져온다
	            service.jobseekerHit(jobseekerCommunityBoardNum);
	        }
	 		//메인페이지로 연결 
	 		String page = "jobseekerContent_view";
	 		model.addAttribute("page", page);
	 		// return "jobseekerContent_view";
	 	    return "main/main";
	 		}
	
	 // 여기까지 문제임
	 
	 
	 
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