package com.tmi.spring.planner.controller;

import java.sql.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.tmi.spring.member.model.dto.Member;
import com.tmi.spring.planner.model.dto.Planner;
import com.tmi.spring.planner.model.dto.PlannerPlan;
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
	
	// My 플래너 페이지 작업
	@GetMapping("/myplanner")
	public String myPlanner(@AuthenticationPrincipal Member member, Model model) {
		try {
			String memberEmail = member.getMEmail();
			log.debug("memberEmail = {}", memberEmail);
			
			List<Planner> plannerList = plannerService.findPlannerByEmail(memberEmail);
			log.debug("plannerList = {}", plannerList);
			
			model.addAttribute("plannerList", plannerList);
						
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
		}

		return "redirect:/planner/createplan.do?pNo=" + planner.getPNo();
		
	}
	
	// 플랜 페이지 작업
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
	
	// 디테일 플래너 페이지 작업
	@GetMapping("/detailPlanner.do")
	public String detailPlanner(Planner planner, Model model) {
		try {
			
			int pNo = planner.getPNo();
			log.debug("pNo = {}", pNo);
			
			List<Planner> plannerList = plannerService.findPlannerBypNo(pNo);
			log.debug("plannerList = {}", plannerList);
			
			model.addAttribute("pNo", pNo);
			model.addAttribute("plannerList", plannerList);
						
		} catch (Exception e) {
			log.error("Planner 조회 오류", e);
			throw e;
		}
		return "/planner/detailplanner";
	}
	
	// 디테일 플래너 페이지 삭제
	@PostMapping("/deletePlanner.do")
	public String deletePlanner(@RequestParam int pNo, RedirectAttributes redirectAttr) {
		try {
			
			int result = plannerService.deletePlanner(pNo);
						
		} catch (Exception e) {
			log.error("Planner 삭제 오류", e);
			throw e;
		}
		return "redirect:/planner/myplanner";
	}
	
	// 플랜 페이지 닫기
	@PostMapping("/cnacelPlanner.do")
	public String cnacelPlanner(@RequestParam int pNo, RedirectAttributes redirectAttr) {

		return "redirect:/planner/myplanner";
	}
	
	// 플랜 페이지 저장
//	@PostMapping("/savePlanner.do")
//	public ResponseEntity<?> savePlanner(@RequestBody PlannerPlan plan) {	
//		log.debug("planList = {}", plan);
//		Map<String, Object> map = new HashMap<>();
//		try {						
//			int result = plannerService.savePlannerPlan(plan);
//			map.put("msg", "플랜을 정상적으로 등록했습니다.");
//			return ResponseEntity.ok(map); 
//		} catch (Exception e) {
//			log.error("Plan 저장 오류", e);
//			map.put("msg", "플랜 등록 오류!");
//			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(map);
//		}	
//	}
	
	@PostMapping("/savePlanner.do")
	public ResponseEntity<?> savePlanner(@RequestBody List<PlannerPlan> planList) {		
		try {						
			int result = plannerService.savePlannerPlan(planList);
			log.debug("planList = {}", planList);
		} catch (Exception e) {
			log.error("Plan 저장 오류", e);
		}
		return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).build();
		
	}
	
//	@PostMapping("/savePlanner.do")
//	public String savePlanner(@RequestParam int pNo, RedirectAttributes redirectAttr) {
//		try {						
//			Planner planner = plannerService.selectOnePlanner(pNo);
//			int result = plannerService.savePlannerPlan(pNo);
//			
//		} catch (Exception e) {
//			log.error("Plan 저장 오류", e);
//			throw e;
//		}
//		
//		return "redirect:/planner/detailPlanner.do?pNo=" + pNo;
//	}
	
	@PostMapping("/planInsert.do")
	public void planInsert() {
		

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
}
