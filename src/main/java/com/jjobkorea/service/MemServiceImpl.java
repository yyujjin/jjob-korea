package com.jjobkorea.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.jjobkorea.dto.MemDTO;
import com.jjobkorea.mapper.MemMapper;

import lombok.extern.slf4j.Slf4j;

@Service("MemService")
@Slf4j
public class MemServiceImpl implements MemService {
    @Autowired
    private SqlSession sqlSession;

    @Override
    public ArrayList<MemDTO> loginYn(HashMap<String, String> param) {
        log.info("@# MemServiceImpl loginYn");
        MemMapper dao = sqlSession.getMapper(MemMapper.class);
        return dao.loginYn(param);
    }

    @Override
    @Transactional
    public void write(HashMap<String, String> param) {
        log.info("@# MemServiceImpl write");
        log.info("Parameters in service: " + param);

        MemMapper dao = sqlSession.getMapper(MemMapper.class);

        if (param.get("companyType") != null && !param.get("companyType").isEmpty()) {
            int count = dao.checkCpRegistrationNum(param.get("companyRegistrationNum"));
            if (count > 0) {
                throw new IllegalArgumentException("기업회원 등록번호가 중복됩니다.");
            }
            if (param.get("companyAddr") == null || param.get("companyAddr").isEmpty()) {
                throw new IllegalArgumentException("기업 주소가 누락되었습니다.");
            }
        }
        dao.write(param);
    }

    @Override
    public ArrayList<MemDTO> selectByCpId(HashMap<String, String> param) {
        log.info("@# MemServiceImpl selectByCpId");
        MemMapper dao = sqlSession.getMapper(MemMapper.class);
        return dao.selectByCpId(param);
    }

    @Override
    public int checkCpRegistrationNum(String cpRegistrationNum) {
        log.info("@# MemServiceImpl checkCpRegistrationNum");
        MemMapper dao = sqlSession.getMapper(MemMapper.class);
        return dao.checkCpRegistrationNum(cpRegistrationNum);
    }
}