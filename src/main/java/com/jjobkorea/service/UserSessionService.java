package com.jjobkorea.service;

import com.jjobkorea.dto.CustomOAuth2User;
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

    // 현재 로그인한 사용자의 아이디를 반환
    public String getUserId() {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        if (authentication == null || authentication.getPrincipal() == null) {
            log.warn("인증 정보가 없습니다.");
            return null;
        }

        Object principal = authentication.getPrincipal();

        if (principal instanceof CustomOAuth2User) {
            CustomOAuth2User oAuth2User = (CustomOAuth2User) principal;
            String userId = oAuth2User.getUserId();
            log.info("OAuth2 사용자 아이디 : {}", userId);
            return userId;
        } else if (principal instanceof CustomUserDetails) {
            CustomUserDetails userDetails = (CustomUserDetails) principal;
            String userName = userDetails.getUsername();
            log.info("폼 로그인 사용자 아이디 : {}", userName);
            return userName;
        }

        return null;
    }

    // 현재 로그인한 사용자의 이름을 반환
    public String getUserName() {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        if (authentication == null || authentication.getPrincipal() == null) {
            log.warn("인증 정보가 없습니다.");
            return null;
        }

        Object principal = authentication.getPrincipal();

        if (principal instanceof CustomOAuth2User) {
            CustomOAuth2User oAuth2User = (CustomOAuth2User) principal;
            String userName = oAuth2User.getName();
            log.info("OAuth2 사용자 이름 : {}", userName);
            return userName;
        } else if (principal instanceof CustomUserDetails) {
            CustomUserDetails userDetails = (CustomUserDetails) principal;
            String userName = userDetails.getname();
            log.info("폼 로그인 사용자 이름 : {}", userName);
            return userName;
        }

        return null;
    }

    // 현재 로그인한 사용자의 권한을 반환
    public String getRole() {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        if (authentication == null) {
            log.warn("인증 정보가 없습니다.");
            return null;
        }

        Collection<? extends GrantedAuthority> authorities = authentication.getAuthorities();
        if (authorities.isEmpty()) {
            log.warn("사용자 권한이 없습니다.");
            return null;
        }

        Iterator<? extends GrantedAuthority> iter = authorities.iterator();
        GrantedAuthority auth = iter.next();
        log.info("사용자 권한 : {}",auth.getAuthority());
        return auth.getAuthority();
    }

    public String getRegistrationId() {

        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();

        Object principal = authentication.getPrincipal();

        if (principal instanceof CustomOAuth2User) {
            CustomOAuth2User oAuth2User = (CustomOAuth2User) principal;
            String registrationId = oAuth2User.getRegistrationId();
            return registrationId;
        }
        return null;
    }
}