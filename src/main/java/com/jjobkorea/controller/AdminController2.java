package com.jjobkorea.controller;

import com.jjobkorea.entity.Admin;
import com.jjobkorea.service.AdminService2;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/kth")
public class AdminController2 {
    private final AdminService2 adminService;

    public AdminController2(AdminService2 adminService) {
        this.adminService = adminService;
    }

    @GetMapping("/addAdmin")
    public String addAdminPage() {
        return "kth/addAdmin"; // addAdmin.jsp로 이동
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
        return "redirect:/kth/listAdmins";
    }

    @GetMapping("/listAdmins")
    public String listAdmins(Model model) {
        model.addAttribute("admins", adminService.findAll());
        return "kth/listAdmins"; // listAdmins.jsp로 이동
    }
}
