package com.jjobkorea.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;


@Controller
public class TestController {
	@GetMapping("/test")
	public String test() {
		System.err.println("test 실행됨");
		return "hello";
	}
}
