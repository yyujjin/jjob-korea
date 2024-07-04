package com.jjobkorea.controller;

import com.jjobkorea.entity.*;
import com.jjobkorea.service.CompanyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/companies")
public class CompanyController {

    @Autowired
    private CompanyService companyService;

    @PostMapping("/basic")
    public CompanyBasicInfo createCompanyBasicInfo(@RequestBody CompanyBasicInfo basicInfo) {
        return companyService.saveBasicInfo(basicInfo);
    }

    @PostMapping("/contact")
    public CompanyContactInfo createCompanyContactInfo(@RequestBody CompanyContactInfo contactInfo) {
        return companyService.saveContactInfo(contactInfo);
    }

    @PostMapping("/incharge")
    public CompanyInCharge createCompanyInCharge(@RequestBody CompanyInCharge inCharge) {
        return companyService.saveInCharge(inCharge);
    }

    @PostMapping("/additional")
    public CompanyAdditionalInfo createCompanyAdditionalInfo(@RequestBody CompanyAdditionalInfo additionalInfo) {
        return companyService.saveAdditionalInfo(additionalInfo);
    }

    @PostMapping("/sizetype")
    public CompanySizeType createCompanySizeType(@RequestBody CompanySizeType sizeType) {
        return companyService.saveSizeType(sizeType);
    }

    @GetMapping
    public List<CompanyBasicInfo> getAllCompanies() {
        return companyService.getAllCompanies();
    }

    @GetMapping("/{id}")
    public CompanyBasicInfo getCompanyById(@PathVariable Long id) {
        return companyService.getCompanyById(id);
    }

    @DeleteMapping("/{id}")
    public void deleteCompany(@PathVariable Long id) {
        companyService.deleteCompany(id);
    }
}
