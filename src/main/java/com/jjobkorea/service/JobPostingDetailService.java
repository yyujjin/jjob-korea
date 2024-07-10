package com.jjobkorea.service;

import com.jjobkorea.entity.JobPostingDetail;
import com.jjobkorea.entity.SignupCp;
import com.jjobkorea.repository.JobPostingDetailRepository;
import com.jjobkorea.repository.SignupCpRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class JobPostingDetailService {

    @Autowired
    private JobPostingDetailRepository jobPostingDetailRepository;

    @Autowired
    private SignupCpRepository signupCpRepository;

    public List<JobPostingDetail> getJobPostingsByCompany(SignupCp signupCp) {
        return jobPostingDetailRepository.findBySignupCp(signupCp);
    }

    public void addJobPosting(Long companyId, String jobTitle, String jobDescription, String jobRequirements, 
                              String employmentType, String salary, String location, String applicationDeadline, 
                              String contactEmail) {
        SignupCp signupCp = signupCpRepository.findById(companyId)
                .orElseThrow(() -> new IllegalArgumentException("Invalid company Id:" + companyId));
        
        JobPostingDetail jobPostingDetail = new JobPostingDetail();
        jobPostingDetail.setSignupCp(signupCp);
        jobPostingDetail.setJobTitle(jobTitle);
        jobPostingDetail.setJobDescription(jobDescription);
        jobPostingDetail.setJobRequirements(jobRequirements);
        jobPostingDetail.setEmploymentType(employmentType);
        jobPostingDetail.setSalary(salary);
        jobPostingDetail.setLocation(location);
        jobPostingDetail.setApplicationDeadline(applicationDeadline);
        jobPostingDetail.setContactEmail(contactEmail);
        
        jobPostingDetailRepository.save(jobPostingDetail);
    }
}
