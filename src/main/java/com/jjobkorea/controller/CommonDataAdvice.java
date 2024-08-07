package com.jjobkorea.controller;

import com.jjobkorea.service.UserSessionService;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ModelAttribute;

@ControllerAdvice
public class CommonDataAdvice {

    private final UserSessionService userSessionService;

    public CommonDataAdvice(UserSessionService userSessionService) {
        this.userSessionService = userSessionService;
    }
    //공통적으로 사용되는 데이터를 설정하거나, 요청 파라미터를 객체로 바인딩하는 경우.
    @ModelAttribute
    public void addCommonAttributes(Model model) {
        model.addAttribute("username", userSessionService.getUserName());
        model.addAttribute("role",userSessionService.getRole());
    }
}
