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
        log.info("Received parameters: " + params);

        if (isMemIdExists(params.get("memId"))) {
            throw new IllegalArgumentException("이미 존재하는 아이디입니다.");
        }

        if ("enterprise".equals(params.get("type"))) {
            String cpSql = "INSERT INTO signup_cp (companyType, companyRegistrationNum, companyName,  companyRepresentativeName, companyAddr, companyBusinessRegistration) VALUES (?, ?, ?, ?, ?, ?)";
            jdbcTemplate.update(cpSql, params.get("companyType"), params.get("companyRegistrationNum"), params.get("companyName"), params.get("companyRepresentativeName"), params.get("companyAddr"), params.get("companyBusinessRegistrationNum"));

            Integer cpId = jdbcTemplate.queryForObject("SELECT LAST_INSERT_ID()", Integer.class);

            String memSql = "INSERT INTO signup_tb (memId, memPwd, memName, memPhone, memAddr, memEmail, memCreationDate, cpId) VALUES (?, ?, ?, ?, ?, ?, CURRENT_TIMESTAMP, ?)";
            jdbcTemplate.update(memSql, params.get("memId"), params.get("memPwd"), params.get("memName"), params.get("memPhone"), params.get("memAddr"), params.get("memEmail"), cpId);
        } else {
            if (params.get("memAddr") == null || params.get("memAddr").isEmpty()) {
                throw new IllegalArgumentException("회원 주소가 누락되었습니다.");
            }

            String memSql = "INSERT INTO signup_tb (memId, memPwd, memName, memPhone, memAddr, memEmail, memBirth, memGender, memCreationDate) VALUES (?, ?, ?, ?, ?, ?, ?, ?, CURRENT_TIMESTAMP)";
            jdbcTemplate.update(memSql, params.get("memId"), params.get("memPwd"), params.get("memName"), params.get("memPhone"), params.get("memAddr"), params.get("memEmail"), params.get("memBirth"), params.get("memGender"));
        }
    }

    public boolean isMemIdExists(String memId) {
        String sql = "SELECT COUNT(*) FROM signup_tb WHERE memId = ?";
        Integer count = jdbcTemplate.queryForObject(sql, Integer.class, memId);
        return count != null && count > 0;
    }
}
