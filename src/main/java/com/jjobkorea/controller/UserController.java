package com.jjobkorea.controller;

import com.jjobkorea.dto.UserDTO;
import com.jjobkorea.service.UserService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.boot.Banner;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

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
    public String login(UserDTO userDTO, Model model) {
        log.info("넘어온 userDTO : {}",userDTO);
        UserDTO userName = userService.login(userDTO);

        if (userName != null){ //로그인 성공
            return "redirect:/";
        }else { //로그인 실패
            model.addAttribute("page","user/login");
            return "main/main";
        }
    }
}
