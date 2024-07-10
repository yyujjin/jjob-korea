package com.jjobkorea.repository;

import com.jjobkorea.entity.SignupCp;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface SignupCpRepository extends JpaRepository<SignupCp, Long> {
}
