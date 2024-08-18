package com.jjobkorea.service;

import org.springframework.stereotype.Service;

@Service
public interface UploadImageService {
    String uploadImage(String filePath);

}
