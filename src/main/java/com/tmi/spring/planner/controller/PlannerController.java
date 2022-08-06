package com.tmi.spring.planner.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.tmi.spring.planner.model.dto.Planner;
import com.tmi.spring.planner.model.service.PlannerService;

import lombok.extern.slf4j.Slf4j;

/**
 * 
 * @생성 김용민
 * @작업 김용민
 *
 */

@Controller
@Slf4j
@RequestMapping("/planner")
public class PlannerController {

	@Autowired
	PlannerService plannerService;
	
	@GetMapping("/myPlanner")
	public String myPlanner() {
		log.info("GET / 요청!");
		return "/planner/myplanner";
	}
	
	@PostMapping("/createPlanner.do")
	public String createPlanner(Planner planner, RedirectAttributes redirectAttr) {
		log.info("planner = {}", planner);
		try {
			// 업무로직
			int result = plannerService.createPlanner(planner);
			log.info("planner = {}", planner);
		} catch (Exception e) {
			log.error("Planner 생성 오류", e);
			throw e;
		}
		return "redirect:/planner/createPlannerPlan";
	}
	
	@GetMapping("/sharePlanner")
	public String sharePlanner() {
		log.info("GET / 요청!");
		return "/planner/shareplanner";
	}
	
	@GetMapping("/lovePlanner")
	public String lovePlanner() {
		log.info("GET / 요청!");
		return "/planner/loveplanner";
	}
	
	@GetMapping("/createPlannerPlan")
	public String createPlannerPlan() {
		log.info("GET / 요청!");
		return "/planner/createplannerplan";
	}
	
	@GetMapping("/detailPlanner.do")
	public String detailPlanner() {
		log.info("GET / 요청!");
		return "/planner/detailplanner";
	}
	
	@GetMapping("/testPlanner.do")
	public String testPlanner() {
		log.info("GET / 요청!");
		return "/planner/plannertest";
	}
	
	
	
}
