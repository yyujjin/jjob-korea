package com.jjobkorea.controller;

import com.jjobkorea.entity.Company;
import com.jjobkorea.service.CompanyService;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestMapping;

import java.text.SimpleDateFormat;
import java.util.Date;

@Controller
@RequestMapping("/companies")
public class CompanyController {
    private final CompanyService companyService;

    public CompanyController(CompanyService companyService) {
        this.companyService = companyService;
    }

    @InitBinder
    public void initBinder(WebDataBinder binder) {
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm");
        dateFormat.setLenient(false);
        binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, true));
    }

    @GetMapping("/list")
    public String listCompaniesPage(Model model) {
        model.addAttribute("companies", companyService.findAll());
        return "listCompanies"; // listCompanies.jsp로 이동
    }

    @GetMapping("/add")
    public String addCompanyPage() {
        return "addCompany"; // addCompany.jsp로 이동
    }

    @PostMapping("/add")
    public String createCompany(@ModelAttribute Company company,
                                @RequestParam("adminId") String adminId) {
        company.setAdminId(adminId); // adminId 설정
        companyService.saveCompany(company);
        return "redirect:/companies/list";
    }
}
