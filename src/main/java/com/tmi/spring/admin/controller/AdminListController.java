package com.tmi.spring.admin.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.tmi.spring.admin.model.dto.AdminList;
import com.tmi.spring.admin.model.service.AdminListService;

import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/admin")
@Slf4j
public class AdminListController {
	
	
	@Autowired
	AdminListService adminListService;

	
	  @GetMapping("/memberList.do") public void memberList() {
	  log.debug("/admin/adminList.do 요청!");
	  
	 }
	 
	
	
	@GetMapping("/adminList.do")
	public ModelAndView adminList(@RequestParam(defaultValue = "1") int cPage, ModelAndView mav) {
		try {
			//목록조회
			int numPerPage = 5;
			List<AdminList> list = adminListService.selectAdminList(cPage, numPerPage);
			log.debug("list = {}",list);
			mav.addObject("list", list);
			
			
			//viewName설정
			mav.setViewName("admin/adminList");
		} catch (Exception e) {
			log.error("회원 목록 조회 오류", e);
		}
		return mav;
	}
	
	
	
	
	
	
	@GetMapping("/noticeBoard")
	public String noticeList() {
		log.info("GET / 요청!");
		return "/admin/noticeBoard";
	}

	
	
//	@GetMapping("/members")
//    public String list(Model model){
//        List<Member> members = memberService.findMembers();
//        model.addAttribute("members", members);
//        return "members/memberList";
//    }
}
