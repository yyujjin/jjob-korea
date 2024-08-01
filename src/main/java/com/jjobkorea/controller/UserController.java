package com.jjobkorea.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Optional;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jjobkorea.dto.UserDTO;
import com.jjobkorea.service.UserService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class UserController {

    private static final Logger log = LoggerFactory.getLogger(UserController.class);
    public final UserService userService;
    
   

    public UserController(UserService userService) {
        this.userService = userService;
    }

    //로그인 페이지 로드
    @GetMapping("/login")
    public String showLoginPage() {

        return "user/login";
    }

    //로그인
    @PostMapping("/login")
    public String login(UserDTO userDTO, Model model, HttpServletRequest request) {

        Optional<UserDTO> optionalUser = Optional.ofNullable(userDTO);

        if (optionalUser.isPresent()) {
            UserDTO isAuthenticated = userService.login(userDTO);
            if (isAuthenticated == null) {
                model.addAttribute("page", showLoginPage());
                return "main/main";
            }
            HttpSession session = request.getSession();

            session.setAttribute("user", isAuthenticated);
            UserDTO user = (UserDTO) session.getAttribute("user");
            log.info("사용자 세션 :{} ", user);
        } else {
            model.addAttribute("page", showLoginPage());
            return "main/main";
        }

        return "redirect:/";
    }

    //로그아웃
    @GetMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate();  // 세션 무효화
        return "redirect:/";  // 로그인 페이지로 리디렉션
    }

    //회원가입 페이지 로드
    @RequestMapping("/register")
    public String register(Model model) {
        String page = "user/register";

        model.addAttribute("page", page);

        return "main/main";
    }

    //개인과 기업을 구분하여 회원가입
    @PostMapping("/registerOk")
    public String registerOk(@RequestParam HashMap<String, String> param, Model model) {
        if ("enterprise".equals(param.get("type"))) {
            userService.companyUser(param);
        } else {
            userService.registerUser(param);
        }
        return "user/registerOk";
    }

    // 아이디 중복 체크
    @PostMapping("/checkId")
    @ResponseBody
    public HashMap<String, Boolean> checkId(@RequestParam("userId") String userId) {
        HashMap<String, Boolean> response = new HashMap<>();
        response.put("exists", userService.userIdExists(new HashMap<String, String>() {{
            put("userId", userId);
        }}));
        return response;
    }
    
    //개인회원 정보 리스트
    @RequestMapping("/userInfo")
    public String userInfo(Model model){
    	
    	//임의 값
    	 String userId = "abcd";
    	
    	UserDTO userInfo = userService.userInfo(userId);
    	log.info("가져온 userInfo : {}",userInfo);
    	model.addAttribute("userInfo",userInfo);
    	
    	return "user/userInfo";
    }
}










