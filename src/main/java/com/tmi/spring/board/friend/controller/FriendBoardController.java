 package com.tmi.spring.board.friend.controller;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import com.tmi.spring.board.friend.model.dto.FriendBoard;
import com.tmi.spring.board.friend.model.dto.InsertFriendBoard;
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
@SessionAttributes({"loginMember", "next"})
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
			throw e;
		}
		return mav;
	}
	
	@GetMapping("/board/friend/friendBoardForm.do")
	public void FriendBoardForm() {}
	
	@RequestMapping(value = "/board/friend/friendBoardEnroll.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String FriendBoardEnroll(InsertFriendBoard insertFriendBoard, RedirectAttributes redirectAttr) {
		try {
			log.debug("friendBoard = {}",insertFriendBoard);
			
			int result = friendBoardService.insertFriendBoard(insertFriendBoard);
			
//			redirectAttr.addFlashAttribute("msg","게시글을 성공적으로 등록했습니다.");
			
		} catch (Exception e) {
			log.error("게시글 등록 오류", e);
			throw e;
		}
		
		return "redirect:/board/friend/friendBoard.do";
	}

}






