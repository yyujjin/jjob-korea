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
import com.jjobkorea.dto.CompanyDTO;
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

    public JobPostingController(JobPostingService jobPostingService, UserSessionService userSessionService, UserService userService) {
        this.jobPostingService = jobPostingService;
        this.userSessionService = userSessionService;
        this.userService = userService;
    }
    
    @Autowired
    private AmazonS3 amazonS3;
    private final String bucketName= "teamserverfolder";

   
    // 채용 정보 리스트
    @GetMapping("jobPosts")

    public String enterJobPosting(@RequestParam (value = "pageNum", required = false, defaultValue = "1") String pageNum, Model model) {

        List<JobPostingDTO> postingList = jobPostingService.getPostingList( Integer.parseInt(pageNum));
        model.addAttribute("postingList", postingList);
        model.addAttribute("page", "jobPosting/jobPostingMain");

        return "main/main";
    }

 // 공고 등록 페이지
    @GetMapping("/jobPost/create")
    public String addpostingwrite(Model model) {
    	log.info("공고등록model", model);
  	
        model.addAttribute("page","jobPosting/addJobPosting");


        return "main/main";
    }
    
    
    public String UploadS3(MultipartFile file) throws IOException {
    	String fileName = UUID.randomUUID() + "_" + file.getOriginalFilename(); 
    	 ObjectMetadata objectMetadata = new ObjectMetadata();
         objectMetadata.setContentType(file.getContentType());
         objectMetadata.setContentLength(file.getSize()); // 파일의 크기 설정
         
         // InputStream으로 파일을 읽어들임
         try (InputStream inputStream = file.getInputStream()) {
             PutObjectRequest putObjectRequest = new PutObjectRequest(bucketName, fileName, inputStream, objectMetadata);
             amazonS3.putObject(putObjectRequest);
         }

         return amazonS3.getUrl(bucketName, fileName).toString(); // S3 URL 반환
    }

    // 공고 등록 처리 (POST 요청) - 이미지 업로드 포함
    @PostMapping("/jobPost/create")
    public String createJobPost(JobPostingDTO jobPostingDTO)
//                                @RequestParam("jobPostingUploadPath") MultipartFile file) throws IOException {
    {
        log.info("공고 등록 시작: {}", jobPostingDTO);
        
        //컴퍼니 아이디 가져오기
        int companyId = userService.getCompanyId(userSessionService.getUserId());
        log.info("컴퍼니 아이디 : {} ",companyId);
        
//        if(file != null && !file.isEmpty()) {
//        	String fileName = UploadS3(file);
//        	jobPostingDTO.setJobPostingFilePath(fileName);
//        }
//
        jobPostingService.addpostingwrite(jobPostingDTO,companyId);
        return "redirect:/jobPosts";
    } 
    
    //공고 상세보기 페이지
    @GetMapping ("/jobPosting")
    public String view_jobPosting (@RequestParam (value = "companyId") int companyId,
                                   @RequestParam (value = "id") int id,
                                   Model model) {

        CompanyDTO companyDTO = new CompanyDTO();
        companyDTO.setId(companyId);

        //조회수 증가
        jobPostingService.updateHit(id);

        model.addAttribute("company",jobPostingService.getCompanyInfo(companyId));
        model.addAttribute("jobPosting",jobPostingService.getJobPosting(id));
        model.addAttribute("page","jobPosting/view-jobPosting");
        return "main/main";
    }
}
