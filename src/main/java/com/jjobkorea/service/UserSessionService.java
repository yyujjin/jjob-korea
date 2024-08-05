package com.jjobkorea.service;

import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;

@Service
public class UserSessionService {
    public String getUserId() {
        return SecurityContextHolder.getContext().getAuthentication().getName();
    }
}
