package com.jjobkorea.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MainController {
	@GetMapping("/main")
	public String enterMain() {
		System.err.println("test 실행됨");
		return "main/main";
	}
}
