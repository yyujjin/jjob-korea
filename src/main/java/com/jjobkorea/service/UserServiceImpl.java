package com.jjobkorea.service;

import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.jjobkorea.controller.UserController;
import com.jjobkorea.dto.UserDTO;
import com.jjobkorea.mapper.UserMapper;

@Service
public class UserServiceImpl implements UserService{

    private static final Logger log = LoggerFactory.getLogger(UserController.class);
    private  final UserMapper userMapper;

    public UserServiceImpl(UserMapper userMapper) {
        this.userMapper = userMapper;
    }

    //로그인
    @Override
    public UserDTO login(UserDTO userDTO) {

        log.info("넘어온 userDTO : {}",userDTO);

        return userMapper.login(userDTO);
    }
    
    //아이디 중복 체크
    @Override
	public boolean userIdExists(HashMap<String, String> param) {
		
		return userMapper.checkUserId(param.get("userId")) > 0;
	}
    
    //개인 회원가입-데이터 베이스 연결 
	@Override
	public void registerUser(HashMap<String, String> param) {
		userMapper.individualUser(param);
	}
	
	//기업 회원가입-데이터베이스 연결
	@Override
	public void companyUser(HashMap<String, String> param) {
		userMapper.companyUser(param);
		userMapper.insertCompanyInfo(param);
	}
}
