package com.tmi.spring.board.friend.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.tmi.spring.board.friend.model.dto.FriendBoard;
import com.tmi.spring.board.friend.model.service.FriendBoardService;

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
	public ModelAndView FriendBoard(@RequestParam(defaultValue ="0") int cPage, ModelAndView mav) {
		try 
		{
			int numPerPage = 5;
			List<FriendBoard> list = friendBoardService.selectFriendBoardList(cPage, numPerPage);
			log.debug("list = {}", list);
			mav.addObject("list", list);
			
			mav.setViewName("board/friend/friendBoard");
		} catch (Exception e) 
		{
			log.error("게시글 조회 오류", e);
		}
		return mav;
	}
	
	@GetMapping("/board/friend/friendBoardForm.do")
	public void FriendBoardForm() {}
}
