package com.jjobkorea.controller;

import java.util.List;
import com.jjobkorea.dto.CompanyDTO;
import com.jjobkorea.service.UserService;
import com.jjobkorea.service.UserSessionService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.jjobkorea.dto.JobPostingDTO;
import com.jjobkorea.service.JobPostingService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.RequestParam;

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
    
    // 채용 정보 리스트
    @GetMapping("jobPosts")
    public String enterJobPosting(@RequestParam (value = "pageNum", required = false, defaultValue = "1") String pageNum, Model model) {

        List<JobPostingDTO> postingList = jobPostingService.getPostingList( Integer.parseInt(pageNum));
        model.addAttribute("postingList", postingList);
        model.addAttribute("page", "jobPosting/jobPostingMain");

        return "main/main";
    }

    //공고 등록 페이지
    @GetMapping("/jobPost/create")
    public String addpostingwrite(Model model) {
    	log.info("공고등록model", model);
  	
        model.addAttribute("page","jobPosting/addJobPosting");

        return "main/main";
    }
    
    // 공고 등록 처리 (POST 요청)
    @PostMapping("/jobPost/create")
    public String createJobPost(JobPostingDTO jobPostingDTO) {
        log.info("공고 등록: {}", jobPostingDTO);

        //컴퍼니 아이디 가져오기
        int companyId = userService.getCompanyId( userSessionService.getUserId());
        log.info("컴퍼니 아이디 : {} ",companyId);

        // 공고 등록
       jobPostingService.addpostingwrite(jobPostingDTO,companyId);

        // 공고 등록 후 성공 페이지로 리다이렉트
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
