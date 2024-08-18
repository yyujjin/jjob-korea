package com.jjobkorea.controller;

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
import com.jjobkorea.service.JobPostingService.SaveImageService;
import com.jjobkorea.service.JobPostingService.UploadImageService;
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
        log.info("공고등록model", model);
        model.addAttribute("page", "jobPostingDetails/addJobPosting");

        return "main/main";
    }

    // 공고 등록 처리 (POST 요청) - 이미지 업로드 포함
    @PostMapping("/jobPost/create")
    public String createJobPost(JobPostingDTO jobPostingDTO, 
                                @RequestParam("imageFile") MultipartFile file) {
        log.info("공고 등록: {}", jobPostingDTO);

        // Step 1: Save the file to local storage temporarily
        String localFilePath = saveFileLocally(file);

        // Step 2: Upload image to S3
        String imageUrl = uploadImageService.uploadImage(localFilePath);

        if (imageUrl != null) {
            // Step 3: Save image URL to RDS
            saveImageService.saveImageUrl(imageUrl);

            // Step 4: 공고 등록 처리 로직 (예: DB 저장)
            jobPostingDTO.setPostingImage(imageUrl);
            jobPostingService.addpostingwrite(jobPostingDTO);

            // 공고 등록 후 성공 페이지로 리다이렉트
            return "redirect:/jobPosts";
        } else {
            // 이미지 업로드 실패 시 에러 페이지로 리다이렉트
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

    // 로컬에 파일 저장 로직 구현 (임시 저장)
    private String saveFileLocally(MultipartFile file) {
        // 파일을 로컬에 저장하는 로직을 구현하세요.
        // 파일 경로를 반환해야 합니다.
        return "localFilePath";  // 실제 구현 시 올바른 파일 경로를 반환해야 합니다.
    }
}
