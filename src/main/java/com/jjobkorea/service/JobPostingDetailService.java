package com.jjobkorea.service;

import com.jjobkorea.entity.JobPostingDetail;
import com.jjobkorea.repository.JobPostingDetailRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.Optional;

@Service
public class JobPostingDetailService {

    @Autowired
    private JobPostingDetailRepository jobPostingDetailRepository;

    private final String UPLOAD_DIR = "webapp/resources/img/jobPostingDetail";

    public JobPostingDetail saveJobPostingDetail(JobPostingDetail jobPostingDetail) {
        return jobPostingDetailRepository.save(jobPostingDetail);
    }

    public JobPostingDetail getJobPostingDetail(Long id) {
        Optional<JobPostingDetail> jobPostingDetail = jobPostingDetailRepository.findById(id);
        return jobPostingDetail.orElse(null);
    }

    public String saveFile(MultipartFile file) throws IOException {
        if (file.isEmpty()) {
            return null;
        }
        String fileName = file.getOriginalFilename();
        Path uploadPath = Paths.get(UPLOAD_DIR);

        // 디렉토리가 없으면 생성
        if (!Files.exists(uploadPath)) {
            Files.createDirectories(uploadPath);
        }

        Path filePath = uploadPath.resolve(fileName);
        file.transferTo(filePath.toFile());

        return fileName;
    }
}
