package com.jjobkorea.dto;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

public class CustomUserDetails implements UserDetails {

    private final UserDTO userDTO;

    public CustomUserDetails(UserDTO userDTO) {
        this.userDTO = userDTO;
    }
    //사용자 권한
    @Override
    public Collection<? extends GrantedAuthority> getAuthorities() {
        Collection<GrantedAuthority> collection = new ArrayList<>();
        collection.add(new GrantedAuthority() {
            @Override
            public String getAuthority() {
                return userDTO.getRole();
            }
        });
        return collection;
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
    //유저 이름
    public String getname() {return userDTO.getName();}
}