package com.tmi.spring.admin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.tmi.spring.admin.model.service.AdminListService;

import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/admin")
@Slf4j
public class AdminListController {
	
	
	@Autowired
	AdminListService adminListService;

	@GetMapping("/memberList.do")  //GET 요청 없는 경우의 화면
	public void memberList() {
		log.debug("/admin/memberList.do 요청!");
		
	}
	
	@GetMapping("/noticeList")
	public String noticeList() {
		log.info("GET / 요청!");
		return "/admin/noticeList";
	}

	
	
//	@GetMapping("/members")
//    public String list(Model model){
//        List<Member> members = memberService.findMembers();
//        model.addAttribute("members", members);
//        return "members/memberList";
//    }
}
