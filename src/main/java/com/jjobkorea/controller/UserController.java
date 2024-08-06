package com.jjobkorea.controller;

import java.util.HashMap;
import java.util.Optional;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
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
    public String showLoginPage(Model model) {
        model.addAttribute("page","user/login");
        return "main/main";
    }

    //로그인
    @PostMapping("/login")
    public String login(UserDTO userDTO, Model model, HttpServletRequest request) {

        Optional<UserDTO> optionalUser = Optional.ofNullable(userDTO);

        if (optionalUser.isPresent()) {
            UserDTO isAuthenticated = userService.login(userDTO);
            if (isAuthenticated == null) {
                model.addAttribute("page", showLoginPage(model));
                return "main/main";
            }
            HttpSession session = request.getSession();

            session.setAttribute("user", isAuthenticated);
            UserDTO user = (UserDTO) session.getAttribute("user");
            log.info("사용자 세션 :{} ", user);
        } else {
            model.addAttribute("page", showLoginPage(model));
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
    @GetMapping("/register")
    public String register(Model model) {
        model.addAttribute("page", "user/register");
        return "main/main";
    }

    //개인과 기업을 구분하여 회원가입
    @PostMapping("/register")
    public String registerOk(@RequestParam HashMap<String, String> param) {
        if ("enterprise".equals(param.get("type"))) {
            userService.companyUser(param);
        } else {
            userService.registerUser(param);
        }
        return "user/registerOk";
    }

    /*// 아이디 중복 체크
    @PostMapping("/checkId")
    @ResponseBody
    public HashMap<String, Boolean> checkId(@RequestParam("userId") String userId) {
        HashMap<String, Boolean> response = new HashMap<>();
        response.put("exists", userService.userIdExists(new HashMap<String, String>() {{
            put("userId", userId);
        }}));
        return response;
    }*/
    
    //회원 정보(개인,기업) 조회
    @GetMapping("/user")
    public String userInfo(Model model){

    	//수정 test를 위한 userId="user02" 데이터 사용
//    	 String userId = "user02";
    	
    	String userId = "1313";
    	
    	UserDTO userInfo = userService.userInfo(userId);
    	log.info("가져온 userInfo : {}",userInfo);
    	model.addAttribute("userInfo",userInfo);
        model.addAttribute("page","user/userInfo");
    	
    	return "main/main";
    	
    } 
    
    //회원정보 수정
    @PostMapping("/user/update")
    public String updateUser(UserDTO userDTO) {
    	
    	userService.updateUser(userDTO);
    	log.info("업데이트 된 userDTO : {}",userDTO);
    	
    	return "user/updateSuccess";
    }
    
    //회원 탈퇴
    @DeleteMapping("/deleteUser")
    @ResponseBody
    public String deleteUser(@RequestParam("userId") String userId) {
    	
    	UserDTO userDTO = new UserDTO();
    	userDTO.setUserId(userId);
    	log.info("@#userId"+userId);
    	userService.deleteUser(userDTO);
    	log.info("삭제 된 userDTO : {}",userDTO);
    	
    	return "success";
    }
}
