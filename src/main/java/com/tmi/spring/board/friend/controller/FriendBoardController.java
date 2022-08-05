package com.tmi.spring.board.friend.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.tmi.spring.board.friend.model.dto.FriendBoard;
import com.tmi.spring.board.friend.model.service.FriendBoardService;
import com.tmi.spring.common.HelloSpringUtils;

import lombok.extern.slf4j.Slf4j;

/**
 * 
 * @생성 김용민
 * @작업 이경석
 *
 */

@Controller
@Slf4j
public class FriendBoardController {
	
	@Autowired
	FriendBoardService friendBoardService;

	@GetMapping("/board/friend/friendBoard.do")
	public ModelAndView FriendBoard(@RequestParam(defaultValue = "1") int cPage, ModelAndView mav, HttpServletRequest request) {
		try {
			int numPerPage = 5;
			List<FriendBoard> list = friendBoardService.selectFriendBoardList(cPage, numPerPage);
			log.debug("list = {}", list);
			mav.addObject("list", list);
			
			int totalContent = friendBoardService.selectTotalContent();
			String url = request.getRequestURI();

			log.debug("totalContent = {}", totalContent);
			String pagebar = HelloSpringUtils.getPagebar(cPage, numPerPage, totalContent, url);
			log.debug("pagebar = {}", pagebar);
			mav.addObject("pagebar", pagebar);
			
			mav.setViewName("board/friend/friendBoard");
		} catch (Exception e) {
			log.error("게시글 목록 조회 오류",e);
		}
		return mav;
	}
	
	@GetMapping("/board/friend/friendBoardForm.do")
	public void FriendBoardForm() {}
}
