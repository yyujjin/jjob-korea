package com.jjobkorea.service;

import org.springframework.stereotype.Service;

@Service
public interface SaveImageService { // 공고등록이미지 저장하기
    void saveImageUrl(String imageUrl);
}
