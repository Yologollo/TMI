package com.tmi.spring.planner.controller;

import java.sql.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.tmi.spring.member.model.dto.Member;
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
	
	@GetMapping("/myplanner")
	public String myPlanner(@AuthenticationPrincipal Member member, Model model) {
		try {
			String memberEmail = member.getMEmail();
			log.debug("memberEmail = {}", memberEmail);
			
			List<Planner> plannerList = plannerService.findPlannerByEmail(memberEmail);
			log.debug("plannerList = {}", plannerList);
			
//			model.addAttribute("memberEmail", memberEmail);
			model.addAttribute("plannerList", plannerList);
			
//			List<Planner> plannerList = plannerService.findPlanner();
			
		} catch (Exception e) {
			log.error("Planner 조회 오류", e);
			throw e;
		}
		return "/planner/myplanner";
	}
	
	@PostMapping("/createPlanner.do")
	public String createPlanner(@ModelAttribute Planner planner, RedirectAttributes redirectAttr) {
		try {
			// 업무로직
			int result = plannerService.createPlanner(planner);
			log.debug("createplanner = {}", planner);
		} catch (Exception e) {
			log.error("Planner 생성 오류", e);
			throw e;
		}
		return "redirect:/planner/createplan.do?pNo=" + planner.getPNo();
	}
	
	@GetMapping("/createplan.do")
	public void createPlan(@RequestParam int pNo, Model model) {
		try {
			Planner planner = plannerService.selectOnePlanner(pNo);
			log.debug("planner = {}", planner);
			
			List<Date> days = plannerService.selectPlanDateList(planner.getPLeaveDate(), planner.getPReturnDate());
			log.debug("days = {}", days);
	
			model.addAttribute("days", days);
			model.addAttribute("planner", planner);
		} catch (Exception e){
			log.error("플래너 조회 오류", e);
		}
	}
	
//	@GetMapping("/createplan.do")
//	public ModelAndView createPlan(@RequestParam int pNo, ModelAndView mav) {
//		try {
//			Planner planner = plannerService.selectOnePlanner(pNo);
//			log.debug("planner = {}", planner);
//			
//			
//			
//			mav.addObject("planner", planner);
//			mav.setViewName("planner/createplan");
//		} catch (Exception e){
//			log.error("플래너 조회 오류", e);
//			throw e;
//		}
//		return mav;
//	}
	
	
	
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
