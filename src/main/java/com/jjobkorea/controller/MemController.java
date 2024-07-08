package com.jjobkorea.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.jjobkorea.service.MemService;
import com.jjobkorea.service.MemSignupService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class MemController {
    @Autowired
    private MemService service;
    @Autowired
    private MemSignupService signupService;

    @RequestMapping("/login")
    public String login(Model model) {
        log.info("@# login");
        
     // "MemLogin/login" 페이지 경로를 모델에 추가하여 뷰에서 사용할 수 있도록 함
        String page = "MemLogin/login";
        model.addAttribute("page", page);

     // 메인 페이지로 이동
        return "main/main";
    }

    @RequestMapping("/login_yn")
    public String login_yn(@RequestParam HashMap<String, String> param) {
        log.info("@# login_yn");
        return service.loginYn(param).isEmpty() ? "redirect:login" : "redirect:login_ok";
    }

    @RequestMapping("/login_ok")
    public String login_ok() {
        log.info("@# login_ok");
        return "login_ok";
    }

    @RequestMapping("/register")
    public String register(@RequestParam("type") String type, Model model) {
        log.info("@# register");
        model.addAttribute("type", type);
        return "register";
    }

    @PostMapping("/registerOk")
    public String registerOk(@RequestParam Map<String, String> params, Model model) {
        log.info("Received parameters: " + params);

        // memAddr 값 로그로 출력
        log.info("memAddr: " + params.get("memAddr"));

        // memAddr 검증
        if (params.get("memAddr") == null || params.get("memAddr").isEmpty()) {
            log.error("회원 주소가 누락되었습니다.");
            throw new IllegalArgumentException("회원 주소가 누락되었습니다.");
        }

        // 개인회원일 경우 memBirth와 memGender 검증
        if ("individual".equals(params.get("type"))) {
            if (params.get("memBirth") == null || params.get("memBirth").isEmpty()) {
                log.error("회원 생년월일이 누락되었습니다.");
                throw new IllegalArgumentException("회원 생년월일이 누락되었습니다.");
            }
            if (params.get("memGender") == null || params.get("memGender").isEmpty()) {
                log.error("회원 성별이 누락되었습니다.");
                throw new IllegalArgumentException("회원 성별이 누락되었습니다.");
            }
        }

        signupService.registerEnterprise(params);
        return "registerOk";
    }
}
