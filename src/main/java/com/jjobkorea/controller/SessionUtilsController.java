package com.jjobkorea.controller;

import jakarta.servlet.http.HttpSession;
import com.jjobkorea.dto.MemDTO;

public class SessionUtilsController {
    public static boolean isLoggedIn(HttpSession session) {
        return session.getAttribute("user") != null;
    }

    public static MemDTO getLoggedInUser(HttpSession session) {
        return (MemDTO) session.getAttribute("user");
    }
}