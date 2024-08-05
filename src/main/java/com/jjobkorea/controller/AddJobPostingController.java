package com.jjobkorea.controller;

import com.jjobkorea.dto.MemDTO;
import com.jjobkorea.entity.JobPostingDetail;
import com.jjobkorea.entity.SignupCp;
import com.jjobkorea.entity.SignupTb;
import com.jjobkorea.service.JobPostingDetailService;
import com.jjobkorea.service.JobPostingCpService;
import com.jjobkorea.service.JobPostingTbService;
import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

@Controller
@RequestMapping("/addJobPosting")
public class AddJobPostingController {

    private static final Logger log = LoggerFactory.getLogger(AddJobPostingController.class);
    @Autowired
    private JobPostingDetailService jobPostingDetailService;

    @Autowired
    private JobPostingCpService jobPostingCpService;

    @Autowired
    private JobPostingTbService jobPostingTbService;

    private static final String UPLOAD_DIR = "src/main/webapp/resources/img/jobPostingDetail/";

    /* 현재 이 메서드 안쓴느 걸로 보여짐
    public String showAddJobPostingForm(Model model, HttpSession session) {
        MemDTO user = (MemDTO) session.getAttribute("user");
        if (user != null) {
            Optional<SignupCp> signupCp = jobPostingCpService.getSignupCpById((long) user.getCpId());
            Optional<SignupTb> signupTb = jobPostingTbService.getSignupTbByMemId(user.getMemId());
            
            if (signupCp.isPresent()) {
                model.addAttribute("signupCp", signupCp.get());
            }
            if (signupTb.isPresent()) {
                model.addAttribute("signupTb", signupTb.get());
            }
        }
        model.addAttribute("jobPostingDetail", new JobPostingDetail());
        model.addAttribute("page","jobPostingDetails/addJobPosting");
        return "main/main";
    }*/

    @PostMapping
    public String saveJobPostingDetail(
            @Valid JobPostingDetail jobPostingDetail, 
            BindingResult result, 
            HttpSession session, 
            Model model,
            @RequestParam("additionalImages") List<MultipartFile> additionalImages) {

        if (result.hasErrors()) {
            MemDTO user = (MemDTO) session.getAttribute("user");
            if (user != null) {
                Optional<SignupCp> signupCp = jobPostingCpService.getSignupCpById((long) user.getCpId());
                Optional<SignupTb> signupTb = jobPostingTbService.getSignupTbByMemId(user.getMemId());

                if (signupCp.isPresent()) {
                    model.addAttribute("signupCp", signupCp.get());
                }
                if (signupTb.isPresent()) {
                    model.addAttribute("signupTb", signupTb.get());
                    jobPostingDetail.setMemName(signupTb.get().getMemName());
                    jobPostingDetail.setMemPhone(signupTb.get().getMemPhone());
                    jobPostingDetail.setMemEmail(signupTb.get().getMemEmail());
                }
            }
            return "jobPostingDetails/addJobPosting";
        }

        try {
            // 회사 로고 파일 저장
            MultipartFile companyLogo = jobPostingDetail.getCompanyLogo();
            if (companyLogo != null && !companyLogo.isEmpty()) {
                String logoFilename = saveFile(companyLogo);
                jobPostingDetail.setCompanyLogoPath(logoFilename);
            }

            // 채용 공고 이미지 파일 저장
            MultipartFile jobPostingImage = jobPostingDetail.getJobPostingImage();
            if (jobPostingImage != null && !jobPostingImage.isEmpty()) {
                String jobPostingImageFilename = saveFile(jobPostingImage);
                jobPostingDetail.setJobPostingImagePath(jobPostingImageFilename);
            }

            // 추가 이미지 파일 저장
            List<String> additionalImagePaths = new ArrayList<>();
            if (additionalImages != null && !additionalImages.isEmpty()) {
                for (MultipartFile additionalImage : additionalImages) {
                    if (!additionalImage.isEmpty()) {
                        String additionalImageFilename = saveFile(additionalImage);
                        additionalImagePaths.add(additionalImageFilename);
                    }
                }
            }
            jobPostingDetail.setAdditionalImagePaths(additionalImagePaths);

        } catch (IOException e) {
            e.printStackTrace();
            model.addAttribute("errorMessage", "파일 업로드 중 오류가 발생했습니다.");
            return "addJobPosting";
        }

        JobPostingDetail savedJobPostingDetail = jobPostingDetailService.saveJobPostingDetail(jobPostingDetail);
        return "redirect:/jobPostingDetails/" + savedJobPostingDetail.getId();
    }

    private String saveFile(MultipartFile file) throws IOException {
        String filename = System.currentTimeMillis() + "_" + file.getOriginalFilename();
        Path path = Paths.get(UPLOAD_DIR + filename);
        Files.createDirectories(path.getParent());
        Files.write(path, file.getBytes());
        return "/resources/img/jobPostingDetail/" + filename;
    }

    
}
