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
		return "redirect:/login";
	}

	@GetMapping("/checkEmail")
	public String checkEmail(@RequestParam String mEmail, Model model) {
		try {
			Member member = memberService.selectOneMember(mEmail);
			boolean available = member == null;
			
			model.addAttribute("mEmail", mEmail);
			model.addAttribute("available", available);
			
		}catch (Exception e) {
			log.debug("중복 이메일 체크오류");
		}
		
		return "jsonView";
	}
}
