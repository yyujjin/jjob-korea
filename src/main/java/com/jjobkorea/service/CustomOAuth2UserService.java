package com.jjobkorea.service;

import com.jjobkorea.dto.GoogleResponseDTO;
import com.jjobkorea.dto.UserDTO;
import com.jjobkorea.mapper.UserMapper;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.oauth2.client.userinfo.DefaultOAuth2UserService;
import org.springframework.security.oauth2.client.userinfo.OAuth2UserRequest;
import org.springframework.security.oauth2.core.OAuth2AuthenticationException;
import org.springframework.security.oauth2.core.user.OAuth2User;
import org.springframework.stereotype.Service;



@Service
public class CustomOAuth2UserService extends DefaultOAuth2UserService {

    private static final Logger log = LoggerFactory.getLogger(CustomOAuth2UserService.class);
    //매퍼 연결하기
    private final UserMapper userMapper;

    public CustomOAuth2UserService(UserMapper userMapper) {
        this.userMapper = userMapper;
    }

    @Override
    public OAuth2User loadUser(OAuth2UserRequest userRequest) throws OAuth2AuthenticationException {

        OAuth2User oAuth2User = super.loadUser(userRequest);

        log.info("oAuth2User.getAttribute():{}", oAuth2User.getAttributes());

        //구글 registrationId 가져오기
        String registrationId = userRequest.getClientRegistration().getRegistrationId();
        log.info("registrationId :{}",registrationId);

        GoogleResponseDTO googleResponseDTO= new GoogleResponseDTO(oAuth2User.getAttributes());

        //TODO:findByRegistrationId(업데이트)는 일단 하지말고 저장만 하기

        //1. 유저 디티오 객체 선언하고
        UserDTO userDTO = new UserDTO();

        //2. 값 넣어주기
        //아이디 저장
        int index = googleResponseDTO.getEmail().indexOf("@");
        String userId = googleResponseDTO.getEmail().substring(0, index);

        userDTO.setUserId(userId);
        userDTO.setName(googleResponseDTO.getName());
        userDTO.setEmail(googleResponseDTO.getEmail());
        //구직자만
        userDTO.setRole("ROLE_JOB_SEEKER");
        userDTO.setRegistrationId(googleResponseDTO.getProviderId());

        //DB에 넣어주기
        userMapper.saveGoogleUser(userDTO);


        return oAuth2User;
    }

}
