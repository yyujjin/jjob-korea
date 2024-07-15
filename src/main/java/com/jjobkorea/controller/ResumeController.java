package com.jjobkorea.controller;

import java.io.File;
import java.io.IOException;
import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;

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

import com.jjobkorea.dto.ResumeInfoDTO;
import com.jjobkorea.service.ResumeInfoService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class ResumeController {
    @Autowired
    private ResumeInfoService resumeInfoService;
	@RequestMapping("/resume")
	public String resume(Model model) {
		log.info("@#hello");

		model.addAttribute("message", "핼로~");

		return "resume_page/resume_page";
	}

	// 메인에서 부를 경우 (샘플 용)
	//헤더 부분 주석처리
	//이력서 페이지 css, js 경로 상대경로로 걸려있던 거 ${pageContext.request.contextPath} 이용해서 절대 경로로 변경
	//변경한 코드에는 주석 달았음
	//해당 페이지 자체적으로 css가 걸려있어서 메인 css랑 충돌
	public String resister(Model model) {
		log.info("@#hello");

		model.addAttribute("message", "핼로~");

		String page = "resume_page/resume_page";
		model.addAttribute("page", page);
		return "main/main";
	}


   @GetMapping("/resume_write")
    public String resumeWrite(Model model) {
        log.info("@#resume_write");
        model.addAttribute("resume_user_information", new ResumeInfoDTO());
        return "resume_page/resume_write/resume_write";
    }
   
   @PostMapping("/resume_write")
   public String saveResume(
           @ModelAttribute ResumeInfoDTO resumeInfoDTO,	
           @RequestParam("resumeBirthDay") String resumeBirthDay,
           @RequestParam("resumeCpJoinDate") String resumeCpJoinDate,
           @RequestParam("resumeCpLeaveDate") String resumeCpLeaveDate) throws ParseException {

       log.info("@#saveResume");

       // Convert String to java.util.Date
       SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");

       // MultipartFile 설정
       MultipartFile file = resumeInfoDTO.getResumeProfilePhoto();
       if (file != null && !file.isEmpty()) {
           try {
               String fileName = file.getOriginalFilename();
               String filePath = "D:\\dew\\upload" + fileName; // 실제 저장 경로로 변경
               File dest = new File(filePath);
               file.transferTo(dest);
           } catch (IOException e) {
               log.error("Failed to save file", e);
           }
       }

       resumeInfoService.insert(resumeInfoDTO);
       return "redirect:/resume_write";
   }
}