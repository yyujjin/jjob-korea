package com.jjobkorea.service;

import org.springframework.security.core.context.SecurityContextHolder;

public class UserSessionService {

    String id = SecurityContextHolder.getContext().getAuthentication().getName();
}
