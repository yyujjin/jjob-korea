package com.jjobkorea.controller;

import com.jjobkorea.dto.UserDTO;
import com.jjobkorea.service.UserService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class UserController {

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
    @GetMapping("/login")
    public String login(UserDTO userDTO) {
        String userName = userService.findUsernameByLoginInfo(userDTO);

        if (userName != null){ //로그인 성공
            return "main/main";
        }else { //로그인 실패
            return "redirect:user/login";
        }
    }
}
