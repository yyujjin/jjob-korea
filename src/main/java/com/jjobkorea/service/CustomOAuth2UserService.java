package com.jjobkorea.service;

import com.jjobkorea.dto.CustomOAuth2User;
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

        String registrationId = userRequest.getClientRegistration().getRegistrationId();
        log.info("registrationId :{}",registrationId);

        GoogleResponseDTO googleResponseDTO= new GoogleResponseDTO(oAuth2User.getAttributes());

        UserDTO userDTO = new UserDTO();

        int index = googleResponseDTO.getEmail().indexOf("@");
        String userId = googleResponseDTO.getEmail().substring(0, index);

        userDTO.setUserId(userId);
        userDTO.setName(googleResponseDTO.getName());
        userDTO.setEmail(googleResponseDTO.getEmail());

        userDTO.setRole("ROLE_JOB_SEEKER");
        userDTO.setRegistrationId(googleResponseDTO.getProviderId());

        UserDTO findUser = userMapper.findByRegistrationId(googleResponseDTO.getProviderId());
        if (findUser == null) {

            userMapper.saveGoogleUser(userDTO);
        }

        return new CustomOAuth2User(userDTO);
    }

}
