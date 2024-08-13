package com.jjobkorea.dto;

public interface OAuth2Response {
    //제공자 이름 : 구글
    String getProvider();
    //제공자에서 유저에 대한 번호를 부여
    String getProviderId();
    //이메일
    String getEmail();
    //사용자 실명
    String getName();
}
