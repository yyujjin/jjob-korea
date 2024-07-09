package com.jjobkorea.repository;

import com.jjobkorea.entity.JobPostingInfo;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface JobPostingInfoRepository extends JpaRepository<JobPostingInfo, Integer> {
}
