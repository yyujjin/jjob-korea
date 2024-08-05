package com.jjobkorea.dto;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import java.util.Collection;
import java.util.List;

public class CustomUserDetails implements UserDetails {

    private final UserDTO userDTO;

    public CustomUserDetails(UserDTO userDTO) {
        this.userDTO = userDTO;
    }

    //현재 사용 안함
    @Override
    public Collection<? extends GrantedAuthority> getAuthorities() {
        return List.of();
    }
    //유저 비밀번호
    @Override
    public String getPassword() {
        return userDTO.getPassword();
    }
    //유저 아이디
    @Override
    public String getUsername() {
        return userDTO.getUserId();
    }



}