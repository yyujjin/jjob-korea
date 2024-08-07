package com.jjobkorea.service;

import com.jjobkorea.dto.CustomUserDetails;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;

import java.util.Collection;
import java.util.Iterator;

@Service
public class UserSessionService {
    private static final Logger log = LoggerFactory.getLogger(UserSessionService.class);

    //현재 로그인한 사용자의 아이디를 반환
    public String getUserId() {
        log.info("사용자 아이디 : {}",SecurityContextHolder.getContext().getAuthentication().getName());
        return SecurityContextHolder.getContext().getAuthentication().getName();
    }

    // 현재 로그인한 사용자의 이름을 반환
    public String getUserName() {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();

        if (authentication.getPrincipal() instanceof CustomUserDetails) {
            CustomUserDetails userDetails = (CustomUserDetails) authentication.getPrincipal();
            log.info("사용자 이름 : {}",userDetails.getname());
            return userDetails.getname();
        }

        // 혹시 CustomUserDetails가 아닌 경우를 대비한 기본 반환값
        return null;
    }

    //사용자 권환
    public String getRole() {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();

        Collection<? extends GrantedAuthority> authorities = authentication.getAuthorities();
        Iterator<? extends GrantedAuthority> iter = authorities.iterator();
        GrantedAuthority auth = iter.next();
        log.info("사용자 권한 : {}",auth.getAuthority());
        return auth.getAuthority();
    }
}
