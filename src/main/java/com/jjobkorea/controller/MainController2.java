package com.jjobkorea.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/kth")
public class MainController2 {

    @GetMapping("/")
    public String mainPage() {
        return "kth/main"; // main.jsp로 이동
    }

    @GetMapping("/addCompany")
    public String addCompanyPage() {
        return "kth/addCompany"; // addCompany.jsp로 이동
    }

    @GetMapping("/addJobPosting")
    public String addJobPostingPage() {
        return "kth/addJobPosting"; // addJobPosting.jsp로 이동
    }

    @GetMapping("/listCompanies")
    public String listCompaniesPage() {
        return "kth/listCompanies"; // listCompanies.jsp로 이동
    }

    @GetMapping("/listJobPostings")
    public String listJobPostingsPage() {
        return "kth/listJobPostings"; // listJobPostings.jsp로 이동
    }

    @GetMapping("/listAdmins")
    public String listAdminsPage() {
        return "kth/listAdmins"; // listAdmins.jsp로 이동
    }

    @GetMapping("/addAdmin")
    public String addAdminPage() {
        return "kth/addAdmin"; // addAdmin.jsp로 이동
    }
}
