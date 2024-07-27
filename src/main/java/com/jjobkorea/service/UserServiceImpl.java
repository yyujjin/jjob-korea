package com.jjobkorea.service;

import com.jjobkorea.dto.UserDTO;
import com.jjobkorea.mapper.UserMapper;
import org.springframework.stereotype.Service;

@Service
public class UserServiceImpl implements UserService{

    private  final UserMapper userMapper;

    public UserServiceImpl(UserMapper userMapper) {
        this.userMapper = userMapper;
    }

    //로그인
    @Override
    public UserDTO login(UserDTO userDTO) {
        return userMapper.login(userDTO);
    }
}
