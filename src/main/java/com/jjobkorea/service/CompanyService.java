package com.jjobkorea.service;

import com.jjobkorea.entity.*;
import com.jjobkorea.repository.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CompanyService {

    @Autowired
    private CompanyBasicInfoRepository basicInfoRepository;

    @Autowired
    private CompanyContactInfoRepository contactInfoRepository;

    @Autowired
    private CompanyInChargeRepository inChargeRepository;

    @Autowired
    private CompanyAdditionalInfoRepository additionalInfoRepository;

    @Autowired
    private CompanySizeTypeRepository sizeTypeRepository;

    public CompanyBasicInfo saveBasicInfo(CompanyBasicInfo basicInfo) {
        return basicInfoRepository.save(basicInfo);
    }

    public CompanyContactInfo saveContactInfo(CompanyContactInfo contactInfo) {
        return contactInfoRepository.save(contactInfo);
    }

    public CompanyInCharge saveInCharge(CompanyInCharge inCharge) {
        return inChargeRepository.save(inCharge);
    }

    public CompanyAdditionalInfo saveAdditionalInfo(CompanyAdditionalInfo additionalInfo) {
        return additionalInfoRepository.save(additionalInfo);
    }

    public CompanySizeType saveSizeType(CompanySizeType sizeType) {
        return sizeTypeRepository.save(sizeType);
    }

    public List<CompanyBasicInfo> getAllCompanies() {
        return basicInfoRepository.findAll();
    }

    public CompanyBasicInfo getCompanyById(Long id) {
        return basicInfoRepository.findById(id).orElse(null);
    }

    public void deleteCompany(Long id) {
        basicInfoRepository.deleteById(id);
    }
}
