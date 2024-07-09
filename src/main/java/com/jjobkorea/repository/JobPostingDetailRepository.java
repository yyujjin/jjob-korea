package com.jjobkorea.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import com.jjobkorea.entity.JobPostingDetail;

@Repository
public interface JobPostingDetailRepository extends JpaRepository<JobPostingDetail, Long> {
}
