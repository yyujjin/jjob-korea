package com.jjobkorea.service;

import com.jjobkorea.dto.CustomOAuth2User;
import com.jjobkorea.dto.GoogleResponse;
import com.jjobkorea.dto.OAuth2Response;
import com.jjobkorea.dto.UserDTO;
import com.jjobkorea.mapper.UserMapper;
import org.apache.catalina.User;
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
    private final UserMapper userMapper;

    public CustomOAuth2UserService(UserMapper userMapper) {
        this.userMapper = userMapper;
    }

    @Override
    public OAuth2User loadUser(OAuth2UserRequest userRequest) throws OAuth2AuthenticationException {

        OAuth2User oAuth2User = super.loadUser(userRequest);

        log.info("oAuth2User.getAttribute():{}", oAuth2User.getAttributes());

        String registrationId = userRequest.getClientRegistration().getRegistrationId();

        /*  OAuth2Response oAuth2Response = null;*/
        /*       GoogleResponse googleResponse = null;*/

        GoogleResponse googleResponse;
        if (registrationId.equals("google")) {
            googleResponse = new GoogleResponse(oAuth2User.getAttributes());

        } else {
            return null;
        }

        String googleIdentity = googleResponse.getProvider() + " " + googleResponse.getProviderId();
        UserDTO existData = userMapper.findGoogleIdentity(googleResponse.getProviderId());
        log.info("왜 : {}",existData);
        //구직자만
        String role = "ROLE_JOB_SEEKER";

        log.info("DDDDDD : {}", googleResponse);

        if (existData == null) {
            log.info("여기로 왔음 ");
            UserDTO userDTO = new UserDTO();
            //아이디 저장
            int index = googleResponse.getEmail().indexOf("@");
            String userId = googleResponse.getEmail().substring(0, index);
            userDTO.setUserId(userId);
            //이름 저장
            userDTO.setName(googleResponse.getName());
            //이메일
            userDTO.setEmail(googleResponse.getEmail());
            //권한 저장
            userDTO.setRole(role);
            //인증번호 저장
            userDTO.setGoogleIdentity(googleResponse.getProviderId());

            userMapper.saveGoogleUserInfo(userDTO);

        }
        //만약 있다면 유저 정보가 업데이트 됐을 수도 있으니 없데이트 해줘야함
        /*else {
            UserDTO userDTO = new UserDTO();

            userDTO.setName();
            //이거 로직 어케 짜주지

            existData.setUsername(username);
            existData.setEmail(oAuth2Response.getEmail());

            role = existData.getRole();

            userRepository.save(existData);
        }*/

        return new CustomOAuth2User(googleResponse, role);

    }
}



//인증 데이터 규격 설정