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
import org.springframework.web.bind.annotation.ResponseBody;

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
    public String login_yn(@RequestParam HashMap<String, String> param, HttpServletRequest request, Model model) {
        log.info("@# login_yn");
        ArrayList<MemDTO> user = service.loginYn(param);

        // 아이디로 사용자를 찾을 수 없는 경우
        if (user.isEmpty()) {
            log.info("사용자를 찾을 수 없습니다.");
            return "redirect:login?error=true";
        }

        MemDTO foundUser = user.get(0);

        // 입력된 비밀번호가 데이터베이스에 저장된 비밀번호와 일치하는지 확인
        if (!foundUser.getMemPwd().equals(param.get("memPwd"))) {
            log.info("비밀번호가 일치하지 않습니다.");
            return "redirect:login?error=true";
        }

        // 세션에 사용자 정보 저장
        HttpSession session = request.getSession();
        session.setAttribute("user", foundUser);
        return "redirect:main";
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
    
    @PostMapping("/checkId")
    @ResponseBody
    public Map<String, Boolean> checkId(@RequestParam("memId") String memId) {
        Map<String, Boolean> response = new HashMap<>();
        response.put("exists", signupService.isMemIdExists(memId));
        return response;
    }

    @PostMapping("/registerOk")
    public String registerOk(@RequestParam Map<String, String> params, Model model) {
        log.info("Received parameters: " + params);

        log.info("memAddr: " + params.get("memAddr"));

        if (params.get("memAddr") == null || params.get("memAddr").isEmpty()) {
            log.error("회원 주소가 누락되었습니다.");
            model.addAttribute("error", "회원 주소가 누락되었습니다.");
            return "MemLogin/register";
        }

        if ("individual".equals(params.get("type"))) {
            if (params.get("memBirth") == null || params.get("memBirth").isEmpty()) {
                log.error("회원 생년월일이 누락되었습니다.");
                model.addAttribute("error", "회원 생년월일이 누락되었습니다.");
                return "MemLogin/register";
            }
            if (params.get("memGender") == null || params.get("memGender").isEmpty()) {
                log.error("회원 성별이 누락되었습니다.");
                model.addAttribute("error", "회원 성별이 누락되었습니다.");
                return "MemLogin/register";
            }
        }

        try {
            // 중복된 ID 확인
            if (signupService.isMemIdExists(params.get("memId"))) {
                log.error("이미 존재하는 아이디입니다.");
                model.addAttribute("error", "이미 존재하는 아이디입니다.");
                return "MemLogin/register";
            }

            signupService.registerEnterprise(params);
            return "MemLogin/registerOk";
        } catch (IllegalArgumentException e) {
            log.error("회원가입 중 오류 발생: " + e.getMessage());
            model.addAttribute("error", e.getMessage());
            return "MemLogin/register";
        }
    }

    @RequestMapping("/logout")
    public String logout(HttpSession session) {
        log.info("@# logout");
        session.invalidate();  // 세션 무효화
//        return "redirect:login";  // 로그인 페이지로 리디렉션
        return "redirect:main";  // 메인 페이지로 리디렉션
    }
}
