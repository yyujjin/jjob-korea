package com.jjobkorea.controller;

import java.io.IOException;
import java.io.InputStream;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.Proxy;
import java.net.URL;
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

import com.amazonaws.services.s3.AmazonS3;
import com.amazonaws.services.s3.model.ObjectMetadata;
import com.amazonaws.services.s3.model.PutObjectRequest;
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
    private final AmazonS3 amazonS3;
    private final String bucketName= "teamserverfolder";
    private final UserSessionService userSessionService; 
    // 이력서 메인
    @GetMapping("/resume")
    public String resister(Model model ) {
        log.info("@#hello");
        
        // 현재 사용자의 ID 가져오기
        String userId = userSessionService.getUserId(); //아이디 가져오기
        userSessionService.getUserName(); //이름 가져오기
        
        List<ResumeInfoDTO> resumes = resumeInfoService.findByUserId(userId);
        model.addAttribute("resumes", resumes);
        
        for(ResumeInfoDTO test : resumes) {
            log.info("생년월일 : {}", test.getResumeBirthDay());
        }

        model.addAttribute("userId", userId);
        model.addAttribute("page", "resume_page/resume_page");

        return "main/main";
    }
    
    // 이력서 작성 페이지 로직
    @GetMapping("/resume/create")
    public String resumeWrite(Model model) {
        log.info("@#resume_write");

        userSessionService.getUserId(); 
        userSessionService.getUserName(); 
        
        model.addAttribute("resume_user_information", new ResumeInfoDTO());
        model.addAttribute("page", "resume_page/resume_write/resume_write");

        return "main/main";
    }

    // 이력서 저장 로직
    @PostMapping("/resume/create")
    public String addResume(@RequestParam("resumeProfilePhoto") MultipartFile file, @ModelAttribute ResumeInfoDTO resumeInfoDTO, Model model) throws ParseException, IOException {
        log.info("@#saveResume");
        String userId = userSessionService.getUserId(); //아이디 가져오기
        userSessionService.getUserName(); //이름 가져오기
        
        resumeInfoDTO.setResumePageUserId(userId);

        // 필수 필드 유효성 검사
        if (resumeInfoDTO.getResumePageTitle() == null || resumeInfoDTO.getResumePageTitle().isEmpty()) {
            log.error("이력서가 존재하지 않습니다.");
            return "redirect:/resume"; // 에러 페이지로 리디렉션하거나 적절한 처리
        }

        if (file != null && !file.isEmpty()) {
            String fileName = uploadFileToS3Bucket(file);
            resumeInfoDTO.setResumeFilePath(fileName);
        }
        resumeInfoService.insert(resumeInfoDTO);
        return "redirect:/resume";
    }
    
    
    private String uploadFileToS3Bucket(MultipartFile file) throws IOException {
        String fileName = UUID.randomUUID() + "_" + file.getOriginalFilename();
        
        // 메타데이터 생성 및 설정
        ObjectMetadata objectMetadata = new ObjectMetadata();
        objectMetadata.setContentType(file.getContentType());
        objectMetadata.setContentLength(file.getSize()); // 파일의 크기 설정
        
        // InputStream으로 파일을 읽어들임
        try (InputStream inputStream = file.getInputStream()) {
            PutObjectRequest putObjectRequest = new PutObjectRequest(bucketName, fileName, inputStream, objectMetadata);
            amazonS3.putObject(putObjectRequest);
        }
        String fileUrl = amazonS3.getUrl(bucketName, fileName).toString();
        log.info("fileUrl 로 파일이 업로드 되었습니다."+fileUrl);
        return fileUrl; // S3 URL 반환
    }
    
    
//     이력서 수정 페이지 접속 로직
    @SuppressWarnings("deprecation")
	@GetMapping("/resume_write/edit")
    public String editResume(@RequestParam("id") Long id, Model model, ResumeInfoDTO resumeInfoDTO) throws IOException {
        log.info("@#resume edit");
        
        String userId = userSessionService.getUserId(); //아이디 가져오기
        userSessionService.getUserName(); //이름 가져오기
        
        resumeInfoDTO = resumeInfoService.findByIdAndUserId(id, userId);
   
        log.info("loaded ResumeInfoDTO: {}", resumeInfoDTO);
        String findPath = resumeInfoService.findPhotoByUserID(id);
        
        if (findPath != null) {
        	if(!findPath.startsWith("https://") && !findPath.startsWith("https://")) {
        		findPath = "https:" + findPath;
        	}
        	try {
        		URL url = new URL(findPath);
        		HttpURLConnection connection = (HttpURLConnection) url.openConnection(Proxy.NO_PROXY);
        		connection.setRequestMethod("GET");
        	    connection.connect();
        		try(InputStream in = connection.getInputStream()) {
	    			byte[] imageBytes = in.readAllBytes();
		            String base64Image = Base64.getEncoder().encodeToString(imageBytes);
		            model.addAttribute("image", base64Image);
		            model.addAttribute("imageName", findPath);
        		}
			} catch (MalformedURLException e) {
				log.error("이미지 파일을 로드하는데 실패하였습니다.", e);
			}
        }
        model.addAttribute("resumeInfoDTO", resumeInfoDTO);

        return "resume_page/resume_edit";
    }
    
    
    // 이력서 수정 완료 업데이트 로직
    @PostMapping("/resume_write/edit")
    public String updateResume(@RequestParam("id") Long id,
                               @RequestParam(value = "resumeProfilePhoto", required = false) MultipartFile file,
                               @ModelAttribute ResumeInfoDTO resumeInfoDTO) throws IOException {
        log.info("Updating resume with ID: {}", id);

        // 현재 사용자의 ID 가져오기
        String userId = userSessionService.getUserId();
        ResumeInfoDTO existingResume = resumeInfoService.findByIdAndUserId(id, userId);
        
        if (existingResume == null) {
            log.error("ID가 {}인 이력서는 사용자 {}에게 존재하지 않습니다.", id, userId);
            return "redirect:/resume"; // 에러 페이지로 리디렉션하거나 적절한 처리
        }
        
        // 파일 업로드 처리 및 경로 설정
        if (file != null && !file.isEmpty()) {
            String newFileName = uploadFileToS3Bucket(file);
            resumeInfoDTO.setResumeFilePath(newFileName);
        } else {
            // 파일이 업로드되지 않은 경우 기존 파일 경로 유지
        	
            resumeInfoDTO.setResumeFilePath(existingResume.getResumeFilePath());
        }
        
        // 사용자 ID 설정
        resumeInfoDTO.setResumePageUserId(userId);
        resumeInfoService.update(resumeInfoDTO);

        return "redirect:/resume";
    }

    // 이력서 삭제 로직
    @PostMapping("/resume/delete")
    public String delete(@RequestParam("id") Long id) {
    	log.info("@#delete");
    	
    	// 현재 사용자의 ID 가져오기
    	String userId = userSessionService.getUserId(); 
        userSessionService.getUserName(); 
        
        ResumeInfoDTO resumeInfoDTO = resumeInfoService.findByIdAndUserId(id, userId);
        if (resumeInfoDTO != null && resumeInfoDTO.getResumeFilePath() != null) {
            amazonS3.deleteObject(bucketName, resumeInfoDTO.getResumeFilePath());
        }

    	resumeInfoService.delete(id, userId);
		return "redirect:/resume";
	}
}
}