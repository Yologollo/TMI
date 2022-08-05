package com.tmi.spring.planner;

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
public class PlannerController {

	@GetMapping("/planner/myPlanner")
	public String myPlanner() {
		log.info("GET / 요청!");
		return "/planner/myplanner";
	}
	
	@GetMapping("/planner/sharePlanner")
	public String sharePlanner() {
		log.info("GET / 요청!");
		return "/planner/shareplanner";
	}
	
	@GetMapping("/planner/lovePlanner")
	public String lovePlanner() {
		log.info("GET / 요청!");
		return "/planner/loveplanner";
	}
	
	@GetMapping("/planner/createPlanner.do")
	public String createPlanner() {
		log.info("GET / 요청!");
		return "/planner/createplanner";
	}
	
	@GetMapping("/planner/detailPlanner.do")
	public String detailPlanner() {
		log.info("GET / 요청!");
		return "/planner/detailplanner";
	}
	
	@GetMapping("/planner/testPlanner.do")
	public String testPlanner() {
		log.info("GET / 요청!");
		return "/planner/plannertest";
	}
	
	
	
}
