package com.jjobkorea.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Service;

import com.jjobkorea.dto.MemDTO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class MemServiceImpl implements MemService {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    private RowMapper<MemDTO> memRowMapper = (rs, rowNum) -> {
        MemDTO mem = new MemDTO();
        mem.setMemId(rs.getString("memId"));
        mem.setMemPwd(rs.getString("memPwd"));
        mem.setMemName(rs.getString("memName"));
        mem.setCpId(rs.getInt("cpId"));
        mem.setCompanyType(rs.getString("companyType"));
        mem.setCompanyRegistrationNum(rs.getString("companyRegistrationNum"));
        mem.setCompanyRepresentativeName(rs.getString("companyRepresentativeName"));
        mem.setCompanyName(rs.getString("companyName"));
        mem.setCompanyAddr(rs.getString("companyAddr"));
        mem.companyBusinessRegistration(rs.getString("companyBusinessRegistration")); // 이 필드 사용
        mem.setUserType(rs.getInt("userType"));
        return mem;
    };

    @Override
    public ArrayList<MemDTO> loginYn(HashMap<String, String> param) {
        log.info("@# MemServiceImpl loginYn");

        String sql = "SELECT tb.memId, tb.memPwd, tb.memName, tb.cpId, cp.companyType, cp.companyRegistrationNum, cp.companyRepresentativeName, cp.companyName, cp.companyAddr, cp.companyBusinessRegistration AS companyBusinessRegistration, tb.userType FROM signup_tb tb LEFT JOIN signup_cp cp ON tb.cpId = cp.id WHERE tb.memId = ?";
        List<MemDTO> result = jdbcTemplate.query(sql, memRowMapper, param.get("memId"));

        return new ArrayList<>(result);
    }

    @Override
    public void write(HashMap<String, String> param) {
        log.info("@# MemServiceImpl write");
        log.info("Parameters in service: " + param);

        if (param.get("companyType") != null && !param.get("companyType").isEmpty()) {
            String cpSql = "INSERT INTO signup_cp (companyType, companyRegistrationNum, companyName, companyRepresentativeName, companyAddr, companyBusinessRegistration) VALUES (?, ?, ?, ?, ?, ?)";
            jdbcTemplate.update(cpSql, param.get("companyType"), param.get("companyRegistrationNum"), param.get("companyName"), param.get("companyRepresentativeName"), param.get("companyAddr"), param.get("companyBusinessRegistration"));

            Integer cpId = jdbcTemplate.queryForObject("SELECT LAST_INSERT_ID()", Integer.class);

            String memSql = "INSERT INTO signup_tb (memId, memPwd, memName, memPhone, memAddr, memEmail, memCreationDate, cpId, userType) VALUES (?, ?, ?, ?, ?, ?, CURRENT_TIMESTAMP, ?, 1)";
            jdbcTemplate.update(memSql, param.get("memId"), param.get("memPwd"), param.get("memName"), param.get("memPhone"), param.get("memAddr"), param.get("memEmail"), cpId);
        } else {
            String memSql = "INSERT INTO signup_tb (memId, memPwd, memName, memPhone, memAddr, memEmail, memBirth, memGender, memCreationDate, userType) VALUES (?, ?, ?, ?, ?, ?, ?, ?, CURRENT_TIMESTAMP, -1)";
            jdbcTemplate.update(memSql, param.get("memId"), param.get("memPwd"), param.get("memName"), param.get("memPhone"), param.get("memAddr"), param.get("memEmail"), param.get("memBirth"), param.get("memGender"));
        }
    }

    @Override
    public ArrayList<MemDTO> selectByCpId(HashMap<String, String> param) {
        log.info("@# MemServiceImpl selectByCpId");

        String sql = "SELECT tb.cpId, cp.companyType, cp.companyRegistrationNum, cp.companyName, cp.companyRepresentativeName, cp.companyAddr, cp.companyBusinessRegistration FROM signup_tb tb LEFT JOIN signup_cp cp ON tb.cpId = cp.id WHERE tb.cpId = ?";
        List<MemDTO> result = jdbcTemplate.query(sql, memRowMapper, param.get("cpId"));

        return new ArrayList<>(result);
    }

    @Override
    public int checkCpRegistrationNum(String cpRegistrationNum) {
        log.info("@# MemServiceImpl checkCpRegistrationNum");

        String sql = "SELECT COUNT(*) FROM signup_cp WHERE companyRegistrationNum = ?";
        Integer count = jdbcTemplate.queryForObject(sql, Integer.class, cpRegistrationNum);
        return count != null ? count : 0;
    }
}
