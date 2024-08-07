package com.jjobkorea.repository;

import com.jjobkorea.entity.JobPostingDetail;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface JobPostingDetailRepository extends JpaRepository<JobPostingDetail, Long> {
}
