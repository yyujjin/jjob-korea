package com.jjobkorea.service;

import com.jjobkorea.service.UploadImageService;
import org.springframework.stereotype.Service;

@Service
public class UploadImageServiceImpl implements UploadImageService {

    @Override
    public String uploadImage(String jobPostingUploadPath) {
        // AWS S3에 파일 업로드 로직 구현
        // 예시: 파일을 업로드하고, 업로드된 파일의 URL을 반환
        return "https://s3.amazonaws.com/your-bucket-name/" + jobPostingUploadPath;
    }
}