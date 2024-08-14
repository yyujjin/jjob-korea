package com.jjobkorea.controller;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.text.ParseException;
import java.util.Base64;
import java.util.List;
import java.util.UUID;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.jjobkorea.dto.ResumeInfoDTO;
import com.jjobkorea.service.ResumeInfoService;
import com.jjobkorea.service.UserSessionService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequiredArgsConstructor
public class ResumeController {
    
    private final ResumeInfoService resumeInfoService;
    
    private final UserSessionService userSessionService; 
    // 이력서 메인
    @GetMapping("/resume")
    public String resister(Model model) {
        log.info("@#hello");
        
        String userId = userSessionService.getUserId(); //아이디 가져오기
        userSessionService.getUserName(); //이름 가져오기
        
        List<ResumeInfoDTO> resumes = resumeInfoService.findByUserId(userId);
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
    public String resumeWrite(Model model) {
        log.info("@#resume_write");

        userSessionService.getUserId(); //아이디 가져오기
        userSessionService.getUserName(); //이름 가져오기
        
        model.addAttribute("resume_user_information", new ResumeInfoDTO());
        model.addAttribute("page", "resume_page/resume_write/resume_write");

        return "main/main";
    }

    // 이력서 저장 로직
    @PostMapping("/resume/create")
    public String addResume(@RequestParam("resumeProfilePhoto") MultipartFile file, @ModelAttribute ResumeInfoDTO resumeInfoDTO, Model model) throws ParseException {
        log.info("@#saveResume");

        String userId = userSessionService.getUserId(); //아이디 가져오기
        userSessionService.getUserName(); //이름 가져오기
        
        resumeInfoDTO.setResumePageUserId(userId);
        UUID uuid = UUID.randomUUID();

        // 필수 필드 유효성 검사
        if (resumeInfoDTO.getResumePageTitle() == null || resumeInfoDTO.getResumePageTitle().isEmpty()) {
            log.error("이력서가 존재하지 않습니다.");
            return "redirect:/resume"; // 에러 페이지로 리디렉션하거나 적절한 처리
        }

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
    public String editResume(@RequestParam("id") Long id, Model model) throws IOException {
        log.info("@#resume edit");
        
        String userId = userSessionService.getUserId(); //아이디 가져오기
        userSessionService.getUserName(); //이름 가져오기
        
        ResumeInfoDTO resumeInfoDTO = resumeInfoService.findByIdAndUserId(id, userId);
        
        String findPath = resumeInfoService.findPhotoByUserID(id);
      	 
        if (findPath != null) {
            byte[] imageBytes = Files.readAllBytes(Paths.get(findPath));
            String base64Image = Base64.getEncoder().encodeToString(imageBytes);
            model.addAttribute("image", base64Image);
            model.addAttribute("imageName", findPath);
        }
        
        model.addAttribute("resumeInfoDTO", resumeInfoDTO);

        return "resume_page/resume_edit";
    }
    // 이력서 수정 완료 업데이트 로직
    @PostMapping("/resume_write/edit")
    public String updateResume(@RequestParam("resumeId") MultipartFile file, @ModelAttribute ResumeInfoDTO resumeInfoDTO) {
        log.info("resumeUpdate");
        UUID uuid = UUID.randomUUID();
        
        String userId = userSessionService.getUserId(); //아이디 가져오기
        userSessionService.getUserName(); //이름 가져오기
        
        log.info("Received ID: {}", resumeInfoDTO.getId());
        // 필수 필드 유효성 검사
        if (resumeInfoDTO.getResumePageTitle() == null || resumeInfoDTO.getResumePageTitle().isEmpty()) {
            log.error("이력서가 존재하지 않습니다.");
            return "redirect:/resume"; // 에러 페이지로 리디렉션하거나 적절한 처리
        }
        ResumeInfoDTO existingResume = resumeInfoService.findByIdAndUserId(resumeInfoDTO.getId(), userId);
        if (existingResume == null) {
            log.error("존재하지 않는 이력서입니다.");
            return "redirect:/resume"; // 에러 페이지로 리디렉션하거나 적절한 처리
        }

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
        resumeInfoService.update(resumeInfoDTO);
        return "redirect:/resume";
    }
    // 이력서 삭제 로직
    @PostMapping("/resume/delete")
    public String delete(@RequestParam("id") Long id) {
    	log.info("@#delete");
    	String userId = userSessionService.getUserId(); //아이디 가져오기
        userSessionService.getUserName(); //이름 가져오기

    	resumeInfoService.delete(id, userId);
        
		return "redirect:/resume";
	}
    
}
