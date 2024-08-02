package com.jjobkorea.mapper;

import java.util.HashMap;

import org.apache.ibatis.annotations.Mapper;

import com.jjobkorea.dto.UserDTO;

@Mapper
public interface UserMapper {
    //아이디, 비번이 일치하면 유저의 이름을 가져오는 기능
    public UserDTO login(UserDTO userDTO);
    
    //아이디 존재 여부 확인
    public int checkUserId(String userId);
    
    //구직자 회원 가입
    public void individualUser(HashMap<String, String> param);
    //기업 회원가입
    public void companyUser(HashMap<String, String> param);

    public void insertCompanyInfo(HashMap<String, String> param);
}
