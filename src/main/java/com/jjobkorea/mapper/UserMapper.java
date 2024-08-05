package com.jjobkorea.mapper;

import java.util.HashMap;

import org.apache.ibatis.annotations.Mapper;

import com.jjobkorea.dto.UserDTO;

@Mapper
public interface UserMapper {
    
    //아이디 존재 여부 확인
    public int checkUserId(String userId);
    
    //구직자 회원 가입
    public void individualUser(HashMap<String, String> param);
    //기업 회원가입
    public void companyUser(HashMap<String, String> param);
    //기업 추가정보 
    public void insertCompanyInfo(HashMap<String, String> param);
    //회원(개인, 기업) 정보 조회
    public UserDTO userInfo(String userId);
    //조회된 회원 정보 수정
    public void updateUser(UserDTO userDTO);
    //유저 확인
    public UserDTO findByUserId(String username);

}
