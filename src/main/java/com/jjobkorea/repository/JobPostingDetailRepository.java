package com.jjobkorea.repository;

import com.jjobkorea.entity.JobPostingDetail;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface JobPostingDetailRepository extends JpaRepository<JobPostingDetail, Long> {
    List<JobPostingDetail> findByCompanyId(Long companyId);
}
