package com.jjobkorea.controller;

import com.jjobkorea.entity.JobPostingDetail;
import com.jjobkorea.entity.SignupCp;
import com.jjobkorea.service.JobPostingCpService;
import com.jjobkorea.service.JobPostingDetailService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
public class JobPostingDetailController {

    @Autowired
    private JobPostingCpService jobPostingCpService;

    @Autowired
    private JobPostingDetailService jobPostingDetailService;

  
}
