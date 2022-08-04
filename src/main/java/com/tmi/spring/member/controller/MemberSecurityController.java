package com.tmi.spring.member.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import lombok.extern.slf4j.Slf4j;

/**
 * 
 * @생성 김용민
 * @작업 김용민
 *
 */

@Controller
@Slf4j
public class MemberSecurityController {
	
	@GetMapping("/login")
	public String login() {
		log.info("GET / 요청!");
		return "/member/login/login";
	}
	
	@GetMapping("/login/email")
	public String eamilLogin() {
		log.info("GET / 요청!");
		return "/member/login/email";
	}
	@GetMapping("/login/signUp")
	public String eamilSignUp() {
		log.info("GET / 요청!");
		return "/member/login/signUp";
	}
	
}
