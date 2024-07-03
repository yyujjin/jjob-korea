package com.jjobkorea.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.jjobkorea.entity.JobPosting;

public interface JobPostingRepository extends JpaRepository<JobPosting, Long> {
}
