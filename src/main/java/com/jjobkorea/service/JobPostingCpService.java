package com.jjobkorea.service;

import com.jjobkorea.entity.SignupCp;
import com.jjobkorea.repository.SignupCpRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class JobPostingCpService {

    @Autowired
    private SignupCpRepository signupCpRepository;

    public List<SignupCp> getAllCompanies() {
        return signupCpRepository.findAll();
    }

    public SignupCp getCompanyById(int id) {
        return signupCpRepository.findById(id).orElse(null);
    }

    public void saveCompany(SignupCp signupCp) {
        signupCpRepository.save(signupCp);
    }

    public boolean existsByCompanyRegistrationNum(String companyRegistrationNum) {
        return signupCpRepository.existsByCompanyRegistrationNum(companyRegistrationNum);
    }

    public boolean existsByCompanyBusinessRegistration(String companyBusinessRegistration) {
        return signupCpRepository.existsByCompanyBusinessRegistration(companyBusinessRegistration);
    }
}
