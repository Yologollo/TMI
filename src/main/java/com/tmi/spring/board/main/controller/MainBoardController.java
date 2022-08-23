package com.tmi.spring.board.main.controller;

import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ResourceLoader;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.tmi.spring.board.planner.model.dto.PlannerBoard;
import com.tmi.spring.board.planner.model.service.PlannerBoardService;
import com.tmi.spring.board.review.model.dto.ReviewBoard;
import com.tmi.spring.board.review.model.service.ReviewBoardService;
import com.tmi.spring.common.HelloSpringUtils;
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
public class MainBoardController {
	
	@Autowired
	ReviewBoardService reviewBoardService;
	
	@Autowired
	PlannerBoardService plannerBoardService;
	
	@Autowired
	ServletContext application;
	
	@Autowired
	ResourceLoader resourceLoader;
	
	@Autowired
	PlannerService plannerService;
	
	@GetMapping("/board")
	public ModelAndView mainBoard( @RequestParam(defaultValue = "1") int cPage, ModelAndView mav, HttpServletRequest request, Model model) {
		try {
			int numPerPage = 3;
			List<ReviewBoard> list3 = reviewBoardService.selectMainReviewBoardList(cPage, numPerPage);
			Iterator<ReviewBoard> it = list3.iterator();
			
			log.debug("list3 = {}", list3);
			mav.addObject("list3", list3);
			
			int numPerPage2 = 4;
			List<PlannerBoard> plannerList = plannerBoardService.selectMainPlannerBoardList(cPage, numPerPage2);
			List<PlannerPlan> plans = plannerBoardService.findPlansList(plannerList);
			Iterator<PlannerBoard> it2 = plannerList.iterator();
			
			log.debug("plannerList = {}", plannerList);
			log.debug("plans = {}", plans);
			mav.addObject("plannerList", plannerList);
			mav.addObject("plans", plans);

			
			int totalContent = reviewBoardService.selectTotalContent();
			String url = request.getRequestURI();
			log.debug("url = {}", url);

			while(it.hasNext()) {
				ReviewBoard boardEntity = it.next();
				
				//Jsoup를 이용해서 첫번째 img의 src의 값을 팡싱한 후 값을 저장
				Document doc = Jsoup.parse(boardEntity.getRb_content());
				if(doc.selectFirst("img") != null) {
					String src = doc.selectFirst("img").attr("src");
					boardEntity.setRb_content(src);
				}
			}
			
			while(it2.hasNext()) {
				PlannerBoard boardEntity2 = it2.next();
				
				//Jsoup를 이용해서 첫번째 img의 src의 값을 팡싱한 후 값을 저장
				Document doc2 = Jsoup.parse(boardEntity2.getPb_content());
				if(doc2.selectFirst("img") != null) {
					String src2 = doc2.selectFirst("img").attr("src");
					boardEntity2.setPb_content(src2);
				}
			}
			
			
			
			log.debug("totalContent = {}", totalContent);
			String pagebar = HelloSpringUtils.getPagebar(cPage, numPerPage, totalContent, url);
			String pagebar2 = HelloSpringUtils.getPagebar(cPage, numPerPage2, totalContent, url);
			log.debug("pagebar = {}", pagebar);
			mav.addObject("pagebar", pagebar);
			mav.addObject("pagebar2", pagebar2);
			
			mav.setViewName("board/main/mainBoard");	
			
		} catch (Exception e) {
			log.error("게시글 목록 조회 오류",e);
			throw e;
		}
		return mav;
	}
	
//	@GetMapping("/board")
//	public ModelAndView mainBoard( @RequestParam(defaultValue = "1") int cPage, ModelAndView mav, HttpServletRequest request, Model model) {
//		try {
//			int numPerPage = 3;
//			List<ReviewBoard> list3 = reviewBoardService.selectMainReviewBoardList(cPage, numPerPage);
//			Iterator<ReviewBoard> it = list3.iterator();
//
//			log.debug("list3 = {}", list3);
//			mav.addObject("list3", list3);
//			
//			int totalContent = reviewBoardService.selectTotalContent();
//			String url = request.getRequestURI();
//			log.debug("url = {}", url);
//
//			while(it.hasNext()) {
//				ReviewBoard boardEntity = it.next();
//				
//				//Jsoup를 이용해서 첫번째 img의 src의 값을 팡싱한 후 값을 저장
//				Document doc = Jsoup.parse(boardEntity.getRb_content());
//				if(doc.selectFirst("img") != null) {
//					String src = doc.selectFirst("img").attr("src");
//					boardEntity.setRb_content(src);
//				}
//			}
//			
//			log.debug("totalContent = {}", totalContent);
//			String pagebar = HelloSpringUtils.getPagebar(cPage, numPerPage, totalContent, url);
//			log.debug("pagebar = {}", pagebar);
//			mav.addObject("pagebar", pagebar);
//			
//			mav.setViewName("board/main/mainBoard");	
//			
//		} catch (Exception e) {
//			log.error("게시글 목록 조회 오류",e);
//			throw e;
//		}
//		return mav;
//	}
	
}
