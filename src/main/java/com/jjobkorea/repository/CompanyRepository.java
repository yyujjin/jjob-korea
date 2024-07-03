package com.jjobkorea.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.jjobkorea.entity.Company;

public interface CompanyRepository extends JpaRepository<Company, String> {
}
