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

import java.util.Optional;

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

        Optional<UserDTO> optionalUser = Optional.ofNullable(userDTO);

        if(optionalUser.isPresent()) {
            boolean isAuthenticated = userService.login(userDTO);
            if (isAuthenticated) {
                model.addAttribute("page",showLoginPage());
                return "main/main";
            } else {
                return "redirect:/";
            }
        }else {
            model.addAttribute("page",showLoginPage());
            return "main/main";
        }
    }
}
