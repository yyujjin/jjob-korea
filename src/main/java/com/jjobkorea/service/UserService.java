package com.jjobkorea.service;

import java.util.HashMap;

import com.jjobkorea.dto.UserDTO;

public interface UserService {

    //아이디 존재 여부 확인
    public boolean userIdExists(HashMap<String, String>param);
    //구직자 회원가입
    public void registerUser(HashMap<String, String> param);
    //기업 회원가입
    public void companyUser(HashMap<String, String> param);
    //마이페이지-개인 회원 정보 조회
    public UserDTO userInfo(String userId);
    //조회된 회원정보 수정
    public void updateUser(UserDTO userDTO);
}
