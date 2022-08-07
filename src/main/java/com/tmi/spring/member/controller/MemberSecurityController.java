package com.tmi.spring.member.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
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

	@GetMapping("/checkEmail.do")
	public ResponseEntity<?> checkEmail(@RequestParam String mEmail) {
		Map<String, Object> map = new HashMap<>();
		try {
			Member member = memberService.emailChk(mEmail);
			boolean available = member == null;
			
			map.put("mEmail", mEmail);
			map.put("available", available);
			
		} catch (Exception e) {
			log.error("중복이메일 체크 오류", e);
			
			map.put("error", e.getMessage());
			
			return ResponseEntity
					.status(HttpStatus.INTERNAL_SERVER_ERROR)
					.header(HttpHeaders.CONTENT_TYPE, MediaType.APPLICATION_JSON_UTF8_VALUE)
					.body(map);
			
		}
		return ResponseEntity
				.status(HttpStatus.OK)
				.header(HttpHeaders.CONTENT_TYPE, MediaType.APPLICATION_JSON_UTF8_VALUE)
				.body(map);
				
	}
	@GetMapping("/checkNickname.do")
	public ResponseEntity<?> checkNickname(@RequestParam String mNickName) {
		Map<String, Object> map = new HashMap<>();
		try {
			Member member = memberService.NickNameChk(mNickName);
			boolean available = member == null;
			
			map.put("mEmail", mNickName);
			map.put("available", available);
			
		} catch (Exception e) {
			log.error("중복닉네임 체크 오류", e);
			
			map.put("error", e.getMessage());
			
			return ResponseEntity
					.status(HttpStatus.INTERNAL_SERVER_ERROR)
					.header(HttpHeaders.CONTENT_TYPE, MediaType.APPLICATION_JSON_UTF8_VALUE)
					.body(map);
			
		}
		return ResponseEntity
				.status(HttpStatus.OK)
				.header(HttpHeaders.CONTENT_TYPE, MediaType.APPLICATION_JSON_UTF8_VALUE)
				.body(map);
		
	}
}
