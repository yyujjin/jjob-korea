package com.jjobkorea.repository;

import com.jjobkorea.entity.JobPostingDetail;
import com.jjobkorea.entity.SignupCp;
import org.springframework.data.repository.CrudRepository;

import java.util.List;

public interface JobPostingDetailRepository extends CrudRepository<JobPostingDetail, Long> {
    List<JobPostingDetail> findBySignupCp(SignupCp signupCp);
}
