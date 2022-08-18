package com.tmi.spring.admin.notice.controller;

import java.io.File;
import java.io.IOException;
import java.time.LocalDate;
import java.time.Period;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.tmi.spring.admin.notice.model.dto.InsertNoticeBoard;
import com.tmi.spring.admin.notice.model.dto.NoticeBoard;
import com.tmi.spring.admin.notice.model.dto.NoticeBoardAttachment;
import com.tmi.spring.admin.notice.model.service.NoticeBoardService;
import com.tmi.spring.board.friend.model.dto.InsertFriendBoard;
import com.tmi.spring.board.review.model.dto.InsertReviewBoard;
import com.tmi.spring.board.review.model.dto.ReviewBoardAttachment;
import com.tmi.spring.common.HelloSpringUtils;
import com.tmi.spring.planner.model.dto.Planner;

import lombok.extern.slf4j.Slf4j;

@Controller
/* @RequestMapping("/notice") */
@Slf4j
public class NoticeBoardController {
	
	@Autowired
	NoticeBoardService noticeBoardService;
	
	@Autowired
	ServletContext application;
	
	
	@GetMapping("/admin/notice/noticeBoard.do")
	public ModelAndView noticeBoard(@RequestParam(defaultValue = "1") int cPage,ModelAndView mav, HttpServletRequest request) {
		try {
			// 목록조회
			int numPerPage = 5;
			List<NoticeBoard> list = noticeBoardService.selectNoticeBoardList(cPage, numPerPage);
			log.debug("list = {}", list);
			mav.addObject("list", list);
			
			//페이지바
			int totalContent = noticeBoardService.selectTotalContent();
			String url = request.getRequestURI();

			log.debug("totalContent = {}", totalContent);
			String pagebar = HelloSpringUtils.getPagebar(cPage, numPerPage, totalContent, url);
			log.debug("pagebar = {}", pagebar);
			mav.addObject("pagebar", pagebar);
			
			//viewName설정
			mav.setViewName("admin/notice/noticeBoard");
		} catch (Exception e) {
			log.error("공지사항 목록 조회 오류",e);
		}
		 
		return mav;
	}
	// 공지사항 추가폼
	
	@GetMapping("/admin/notice/noticeBoardForm.do")
	public void NoticeBoardform() {	}
	

	@PostMapping("/admin/notice/noticeBoardEnroll.do")
	public String NoticeBoardEnroll(InsertNoticeBoard insertNoticeBoard, 
									@RequestParam("upFile")MultipartFile[] upFiles, 
									RedirectAttributes redirectAttr) {
		try {
			log.debug("noticeBoard = {}", insertNoticeBoard);
			
			String saveDirectory = application.getRealPath("/resources/upload/noticeboard");
			
			
			for(MultipartFile upFile : upFiles)
			{
				if(upFile.getSize() > 0)
				{
					String originalFilename = upFile.getOriginalFilename();
					String renamedFilename = HelloSpringUtils.getRenamedFilename(originalFilename);
					log.debug("renamedFilename = {}", renamedFilename);
					
					File destFile = new File(saveDirectory, renamedFilename);
					upFile.transferTo(destFile);
					
					NoticeBoardAttachment attach = new NoticeBoardAttachment();
					attach.setNbaOriginalFilename(originalFilename);
					attach.setNbaRenamedFilename(renamedFilename);
					insertNoticeBoard.addAttachment(attach);
				}
			}
			
			int result = noticeBoardService.insertNoticeBoard(insertNoticeBoard);
			
		} catch(IOException e) {
			log.error("첨부파일 저장 오류", e);
			
		} catch (Exception e) {
			log.error("게시글 등록 오류", e);
			throw e;
		}
		
		return "redirect:/admin/notice/noticeBoard.do";
	}
				


@GetMapping("/admin/notice/noticeBoardDetail.do")
public ModelAndView NoticeBoardDetail(@RequestParam int no, Model model, ModelAndView mav, HttpServletRequest request, HttpServletResponse response) {
	try {
		log.debug("no = {}", no);			
		InsertNoticeBoard insertNoticeBoard = noticeBoardService.selectOneNoticeBoard(no);
		log.debug("insertNoticeBoard = {}", insertNoticeBoard);			
		
		
		Cookie[] cookies = request.getCookies();
		int visitor = 0;
		
		for(Cookie cookie : cookies)
		{
			log.info(cookie.getName());
			if(cookie.getName().equals("visit"))
			{
				visitor = 1;
				
				log.info("visit통과");
				
				if(cookie.getValue().contains(request.getParameter("no")))
				{						
					log.info("visit no통과");
				}
				else
				{
					cookie.setValue(cookie.getValue()+"_" + request.getParameter("no"));
					cookie.setMaxAge(60*60*24);
					response.addCookie(cookie);
					int result = noticeBoardService.updateReadCount(no);
				}
			}
		}
		
		if(visitor == 0)
		{
			Cookie cookie1 = new Cookie("visit", request.getParameter("no"));
			cookie1.setMaxAge(60*60*24);
			response.addCookie(cookie1);
			int result = noticeBoardService.updateReadCount(no);
		}
		
	

		mav.addObject("insertNoticeBoard", insertNoticeBoard);
		mav.setViewName("admin/notice/noticeBoardDetail");

	} catch (Exception e) {
		log.error("게시글 조회 오류", e);
		throw e;
	}
	return mav;
}



@GetMapping("/admin/notice/noticeBoardDelete.do")
public String noticeBoardDelete(@RequestParam int no) {
	try {
		log.debug("no = {}",no);
		int result = noticeBoardService.deleteNoticeBoard(no);
		
		
	} catch (Exception e) {
		log.error("게시판 삭제 오류",e);
		throw e;
	}
	
	return "redirect:/admin/notice/noticeBoard.do";
}
}