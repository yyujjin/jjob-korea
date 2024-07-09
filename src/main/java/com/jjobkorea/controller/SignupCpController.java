package com.jjobkorea.controller;

import com.jjobkorea.entity.SignupCp;
import com.jjobkorea.service.SignupCpService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.List;

@Controller
public class SignupCpController {

    @Autowired
    private SignupCpService signupCpService;

    @GetMapping("/signupCpList")
    public String signupCpList(Model model) {
        List<SignupCp> signupCpList = signupCpService.findAll();
        model.addAttribute("signupCpList", signupCpList);
        return "signup-cp-list";
    }
}
