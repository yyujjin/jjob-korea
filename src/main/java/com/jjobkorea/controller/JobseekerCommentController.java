package com.jjobkorea.controller;

import java.util.ArrayList;
import java.util.HashMap;

import com.jjobkorea.service.UserSessionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jjobkorea.dto.JobseekerCommentDTO;
import com.jjobkorea.service.JobseekerCommentService;

import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/jobseekercomment")
public class JobseekerCommentController {
	//서비스단
	@Autowired
	private JobseekerCommentService service;

    @PostMapping("/jobseekerSave")
	public @ResponseBody ArrayList<JobseekerCommentDTO> save(@RequestParam HashMap<String, String> param
			// 로그인세션
			,HttpSession session) { 
		log.info("@# save");
		log.info("@# param=>"+param);
		// 로그인 안했을때 예외처리
		if (session.getAttribute("user") == null) {
            throw new IllegalStateException();
        }
		service.save(param);
		
		// 해당 게시글에 작성된 댓글 리스트를 가져옴
		ArrayList<JobseekerCommentDTO> jobseekerlistCommentList = service.findAll(param);
		return jobseekerlistCommentList;
	}
	
	//실시간댓글
	@GetMapping("/getComments")
    public @ResponseBody ArrayList<JobseekerCommentDTO> getComments(@RequestParam("jobseekerCommunityBoardNum") int jobseekerCommunityBoardNum) {
        HashMap<String, String> param = new HashMap<>();
        param.put("jobseekerCommunityBoardNum", String.valueOf(jobseekerCommunityBoardNum));
        return service.findAll(param);
    }
	
	// 로그인을 안한 예외를 받아서 로그인 페이지로 이동
	@ControllerAdvice
	public static class GlobalExceptionHandler {
	    @ExceptionHandler(IllegalStateException.class)
	    public ResponseEntity<String> handleIllegalStateException(IllegalStateException ex) {
	    	return new ResponseEntity<>("redirect:/login", HttpStatus.UNAUTHORIZED);
	    }
	}
	
}

