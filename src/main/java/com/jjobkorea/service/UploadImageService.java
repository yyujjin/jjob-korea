package com.jjobkorea.service;

import org.springframework.stereotype.Service;

@Service
public interface UploadImageService { // 공고등록 이미지 업데이트
    String uploadImage(String filePath);

}
