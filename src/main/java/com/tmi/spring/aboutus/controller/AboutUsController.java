package com.tmi.spring.aboutus.controller;

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
public class AboutUsController {
	
	@GetMapping("/aboutus")
	public String index() {
		log.info("GET / 요청!");
		return "/aboutus/aboutus";
	}
}
