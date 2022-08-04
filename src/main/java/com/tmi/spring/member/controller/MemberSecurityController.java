package com.tmi.spring.member.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.tmi.spring.member.model.dto.Member;
import com.tmi.spring.member.model.service.MemberService;

import lombok.extern.slf4j.Slf4j;

/**
 * 
 * @생성 김용민
 * @작업 김용민
 *
 */

@Controller
@Slf4j
@RequestMapping("/login")
@SessionAttributes({"loginMember", "next"})
public class MemberSecurityController {
	@Autowired
	MemberService memberService;
	
	@Autowired
	BCryptPasswordEncoder bcryptPasswordEncoder;
	
	@GetMapping("/login")
	public String login() {
		return "/member/login/login";
	}
	
	@GetMapping("/memberLogin.do")
	public String memberLogin() {
		return "/member/login/memberLogin";
	}
	@GetMapping("/memberEnroll.do")
	public String memberEnroll() {
		return "/member/login/memberEnroll";
	}
	
	@PostMapping("/memberEnroll.do")
	public String memberEnroll(Member member, RedirectAttributes redirectAttr) {
		log.debug("member = {}", member);
		try {
			// 암호화처리
			String rawPassword = member.getMPassword();
			String encryptedPassword = bcryptPasswordEncoder.encode(rawPassword);
			member.setMPassword(encryptedPassword);
			log.info("encryptedPassword = {}", encryptedPassword);
			
			int result = memberService.insertMember(member);
			
			redirectAttr.addFlashAttribute("msgIcon", "success");
			redirectAttr.addFlashAttribute("msgTitle", "회원가입");
			redirectAttr.addFlashAttribute("msgContent", "성공적으로 회원가입했습니다.");
			
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		return "redirect:/";
	}
	
	@PostMapping("/memberLogin.do")
	public String memberLogin(
			@RequestParam String mEmail,
			@RequestParam String mPassword,
			RedirectAttributes redirectAttr,
			@SessionAttribute(required = false) String next, 
			HttpSession session,
			Model model) {
			log.info("memberId = {}, password = {}", mEmail, mPassword);
			
			try {
				Member member = memberService.selectOneMember(mEmail);
				log.info("member = {}", member);
				
				if(member != null && bcryptPasswordEncoder.matches(mPassword, member.getMPassword())) {
					
					model.addAttribute("loginMember",member);
					log.info("next = {}", next);
					
					String location = next != null ? next : "/";
					return "redirect:" + location;
				}
				else {
					redirectAttr.addFlashAttribute("msg", "아이디 또는 비밀번호가 일치하지 않습니다.");
					return "redirect:/login/memberLogin.do";
				}
			} 
			catch(Exception e) {
				e.printStackTrace();
				throw e;
			}
	}
	
	@GetMapping("/memberLogout.do")
	public String memberLogout(SessionStatus sessionStatus, ModelMap modelMap) {
		// modelMap 속성 완전 제거
		modelMap.clear();
		
		// 사용완료 마킹처리 (세션객체 자체를 폐기하지 않는다.)
		if(!sessionStatus.isComplete())
			sessionStatus.setComplete();
		
		return "redirect:/";
	}
	
}
