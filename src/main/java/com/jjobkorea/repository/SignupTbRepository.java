package com.jjobkorea.repository;

import com.jjobkorea.entity.SignupTb;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Optional;

public interface SignupTbRepository extends JpaRepository<SignupTb, Integer> {
    Optional<SignupTb> findByMemId(String memId);
}
