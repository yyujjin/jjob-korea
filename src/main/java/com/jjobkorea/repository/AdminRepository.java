package com.jjobkorea.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.jjobkorea.entity.Admin;

public interface AdminRepository extends JpaRepository<Admin, String> {
}
