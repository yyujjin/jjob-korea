package com.jjobkorea.controller;

import com.jjobkorea.entity.Admin;
import com.jjobkorea.service.AdminService2;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class AdminController2 {
    private final AdminService2 adminService;

    public AdminController2(AdminService2 adminService) {
        this.adminService = adminService;
    }

    @PostMapping("/addAdmin")
    public String addAdmin(@RequestParam("adminId") String adminId,
                           @RequestParam("adminName") String adminName,
                           @RequestParam("adminEmail") String adminEmail) {
        Admin admin = new Admin();
        admin.setAdminId(adminId);
        admin.setAdminName(adminName);
        admin.setAdminEmail(adminEmail);
        adminService.saveAdmin(admin);
        return "redirect:/listAdmins";
    }
}
