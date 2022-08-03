package com.tmi.spring.tourism.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import lombok.extern.slf4j.Slf4j;

/**
 * 
 * @생성 전인찬
 * @작업 전인찬
 *
 */

@Controller
@Slf4j
public class TourismController {

	@GetMapping("/tourism")
	public String index() {
		log.info("GET / 요청!");
		return "/tourism/tourism";
	}
	
}
