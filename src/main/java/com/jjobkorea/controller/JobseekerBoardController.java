package com.jjobkorea.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.jjobkorea.dto.JobseekerBoardAttachDTO;
import com.jjobkorea.dto.JobseekerBoardDTO;
import com.jjobkorea.dto.JobseekerCommentDTO;
import com.jjobkorea.dto.UserDTO;
import com.jjobkorea.service.JobseekerBoardService;
import com.jjobkorea.service.JobseekerCommentService;
import com.jjobkorea.service.JobseekerUploadService;
import com.jjobkorea.service.UserSessionService;

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
	
	private final UserSessionService userSessionService;
	
	public JobseekerBoardController(UserSessionService userSessionService) {
        this.userSessionService = userSessionService;
    }
	
	// 글 작성
    @PostMapping("/jobseekerWrite")
   	public String write(JobseekerBoardDTO boardDTO, Model model) {
        log.info("@# write");
        log.info("@# boardDTO => " + boardDTO);

        String userid = userSessionService.getUserId();
        model.addAttribute("userid",userid);

        if (boardDTO.getAttachList() != null) {
            boardDTO.getAttachList().forEach(attach -> log.info("@# attach => " + attach));
        }

        service.jobseekerWrite(boardDTO);

        return "redirect:/board";
    }

    // 글 작성 뷰
    @RequestMapping("/board/create")
    public String write_view(Model model) {
        log.info("@# write_view");

        String userid = userSessionService.getUserId();
        model.addAttribute("userid",userid);
 
        model.addAttribute("page", "jobseekerWrite_view");

        return "main/main";
    }
		
//  write 부분 작성자 정보 아이디 가져오기
    
    @RequestMapping("/jobseekerContent_view")
    public String content_view(@RequestParam HashMap<String, String> param, Model model) {
        log.info("글 보기");

        JobseekerBoardDTO dto = service.jobseekerContentView(param);
        model.addAttribute("content_view", dto);

        // content_view.jsp 에서 pageMaker 를 가지고 페이징 처리
        model.addAttribute("pageMaker", param);

        // 해당 게시글에 작성된 댓글 리스트를 가져옴
        ArrayList<JobseekerCommentDTO> commentList = commentService.findAll(param);
        model.addAttribute("commentList", commentList);

        // 로그인한 사용자 정보를 얻는다
        String userid = userSessionService.getUserId();
        model.addAttribute("userid", userid);
        
        // 좋아요 상태 및 좋아요 수 확인
        boolean hasLiked = false;
        int likeCount = service.getLikeCount(dto.getJobseekerCommunityBoardNum());
        
        if (userid != null) {
            log.info("게시판 접근 -> 유저 아이디 : {} ", userid);

            // 로그인 상태인지 확인하고 사용자 이름을 얻는다
            String userName = userSessionService.getUserName();
            log.info("게시판 접근 -> 유저 이름 : {} ", userName);

            // 게시글 작성자 ID 얻기
            String jobseekerCommunityBoardName = dto.getJobseekerCommunityBoardName(); // DTO에서 작성자 ID를 가져온다

            // 조회수 증가 로직
            if (!userid.equals(jobseekerCommunityBoardName)) { // 본인 글이 아닐 때
                int jobseekerCommunityBoardNum = dto.getJobseekerCommunityBoardNum(); // DTO에서 게시글 번호를 가져온다
                service.jobseekerHit(jobseekerCommunityBoardNum);
            }
            // 현재 사용자가 해당 게시글에 좋아요를 눌렀는지 확인
            HashMap<String, String> likeParam = new HashMap<>();
            likeParam.put("jobseekerCommunityBoardNum", String.valueOf(dto.getJobseekerCommunityBoardNum()));
            likeParam.put("userId", userid);
            hasLiked = service.hasLiked(likeParam);
        } else {
            // 사용자가 로그인하지 않은 경우에도 조회수를 증가시킴
            int jobseekerCommunityBoardNum = dto.getJobseekerCommunityBoardNum(); // DTO에서 게시글 번호를 가져온다
            service.jobseekerHit(jobseekerCommunityBoardNum);
        }

        // 좋아요 상태와 좋아요 수를 JSP에 전달
        model.addAttribute("hasLiked", hasLiked);
        model.addAttribute("likeCount", likeCount);

        // 메인페이지로 연결
        model.addAttribute("page", "jobseekerContent_view");

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
	    public String modify(@RequestParam HashMap<String, String> param,
	    					RedirectAttributes rttr) {
	        log.info("@# modify");
	        log.info("@# param=>" + param);
	        
	        service.jobseekerModify(param);

	        rttr.addAttribute("pageNum", param.get("pageNum"));
	        rttr.addAttribute("amount", param.get("amount"));

	        return "redirect:/board";
	    }
	

		 @PostMapping("/delete")
		    public String delete(@RequestParam HashMap<String, String> param, RedirectAttributes rttr) {
		        log.info("@# delete");
		        log.info("@# param=>" + param);
		        log.info("@# jobseekerCommunityBoardNum=>" + param.get("jobseekerCommunityBoardNum"));

		        List<JobseekerBoardAttachDTO> fileList = uploadService.getFileList(Integer.parseInt(param.get("jobseekerCommunityBoardNum")));
		        log.info("@# fileList=>" + fileList);

		        service.jobseekerDelete(param);
		        uploadService.deleteFiles(fileList);

		        rttr.addAttribute("pageNum", param.get("pageNum"));
		        rttr.addAttribute("amount", param.get("amount"));

		        return "redirect:/board";
		}
		 
		 
		 @PostMapping("/like")
		 @ResponseBody
		 public ResponseEntity<Map<String, Object>> like(
		         @RequestParam("jobseekerCommunityBoardNum") int jobseekerCommunityBoardNum,
		         Model model) {
		     log.info("@# like");
		     log.info("@# 글번호 => " + jobseekerCommunityBoardNum);

		     Map<String, Object> response = new HashMap<>();

		     String userid = userSessionService.getUserId();
		     model.addAttribute("userid",userid);
		     log.info("@# 회원아이디 => " + userid);

		     HashMap<String, String> param = new HashMap<>();
		     param.put("jobseekerCommunityBoardNum", String.valueOf(jobseekerCommunityBoardNum));
		     param.put("userId", userid);
		     
		     service.likeOrUnlike(param);

		     int likeCount = service.getLikeCount(jobseekerCommunityBoardNum);
		     boolean hasLiked = service.hasLiked(param); // 좋아요 여부 반환
		     response.put("likeCount", likeCount);
		     response.put("hasLiked", hasLiked);
		     return ResponseEntity.ok(response); // 200 상태 코드 반환
		 }
}