package com.jjobkorea.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.jjobkorea.dto.MemDTO;
import com.jjobkorea.service.MemService;
import com.jjobkorea.service.MemSignupService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
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
        
        String page = "MemLogin/login";
        model.addAttribute("page", page);

        return "main/main";
    }

    @PostMapping("/login_yn")
    public String login_yn(@RequestParam HashMap<String, String> param, HttpServletRequest request) {
        log.info("@# login_yn");
        ArrayList<MemDTO> user = service.loginYn(param);
        if (user.isEmpty()) {
            return "redirect:login";
        } else {
            HttpSession session = request.getSession();
            session.setAttribute("user", user.get(0));  // user 리스트의 첫 번째 요소를 세션에 저장
            return "redirect:main";
        }
    }
    
    @RequestMapping("/main")
    public String main(HttpSession session, Model model) {
        log.info("@# main");
        MemDTO user = (MemDTO) session.getAttribute("user");
        if (user != null) {
            model.addAttribute("memName", user.getMemName());
        }
        return "main/main";
    }
    
    @RequestMapping("/login_ok")
    public String login_ok(HttpSession session, Model model) {
        log.info("@# login_ok");
        MemDTO user = (MemDTO) session.getAttribute("user");
        if (user != null) {
            model.addAttribute("memName", user.getMemName());
        }
        return "login_ok";
    }

    @RequestMapping("/register")
    public String register(Model model) {
        log.info("@# register");

        String page = "MemLogin/register";
        model.addAttribute("page", page);

        return "main/main";
    }

    @PostMapping("/registerOk")
    public String registerOk(@RequestParam Map<String, String> params, Model model) {
        log.info("Received parameters: " + params);

        log.info("memAddr: " + params.get("memAddr"));

        if (params.get("memAddr") == null || params.get("memAddr").isEmpty()) {
            log.error("회원 주소가 누락되었습니다.");
            throw new IllegalArgumentException("회원 주소가 누락되었습니다.");
        }

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
    
    // 로그아웃 메서드 추가
    @RequestMapping("/logout")
    public String logout(HttpSession session) {
        log.info("@# logout");
        session.invalidate();  // 세션 무효화
        return "redirect:login";  // 로그인 페이지로 리디렉션
    }
}
