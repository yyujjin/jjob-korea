package com.jjobkorea.dto.user;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class JoinDTO {


	private int id;
	private String userId;
	private String passWord;
	
	
	@Override
	public String toString() {
		return "LoginDTO [id=" + id + ", userId=" + userId + ", passWord=" + passWord + "]";
	}
	
}
