package com.jjobkorea.service;

import com.jjobkorea.controller.UserController;
import com.jjobkorea.dto.UserDTO;
import com.jjobkorea.mapper.UserMapper;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import java.util.Optional;

@Service
public class UserServiceImpl implements UserService{

    private static final Logger log = LoggerFactory.getLogger(UserController.class);
    private  final UserMapper userMapper;

    public UserServiceImpl(UserMapper userMapper) {
        this.userMapper = userMapper;
    }

    //로그인
    @Override
    public boolean login(UserDTO userDTO) {

        log.info("넘어온 userDTO : {}",userDTO);

        //세션 로직 추가하기

        return userMapper.login(userDTO).isEmpty();
    }
}
