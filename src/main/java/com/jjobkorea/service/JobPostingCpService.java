package com.jjobkorea.service;

import com.jjobkorea.entity.JobPostingDetail;
import com.jjobkorea.entity.SignupCp;
import java.util.List;

public interface JobPostingCpService {
    List<SignupCp> getAllCompanies();
    SignupCp getCompanyById(int id);
    void saveJobPosting(JobPostingDetail jobPostingDetail);
}
