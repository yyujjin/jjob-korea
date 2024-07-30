package com.jjobkorea.controller;

import com.jjobkorea.dto.UserDTO;
import com.jjobkorea.service.UserService;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
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
    public String login(UserDTO userDTO, Model model, HttpServletRequest request) {

        Optional<UserDTO> optionalUser = Optional.ofNullable(userDTO);

        if(optionalUser.isPresent()) {
            UserDTO isAuthenticated = userService.login(userDTO);
            if (isAuthenticated==null) {
                model.addAttribute("page",showLoginPage());
                return "main/main";
            }
            HttpSession session = request.getSession();
            session.setAttribute("user",isAuthenticated.getName() );
            String username = (String) session.getAttribute("user");
            log.info("사용자 세션 :{} ",username);
        }else {
            model.addAttribute("page",showLoginPage());
            return "main/main";
        }

        return "redirect:/";
    }
}
