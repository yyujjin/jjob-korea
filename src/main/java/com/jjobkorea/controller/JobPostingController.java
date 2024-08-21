package com.jjobkorea.controller;

import java.io.IOException;
import java.io.InputStream;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.amazonaws.services.s3.AmazonS3;
import com.amazonaws.services.s3.model.ObjectMetadata;
import com.amazonaws.services.s3.model.PutObjectRequest;
import com.jjobkorea.dto.JobPostingDTO;
import com.jjobkorea.service.JobPostingService;
import com.jjobkorea.service.UserService;
import com.jjobkorea.service.UserSessionService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class JobPostingController {

    private final JobPostingService jobPostingService;
    private final UserSessionService userSessionService;
    private final UserService userService;

    @Autowired
    private AmazonS3 amazonS3;
    private final String bucketName = "teamserverfolder";

    public JobPostingController(JobPostingService jobPostingService, UserSessionService userSessionService, UserService userService) {
        this.jobPostingService = jobPostingService;
        this.userSessionService = userSessionService;
        this.userService = userService;
    }

    // 채용 정보 리스트
    @GetMapping("jobPosts")
    public String enterJobPosting(@RequestParam(value = "pageNum", required = false, defaultValue = "1") String pageNum, Model model) {
        List<JobPostingDTO> postingList = jobPostingService.getPostingList(Integer.parseInt(pageNum));
        model.addAttribute("postingList", postingList);
        model.addAttribute("page", "jobPosting/jobPostingMain");
        return "main/main";
    }

    // 공고 등록 페이지
    @GetMapping("/jobPost/create")
    public String addpostingwrite(Model model) {
        log.info("공고등록 페이지 진입: model={}", model);
        model.addAttribute("page", "jobPosting/addJobPosting");
        return "main/main";
    }

    // S3 파일 업로드
    private String uploadFileToS3(MultipartFile file) throws IOException {
        String fileName = UUID.randomUUID() + "_" + file.getOriginalFilename();
        ObjectMetadata metadata = new ObjectMetadata();
        metadata.setContentType(file.getContentType());
        metadata.setContentLength(file.getSize());

        try (InputStream inputStream = file.getInputStream()) {
            amazonS3.putObject(new PutObjectRequest(bucketName, fileName, inputStream, metadata));
        }

        return amazonS3.getUrl(bucketName, fileName).toString(); // S3에 저장된 파일의 URL 반환
    }

    // 공고 등록 처리 (POST 요청) - 이미지 업로드 포함
    @PostMapping("/jobPost/create")
    public String createJobPost(JobPostingDTO jobPostingDTO, @RequestParam("jobPostingUploadPath") MultipartFile file) throws IOException {
        log.info("공고 등록 시작: {}", jobPostingDTO);

        // 컴퍼니 아이디 가져오기
        int companyId = userService.getCompanyId(userSessionService.getUserId());
        log.info("컴퍼니 아이디: {}", companyId);

        // 파일이 있는 경우 S3에 업로드하고 파일 경로를 저장
        if (file != null && !file.isEmpty()) {
            String filePath = uploadFileToS3(file); // 파일을 S3에 업로드하고 URL을 반환
            jobPostingDTO.setJobPostingFilePath(filePath); // 반환된 URL을 DTO에 설정
        }

        jobPostingService.addpostingwrite(jobPostingDTO, companyId); // 공고 등록 처리
        return "redirect:/jobPosts";
    }

    // 공고 상세보기 페이지
    @GetMapping("/jobPosting")
    public String viewJobPosting(@RequestParam(value = "companyId") int companyId,
                                 @RequestParam(value = "id") int id,
                                 Model model) {

        // 조회수 증가
        jobPostingService.updateHit(id);

        // 공고 정보 가져오기
        JobPostingDTO jobPosting = jobPostingService.getJobPosting(id);
        
        // 모델에 데이터를 추가하여 뷰에서 사용할 수 있도록 설정
        model.addAttribute("company", jobPostingService.getCompanyInfo(companyId));
        model.addAttribute("jobPosting", jobPosting);
        model.addAttribute("page", "jobPosting/view-jobPosting");
        return "main/main";
    }
}
