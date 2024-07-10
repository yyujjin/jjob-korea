package com.jjobkorea.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class MemSignupService {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    @Transactional
    public void registerEnterprise(Map<String, String> params) {
        // 파라미터 로그 출력
        log.info("Received parameters: " + params);

        // memId 중복 확인
        if (isMemIdExists(params.get("memId"))) {
            throw new IllegalArgumentException("이미 존재하는 아이디입니다.");
        }

        if ("enterprise".equals(params.get("type"))) {
            // 기업 정보 삽입
            String cpSql = "INSERT INTO signup_cp (companyType, companyRegistrationNum, companyName,  companyRepresentativeName, companyAddr, companyBusinessRegistration) VALUES (?, ?, ?, ?, ?, ?)";
            jdbcTemplate.update(cpSql, params.get("companyType"), params.get("companyRegistrationNum"), params.get("companyName"), params.get("companyRepresentativeName"), params.get("companyAddr"), params.get("companyBusinessRegistrationNum"));

            // 삽입된 기업 ID 가져오기
            Integer cpId = jdbcTemplate.queryForObject("SELECT LAST_INSERT_ID()", Integer.class);

            // 기업회원 정보 삽입
            String memSql = "INSERT INTO signup_tb (memId, memPwd, memName, memPhone, memAddr, memEmail, memCreationDate, cpId) VALUES (?, ?, ?, ?, ?, ?, CURRENT_TIMESTAMP, ?)";
            jdbcTemplate.update(memSql,
                params.get("memId"),
                params.get("memPwd"),
                params.get("memName"),
                params.get("memPhone"),
                params.get("memAddr"),
                params.get("memEmail"),
                cpId
            );
        } else {
            // 개인회원 정보 삽입 전 memAddr 값 체크
            if (params.get("memAddr") == null || params.get("memAddr").isEmpty()) {
                throw new IllegalArgumentException("회원 주소가 누락되었습니다.");
            }

            // 개인회원 정보 삽입
            String memSql = "INSERT INTO signup_tb (memId, memPwd, memName, memPhone, memAddr, memEmail, memBirth, memGender, memCreationDate) VALUES (?, ?, ?, ?, ?, ?, ?, ?, CURRENT_TIMESTAMP)";
            jdbcTemplate.update(memSql,
                params.get("memId"),
                params.get("memPwd"),
                params.get("memName"),
                params.get("memPhone"),
                params.get("memAddr"),
                params.get("memEmail"),
                params.get("memBirth"),
                params.get("memGender")
            );
        }
    }

    // 새로운 메서드 추가: memId 중복 확인
    public boolean isMemIdExists(String memId) {
        String sql = "SELECT COUNT(*) FROM signup_tb WHERE memId = ?";
        Integer count = jdbcTemplate.queryForObject(sql, Integer.class, memId);
        return count != null && count > 0;
    }
}
