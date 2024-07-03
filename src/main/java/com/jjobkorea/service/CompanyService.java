package com.jjobkorea.service;

import com.jjobkorea.entity.Company;
import com.jjobkorea.repository.CompanyRepository;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class CompanyService {

    private final CompanyRepository companyRepository;

    public CompanyService(CompanyRepository companyRepository) {
        this.companyRepository = companyRepository;
    }

    public List<Company> findAll() {
        return companyRepository.findAll();
    }

    public Optional<Company> findById(String id) {
        return companyRepository.findById(id);
    }

    public Company saveCompany(Company company) {
        return companyRepository.save(company);
    }
}
