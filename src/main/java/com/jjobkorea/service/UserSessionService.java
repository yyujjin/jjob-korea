package com.jjobkorea.service;

import com.jjobkorea.dto.CustomUserDetails;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;

@Service
public class UserSessionService {
    //현재 로그인한 사용자의 아이디를 반환
    public String getUserId() {
        return SecurityContextHolder.getContext().getAuthentication().getName();
    }

    // 현재 로그인한 사용자의 이름을 반환
    public String getUserName() {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();

        if (authentication.getPrincipal() instanceof CustomUserDetails) {
            CustomUserDetails userDetails = (CustomUserDetails) authentication.getPrincipal();
            return userDetails.getname();
        }

        // 혹시 CustomUserDetails가 아닌 경우를 대비한 기본 반환값
        return null;
    }
}
