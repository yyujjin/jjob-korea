package com.jjobkorea.controller;

import java.io.File;
import java.io.IOException;
import java.net.MalformedURLException;
import java.net.URLEncoder;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.text.ParseException;
import java.util.List;
import java.util.UUID;

import com.jjobkorea.service.UserSessionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.io.InputStreamResource;
import org.springframework.core.io.Resource;
import org.springframework.core.io.UrlResource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.jjobkorea.dto.ResumeInfoDTO;
import com.jjobkorea.dto.UserDTO;
import com.jjobkorea.service.ResumeInfoService;

import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class ResumeController {
    @Autowired
    private ResumeInfoService resumeInfoService;
    // 이력서 메인
    @GetMapping("/resume")
    public String resister(Model model, HttpSession session) {
        log.info("@#hello");
        
        if(session.getAttribute("user") == null) {
            log.info("로그인이 안됐습니다.");
            return "redirect:/login";
        }
        
        // 저장된 이력서 가져오는 로직 
        UserDTO user = (UserDTO) session.getAttribute("user");
        String userId = user.getUserId();
        List<ResumeInfoDTO> resumes = resumeInfoService.findByUserId(userId);
        System.out.println("@#@##@#@#@#@#@#@#@#@############################" + resumes);
        model.addAttribute("resumes", resumes);
        
        for(ResumeInfoDTO test : resumes) {
            log.info("Resume birth date: {}", test.getResumeBirthDay());
        }

        model.addAttribute("userId", userId);
        model.addAttribute("page", "resume_page/resume_page");

        return "main/main";
    }
    
    // 이력서 작성 페이지 로직
    @GetMapping("/resume/create")
    public String resumeWrite(Model model, HttpSession session) {
        log.info("@#resume_write");

        if(session.getAttribute("user") == null) {
            return "redirect:/login";
        }

        model.addAttribute("resume_user_information", new ResumeInfoDTO());
        model.addAttribute("page", "resume_page/resume_write/resume_write");

        return "main/main";
    }

    // 이력서 저장 로직
    @PostMapping("/resume/create")
    public String addResume(@ModelAttribute ResumeInfoDTO resumeInfoDTO, HttpSession session, Model model) throws ParseException {
        log.info("@#saveResume");

        if (session.getAttribute("user") == null) {
            return "redirect:/login";
        }

        UserDTO user = (UserDTO) session.getAttribute("user");
        String userId = user.getUserId();
        resumeInfoDTO.setResumePageUserId(userId);
        UUID uuid = UUID.randomUUID();

        // 필수 필드 유효성 검사
        if (resumeInfoDTO.getResumePageTitle() == null || resumeInfoDTO.getResumePageTitle().isEmpty()) {
            log.error("이력서가 존재하지 않습니다.");
            return "redirect:/resume"; // 에러 페이지로 리디렉션하거나 적절한 처리
        }

        // MultipartFile 설정
        MultipartFile file = resumeInfoDTO.getResumeProfilePhoto();
        if (file != null && !file.isEmpty()) {
            try {
                String fileName = uuid+"_"+file.getOriginalFilename();
                String filePath = "D:\\dev\\upload\\" + fileName; // 실제 저장 경로로 변경
                File dest = new File(filePath);
                file.transferTo(dest);
                resumeInfoDTO.setResumeFilePath(filePath);
            } catch (IOException e) {
                log.error("파일을 저장하지 못했습니다.", e);
            }
        }
        resumeInfoService.insert(resumeInfoDTO);
        return "redirect:/resume";
    }

//     이력서 수정 페이지 접속 로직
    @GetMapping("/resume_write/edit")
    public String editResume(@RequestParam("id") Long id, Model model, HttpSession session) {
        log.info("@#resume edit");
        
        if (session.getAttribute("user") == null) {
            return "redirect:/login";
        }

        UserDTO user = (UserDTO) session.getAttribute("user");
        ResumeInfoDTO resumeInfoDTO = resumeInfoService.findByIdAndUserId(id, user.getUserId());
        
        if (resumeInfoDTO == null) {
            return "redirect:/resume";
        }

        model.addAttribute("resumeInfoDTO", resumeInfoDTO);
        model.addAttribute("resumeInfoDTO", "resume_page/resume_edit");

        return "main/main";
    }
    // 이력서 수정 완료 업데이트 로직
    @PostMapping("/resume_write/edit")
    public String updateResume(@ModelAttribute ResumeInfoDTO resumeInfoDTO, HttpSession session) {
        log.info("resumeUpdate");
        UUID uuid = UUID.randomUUID();
        if (session.getAttribute("user") == null) {
            return "redirect:/login";
        }

        UserDTO user = (UserDTO) session.getAttribute("user");
        resumeInfoDTO.setResumePageUserId(user.getUserId());
        log.info("Received ID: {}", resumeInfoDTO.getId());
        // 필수 필드 유효성 검사
        if (resumeInfoDTO.getResumePageTitle() == null || resumeInfoDTO.getResumePageTitle().isEmpty()) {
            log.error("이력서가 존재하지 않습니다.");
            return "redirect:/resume"; // 에러 페이지로 리디렉션하거나 적절한 처리
        }
        ResumeInfoDTO existingResume = resumeInfoService.findByIdAndUserId(resumeInfoDTO.getId(), user.getUserId());
        if (existingResume == null) {
            log.error("존재하지 않는 이력서입니다.");
            return "redirect:/resume"; // 에러 페이지로 리디렉션하거나 적절한 처리
        }

        MultipartFile file = resumeInfoDTO.getResumeProfilePhoto();
        if (file != null && !file.isEmpty()) {
            try {
            	String fileName = uuid+"_"+file.getOriginalFilename();
                String filePath = "D:\\dev\\upload\\" + fileName; // 실제 저장 경로로 변경
                File dest = new File(filePath);
                file.transferTo(dest);
                resumeInfoDTO.setResumeFilePath(filePath);
            } catch (IOException e) {
                log.error("파일을 저장하지 못했습니다.", e);
            }
        }else {
            // 새로운 파일이 업로드되지 않았으면 기존 파일 경로를 유지합니다.
            resumeInfoDTO.setResumeFilePath(existingResume.getResumeFilePath());
        }
        System.out.println("file값이 들어오는가?"+file);
        System.out.println("file값이 들어오는가?"+file);
        System.out.println("file값이 들어오는가?"+file);
        System.out.println("file값이 들어오는가?"+file);
        System.out.println("file값이 들어오는가?"+file);
       
        resumeInfoService.update(resumeInfoDTO);
        return "redirect:/resume";
    }
    // 이력서 삭제 로직
    @PostMapping("/resume/delete")
    public String delete(@RequestParam("id") Long id, HttpSession session) {
    	log.info("@#delete");
    	UserDTO userId = (UserDTO) session.getAttribute("user");
    	
    	if (userId == null) {
            return "redirect:/login";
        }
    	resumeInfoService.delete(id, userId.getUserId());
        
		return "redirect:/resume";
	}
    
}
