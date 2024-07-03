package com.jjobkorea.service;

import com.jjobkorea.entity.Admin;
import com.jjobkorea.repository.AdminRepository;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class AdminService2 {
    private final AdminRepository adminRepository;

    public AdminService2(AdminRepository adminRepository) {
        this.adminRepository = adminRepository;
    }

    public List<Admin> findAll() {
        return adminRepository.findAll();
    }

    public Admin saveAdmin(Admin admin) {
        return adminRepository.save(admin);
    }
}
