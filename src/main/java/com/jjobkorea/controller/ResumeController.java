package com.jjobkorea.controller;

import java.io.File;
import java.io.IOException;
import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.List;

import com.jjobkorea.dto.UserDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.jjobkorea.dto.MemDTO;
import com.jjobkorea.dto.ResumeInfoDTO;
import com.jjobkorea.dto.ResumeWritePageDTO;
import com.jjobkorea.service.ResumeInfoService;
import com.jjobkorea.service.ResumeWritePageService;
import com.jjobkorea.service.ResumeWritePageServiceImpl;

import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class ResumeController {
    @Autowired
    private ResumeInfoService resumeInfoService;
    @Autowired
    private ResumeWritePageService pageService;

    //사용안하는 메서드인거 같아 일단 주석처리 했습니다.
	/*@RequestMapping("/resume")
	public String resume(Model model) {
		log.info("@#hello");

		model.addAttribute("message", "핼로~");

		return "resume_page/resume_page";
	}*/
    
    
    
	// 메인에서 부를 경우 (샘플 용)
	//헤더 부분 주석처리
	//이력서 페이지 css, js 경로 상대경로로 걸려있던 거 ${pageContext.request.contextPath} 이용해서 절대 경로로 변경
	//변경한 코드에는 주석 달았음
	//해당 페이지 자체적으로 css가 걸려있어서 메인 css랑 충돌
//	public String resister(Model model) {
//		log.info("@#hello");
//
//		model.addAttribute("message", "핼로~");
//
//		String page = "resume_page/resume_page";
//		model.addAttribute("page", page);
//		return "main/main";
//	}
    
    //네비게이션 헤더에서 이력서등록 항목 클릭시 실행되는 로직
    @GetMapping("/resume")
	public String resister(Model model, HttpSession session) {
		log.info("@#hello");
		
		model.addAttribute("@#message resister", "핼로~");
        if(session.getAttribute("user") == null) {
        	System.out.println("로그인이 안됐습니다.");

            //수정 전
            /*return "redirect:/login";*/
            //수정 후
            return "redirect:/requestPage/login";

        }
        
        // 저장된 이력서 가져오는 로직 
        List<ResumeInfoDTO> resumes = resumeInfoService.findAll();
        model.addAttribute("resumes", resumes);
        
        for(ResumeInfoDTO test : resumes) {
        	System.out.println(test.getResumeBirthDay());
        }
        
        //수정 전 세션 저장 로직
        /*MemDTO dto = (MemDTO) session.getAttribute("user");
        String userId = dto.getMemId();*/

        //수정 후 세션 저장 로직
        UserDTO user = (UserDTO) session.getAttribute("user");
        String userId = user.getUserId();

        //수정 전
       /* model.addAttribute("userId", userId);
		String page = "resume_page/resume_page";
		model.addAttribute("page", page);*/

        //수정 후
        model.addAttribute("userId", userId);
        model.addAttribute("page", "resume_page/resume_page");
		
		return "main/main";
	}


	 @PostMapping("/resume")
	    public String addResume(ResumeWritePageDTO resume, HttpSession session) {
		 
		 MemDTO user = (MemDTO) session.getAttribute("user");
		 System.out.println(user.getClass());
		 String memId = user.getMemId();
		 
	        if (session.getAttribute("user") == null) {
	            return "redirect:/login";
	        }
	        resume.setResumePageUserId(memId);
	        pageService.insertResume(resume);
	        return "redirect:/requestPage/{page}";
	    }


   @GetMapping("/resume_write")
    public String resumeWrite(Model model, HttpSession session) {
        log.info("@#resume_write");
  

        model.addAttribute("resume_user_information", new ResumeInfoDTO());
        return "resume_page/resume_write/resume_write";
    }
   
   @PostMapping("/resume_write")
   public String saveResume(
           @ModelAttribute ResumeInfoDTO resumeInfoDTO, HttpSession session, Model model)	
//           @RequestParam("resumeBirthDay") String resumeBirthDay,
//           @RequestParam("resumeCpJoinDate") String resumeCpJoinDate,
//           @RequestParam("resumeCpLeaveDate") String resumeCpLeaveDate) 
        		   throws ParseException {

       log.info("@#saveResume");


       // MultipartFile 설정
       MultipartFile file = resumeInfoDTO.getResumeProfilePhoto();
       if (file != null && !file.isEmpty()) {
           try {
               String fileName = file.getOriginalFilename();
               String filePath = "D:\\dev\\upload\\" + fileName; // 실제 저장 경로로 변경
               File dest = new File(filePath);
               file.transferTo(dest);
               resumeInfoDTO.setResumeFilePath(filePath);
           } catch (IOException e) {
               log.error("Failed to save file", e);
           }
       }
       //session 에서 작성자 ID 받아와서 DTO 에 바인딩 
       MemDTO user = (MemDTO) session.getAttribute("user");
       String userId = user.getMemId();
       resumeInfoDTO.setResumePageUserId(userId);
       
//       model.addAttribute("userId", userId);
//       // user 의 이력서를 가져오는 로직 
//       List<ResumeInfoDTO> resumes = resumeInfoService.findAll();
//       // 이력서를 model 에 담아주는 로직 
//       model.addAttribute("resumes", resumes);
//       
       resumeInfoService.insert(resumeInfoDTO);
       return "redirect:/resume";
   }
}