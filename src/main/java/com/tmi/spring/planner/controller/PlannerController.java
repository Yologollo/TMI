package com.tmi.spring.planner.controller;

import java.time.LocalDate;
import java.time.Period;
import java.util.ArrayList;
import java.util.List;

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
	public String myPlanner(@AuthenticationPrincipal Member member, Planner planner, Model model) {
		try {
			String memberEmail = member.getMEmail();
			log.debug("memberEmail = {}", memberEmail);
			
			List<Planner> plannerList = plannerService.findPlannerByEmail(memberEmail);
			log.debug("plannerList = {}", plannerList);
			
			List<PlannerPlan> plans = plannerService.findPlansList(plannerList);
			log.debug("plans = {}", plans);
			
			model.addAttribute("plannerList", plannerList);
			model.addAttribute("plans", plans);
						
		} catch (Exception e) {
			log.error("Planner 조회 오류", e);
			throw e;
		}
		return "/planner/myplanner";
	}
	

	@PostMapping("/createPlanner.do")
	public String createPlanner(@ModelAttribute Planner planner, RedirectAttributes redirectAttr) {
		try {
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

			LocalDate start = planner.getPLeaveDate();
	        LocalDate end = planner.getPReturnDate();
	        
	        Period period = Period.between(start, end); // 날짜차이 조회
	        log.debug("days = {}", period.getDays());

	        List<LocalDate> days = new ArrayList<>();
	        for(int i = 0; i < period.getDays(); i++){
	            days.add(start.plusDays(i)); // 몇일후
	        }
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
			planner = plannerService.selectOnePlanner(planner.getPNo());
			log.debug("planner = {}", planner);
			
			List<PlannerPlan> plans = plannerService.selectPlannerPlanList(planner.getPNo());
			log.debug("plans = {}", plans);
			
			LocalDate start = planner.getPLeaveDate();
	        LocalDate end = planner.getPReturnDate();
	        
	        Period period = Period.between(start, end); // 날짜차이 조회
	        log.debug("daysCount = {}", period.getDays());

	        List<LocalDate> days = new ArrayList<>();
	        for(int i = 0; i < period.getDays(); i++){
	            days.add(start.plusDays(i)); // 몇일후
	        }
	        
	        log.debug("days = {}", days);

	        model.addAttribute("days", days);
			model.addAttribute("planner", planner);
	        model.addAttribute("plans", plans);
						
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
	
	// 플래너 플랜 저장
	@PostMapping("/savePlanner.do")
	public ResponseEntity<?> savePlanner(@RequestBody(required = false) List<PlannerPlan> planList) {		
		log.debug("planListTest = {}", planList);
		try {		
			int result = plannerService.savePlannerPlan(planList);
			log.debug("planList = {}", planList);	
		} catch (Exception e) {
			log.error("Plan 저장 오류", e);
		}
		
		return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).build();
	}

}
