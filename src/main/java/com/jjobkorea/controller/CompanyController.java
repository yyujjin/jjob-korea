package com.jjobkorea.controller;

import com.jjobkorea.entity.Company;
import com.jjobkorea.service.CompanyService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import java.util.Optional;

@Controller
@RequiredArgsConstructor
public class CompanyController {

    private final CompanyService companyService;

    @GetMapping("/companies")
    public String getAllCompanies(Model model) {
        model.addAttribute("companies", companyService.getAllCompanies());
        return "companies/list";
    }

    @GetMapping("/companies/{id}")
    public String getCompanyById(@PathVariable Long id, Model model) {
        Optional<Company> company = companyService.getCompanyById(id);
        if (company.isPresent()) {
            model.addAttribute("company", company.get());
            model.addAttribute("jobPostings", company.get().getJobPostings());
            return "companies/detail";
        } else {
            return "companies/not-found";
        }
    }
}
