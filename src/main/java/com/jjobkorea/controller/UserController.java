package com.jjobkorea.controller;

import java.util.HashMap;
import java.util.Map;
import java.util.Optional;

import com.jjobkorea.service.UserSessionService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import com.jjobkorea.dto.UserDTO;
import com.jjobkorea.service.UserService;

@Controller
public class UserController {

    private static final Logger log = LoggerFactory.getLogger(UserController.class);
    public final UserService userService;
    public final UserSessionService userSessionService;

    public UserController(UserService userService, UserSessionService userSessionService) {
        this.userService = userService;
        this.userSessionService = userSessionService;
    }

    //로그인 페이지 로드
    @GetMapping("/login")
    public String showLoginPage(Model model) {

        model.addAttribute("page","user/login");
        return "main/main";
    }

    //로그아웃
    @GetMapping("/logout")
    public String logout() {
        return "redirect:/";  // 로그인 페이지로 리디렉션
    }

    //회원가입 페이지 로드
    @GetMapping("/register")
    public String register(Model model) {
        model.addAttribute("page", "user/register");
        return "main/main";
    }
    
    @PostMapping("/checkId")
    @ResponseBody
    public Map<String, Boolean> checkId(@RequestParam("userId") String userId) {
        boolean exists = userService.userIdExists(userId);
        return Map.of("exists", exists);
    }
    
    //개인과 기업을 구분하여 회원가입
    @PostMapping("/register")
    public String registerOk(@RequestParam HashMap<String, String> param) {

        if ("ROLE_COMPANY_USER".equals(param.get("role"))) {
            userService.companyUser(param);
        } else {
            userService.registerUser(param);
        }
        return "user/registerOk";
    }
    
    //회원 정보(개인,기업) 조회
    @GetMapping("/user")
    public String userInfo(Model model){
        
    	UserDTO userInfo = userService.userInfo(userSessionService.getUserId());

    	model.addAttribute("userInfo",userInfo);
        model.addAttribute("page","user/userInfo");

    	return "main/main";
    	
    } 
    
  //회원정보 수정
    @PutMapping("/userUpdate")
    @ResponseBody
    public String updateUser(@ModelAttribute UserDTO userDTO) {
        userService.updateUser(userDTO);
        return "success";
    }
    
    //회원 탈퇴
    @DeleteMapping("/deleteUser")
    @ResponseBody
    public String deleteUser(@RequestParam("userId") String userId) {
    	UserDTO userDTO = new UserDTO();
    	userDTO.setUserId(userId);
    	userService.deleteUser(userDTO);
    	log.info("삭제 된 userDTO : {}",userDTO);
    	return "success";
    }
}