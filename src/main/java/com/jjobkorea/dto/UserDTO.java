package com.jjobkorea.dto;

import java.sql.Date;

import lombok.Data;

@Data
public class UserDTO {

	private int id;
	//유저 아이디
	private String userId;
	//패스워드
	private String password;
	//유저 이름
	private String name;
	//폰 번호
	private String phone;
	//주소
	private String addr;
	//이메일
	private String email;
	//생년월일
	private Date birthd;
	//성별 m(남자), f(여자)
	private String gender;
	//회원 가입 일자
	private Date registrationDate;
	//유저 타입 => 구직자(1), 기업(2)로 구분
	private int userType;
}
