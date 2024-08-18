package com.jjobkorea.controller;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.jjobkorea.dto.JobPostingDTO;
import com.jjobkorea.service.JobPostingService;
import com.jjobkorea.service.SaveImageService;
import com.jjobkorea.service.UploadImageService;
import com.jjobkorea.service.UserSessionService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class JobPostingController {

    private final JobPostingService jobPostingService;
    private final UploadImageService uploadImageService;
    private final SaveImageService saveImageService;

    @Autowired
    public JobPostingController(JobPostingService jobPostingService, 
                                UserSessionService userSessionService,
                                UploadImageService uploadImageService, 
                                SaveImageService saveImageService) {
        this.jobPostingService = jobPostingService;
        this.uploadImageService = uploadImageService;
        this.saveImageService = saveImageService;
    }

    // 채용 정보 리스트
    @GetMapping("jobPosts")
    public String enterJobPosting(@RequestParam(value = "pageNum", required = false, defaultValue = "1") String pageNum, Model model) {
        log.info("요청받은 페이지: {}", pageNum);

        List<JobPostingDTO> postingList = jobPostingService.getPostingList(Integer.parseInt(pageNum));
        model.addAttribute("postingList", postingList);
        model.addAttribute("page", "jobPosting/jobPostingMain");

        return "main/main";
    }

 // 공고 등록 페이지
    @GetMapping("/jobPost/create")
    public String addpostingwrite(Model model) {
        log.info("공고 등록 페이지 진입");
        model.addAttribute("page", "jobPostingDetails/addJobPosting");
        return "main/main";
    }

    // 공고 등록 처리 (POST 요청) - 이미지 업로드 포함
    @PostMapping("/jobPost/create")
    public String createJobPost(JobPostingDTO jobPostingDTO, 
                                @RequestParam("imageFile") MultipartFile file) {
        log.info("공고 등록 시작: {}", jobPostingDTO);

        try {
            // Step 1: Save the file to local storage temporarily
            String localFilePath = saveFileLocally(file);
            log.info("파일이 로컬에 저장됨: {}", localFilePath);

            // Step 2: Upload image to S3
            String imageUrl = uploadImageService.uploadImage(localFilePath);
            log.info("이미지가 S3에 업로드됨: {}", imageUrl);

            if (imageUrl != null) {
                // Step 3: Save image URL to RDS
                saveImageService.saveImageUrl(imageUrl);
                log.info("이미지 URL이 RDS에 저장됨: {}", imageUrl);

                // Step 4: 공고 등록 처리 로직 (예: DB 저장)
                jobPostingDTO.setPostingImage(imageUrl);
                jobPostingService.addpostingwrite(jobPostingDTO);
                log.info("공고 등록 완료: {}", jobPostingDTO);

                // 공고 등록 후 성공 페이지로 리다이렉트
                return "redirect:/jobPosts";
            } else {
                log.error("이미지 업로드 실패");
                // 이미지 업로드 실패 시 에러 페이지로 리다이렉트
                return "redirect:/error";
            }
        } catch (Exception e) {
            log.error("공고 등록 중 오류 발생", e);
            // 예외 발생 시 에러 페이지로 리다이렉트
            return "redirect:/error";
        }
    }


    // 공고 상세보기 페이지
    @GetMapping("/jobPosting")
    public String view_jobPosting(@RequestParam(value = "companyId") int companyId, Model model) {
        model.addAttribute("company", jobPostingService.getCompanyInfo(companyId));
        model.addAttribute("jobPosting", jobPostingService.getJobPosting(companyId));
        model.addAttribute("page", "jobPosting/view-jobPosting");
        return "main/main";
    }

    private String saveFileLocally(MultipartFile file) {
        // 저장할 디렉토리 경로 설정
        String uploadDir = "uploads";  // 프로젝트 루트에 uploads 디렉토리가 생성됨

        // 디렉토리가 존재하지 않으면 생성
        File directory = new File(uploadDir);
        if (!directory.exists()) {
            directory.mkdirs();
        }

        // 원본 파일명 가져오기
        String originalFilename = file.getOriginalFilename();
        if (originalFilename == null) {
            throw new RuntimeException("파일 이름을 가져올 수 없습니다.");
        }

        // 파일을 저장할 경로 설정
        String filePath = Paths.get(uploadDir, originalFilename).toString();

        try {
            // 파일을 지정된 경로에 저장
            Path destinationPath = Paths.get(filePath);
            Files.copy(file.getInputStream(), destinationPath);

            // 저장된 파일 경로 반환
            return filePath;
        } catch (IOException e) {
            throw new RuntimeException("파일 저장 중 오류가 발생했습니다.", e);
        }
    }
}
