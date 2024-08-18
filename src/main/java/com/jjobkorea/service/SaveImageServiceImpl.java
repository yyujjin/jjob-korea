package com.jjobkorea.service;

import com.jjobkorea.service.SaveImageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Service;

@Service
public class SaveImageServiceImpl implements SaveImageService {

    private final JdbcTemplate jdbcTemplate;

    @Autowired
    public SaveImageServiceImpl(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    @Override
    public void saveImageUrl(String imageUrl) {
        // 데이터베이스에 이미지 URL 저장 로직 구현
        String sql = "INSERT INTO jobposting (postingImage) VALUES (?)";

        jdbcTemplate.update(sql, imageUrl);

        // 로그 출력 (필요시)
        System.out.println("Image URL saved to RDS: " + imageUrl);
    }
}
