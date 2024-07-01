package com.jjobkorea.controller.home;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class home {

	
	@RequestMapping("/test")
	public String test() {
		System.out.println("실행됨");
		return "hello";
	}
	
	
}
