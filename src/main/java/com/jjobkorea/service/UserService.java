package com.jjobkorea.service;

import com.jjobkorea.dto.UserDTO;

import java.util.Optional;

public interface UserService {
    //로그인
    public UserDTO login(UserDTO userDTO);
}
