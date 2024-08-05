package com.jjobkorea.service;

import java.util.HashMap;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import com.jjobkorea.controller.UserController;
import com.jjobkorea.dto.UserDTO;
import com.jjobkorea.mapper.UserMapper;

@Service
public class UserServiceImpl implements UserService{

    private static final Logger log = LoggerFactory.getLogger(UserController.class);
    private  final UserMapper userMapper;
	private final BCryptPasswordEncoder bCryptPasswordEncoder;

    public UserServiceImpl(UserMapper userMapper, BCryptPasswordEncoder bCryptPasswordEncoder) {
        this.userMapper = userMapper;
        this.bCryptPasswordEncoder = bCryptPasswordEncoder;
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
		param.put("password",bCryptPasswordEncoder.encode(param.get("password")));

		userMapper.individualUser(param);
	}
	
	//기업 회원가입-데이터베이스 연결
	@Override
	public void companyUser(HashMap<String, String> param) {
		param.put("password",bCryptPasswordEncoder.encode(param.get("password")));
		userMapper.companyUser(param);
		userMapper.insertCompanyInfo(param);
	}
	
	//회원 정보 조회
	@Override
	public UserDTO userInfo(String userId) {
		
		return userMapper.userInfo(userId);
	}
	
	//회원정보 수정
	@Override
	public void updateUser(UserDTO userDTO){

		userMapper.updateUser(userDTO);
	}
}
