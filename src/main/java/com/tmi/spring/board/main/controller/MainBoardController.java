package com.tmi.spring.board.main.controller;

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
public class MainBoardController {
	
//	@GetMapping("/board/planner/plannerBoard.do")
//	public void plannerBoard() {
//		log.info("GET / 요청!");
//	}
	
	@GetMapping("/board/bestplanner/bestPlanner.do")
	public void bestPlanner() {
		log.info("GET / 요청!");
	}
	
}
