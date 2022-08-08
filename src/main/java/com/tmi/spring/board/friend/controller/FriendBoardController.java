 package com.tmi.spring.board.friend.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.tmi.spring.board.friend.model.dto.FriendBoard;
import com.tmi.spring.board.friend.model.dto.FriendBoardAttachment;
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
	
	@Autowired
	ServletContext application;

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
	
//	@RequestMapping(value = "/board/friend/friendBoardEnroll.do", method = {RequestMethod.GET, RequestMethod.POST})
	@PostMapping("/board/friend/friendBoardEnroll.do")
	public String FriendBoardEnroll(InsertFriendBoard insertFriendBoard, 
									@RequestParam("upFile")MultipartFile[] upFiles, 
									RedirectAttributes redirectAttr) {
		try {
			log.debug("friendBoard = {}", insertFriendBoard);
//			log.debug("application = {}", application);
//			log.debug("saveDirectory = {}", saveDirectory);
			
			String saveDirectory = application.getRealPath("/resources/upload/friendboard");
			
			
			for(MultipartFile upFile : upFiles)
			{
				if(upFile.getSize() > 0)
				{
					String originalFilename = upFile.getOriginalFilename();
					String renamedFilename = HelloSpringUtils.getRenamedFilename(originalFilename);
					log.debug("renamedFilename = {}", renamedFilename);
					
					File destFile = new File(saveDirectory, renamedFilename);
					upFile.transferTo(destFile);
					
					FriendBoardAttachment attach = new FriendBoardAttachment();
					attach.setFba_original_filename(originalFilename);
					attach.setFba_renamed_filename(renamedFilename);
					insertFriendBoard.addAttachment(attach);
				}
			}
			
			int result = friendBoardService.insertFriendBoard(insertFriendBoard);
			
//			redirectAttr.addFlashAttribute("msg","게시글을 성공적으로 등록했습니다.");
			
		} catch(IOException e) {
			log.error("첨부파일 저장 오류", e);
			
		} catch (Exception e) {
			log.error("게시글 등록 오류", e);
			throw e;
		}
		
		return "redirect:/board/friend/friendBoard.do";
	}
	
	@GetMapping("/board/friend/friendBoardDetail.do")
	public ModelAndView FriendBoardDetail(@RequestParam int no, ModelAndView mav) {
		try {
			InsertFriendBoard insertFriendBoard = friendBoardService.selectOneFriendBoard(no);
			log.debug("insertFriendBoard = {}", insertFriendBoard);
			
			mav.addObject("insertFriendBoard", insertFriendBoard);
			mav.setViewName("board/friend/friendBoardDetail");
			
		} catch (Exception e) {
			log.error("게시글 조회 오류", e);
			throw e;
		}
		return mav;
	}

}






