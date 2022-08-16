package com.tmi.spring.admin.notice.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.tmi.spring.admin.notice.model.dto.NoticeBoard;
import com.tmi.spring.admin.notice.model.service.NoticeBoardService;

import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/notice")
@Slf4j
public class NoticeBoardController {
	
	@Autowired
	NoticeBoardService noticeBoardService;
	
	@GetMapping("/admin/notice/noticeBoard.do")
	public ModelAndView noticeBoard(@RequestParam(defaultValue = "1") int cPage,ModelAndView mav, HttpServletRequest request) {
		try {
			// 목록조회
			int numPerPage = 5;
			List<NoticeBoard> list = noticeBoardService.selectNoticeBoardList(cPage, numPerPage);
			log.debug("list = {}", list);
			mav.addObject("list", list);
			
			//viewName설정
			mav.setViewName("admin/notice/noticeBoard");
		} catch (Exception e) {
			log.error("공지사항 목록 조회 오류",e);
		}
		
		return mav;
	}
}
