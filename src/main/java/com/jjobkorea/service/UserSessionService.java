package com.jjobkorea.service;

import org.springframework.security.core.context.SecurityContextHolder;

public class UserSessionService {
    public String getUserId() {
        return SecurityContextHolder.getContext().getAuthentication().getName();
    }
}
