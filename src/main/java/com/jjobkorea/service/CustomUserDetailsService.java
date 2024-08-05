package com.jjobkorea.service;

import com.jjobkorea.dto.CustomUserDetails;
import com.jjobkorea.dto.UserDTO;
import com.jjobkorea.mapper.UserMapper;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

public class CustomUserDetailsService implements UserDetailsService {

    private final UserMapper userMapper;

    public CustomUserDetailsService(UserMapper userMapper) {
        this.userMapper = userMapper;
    }

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {

        UserDTO userData = userMapper.findByUserId(username);

        if (userData!=null){
            return new CustomUserDetails(userData);
        }

        return null;
    }
}