package com.tmi.spring.member.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.savedrequest.SavedRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.tmi.spring.member.model.dto.Member;
import com.tmi.spring.member.model.service.MemberService;

import lombok.extern.slf4j.Slf4j;

/**
 * 
 * @생성 김용민 최윤서
 * @작업 김용민 최윤서
 *
 */

@Controller
@Slf4j
@RequestMapping("/login")
@SessionAttributes({"loginMember"})
public class MemberSecurityController {
	@Autowired
	MemberService memberService;
	
	@Autowired
	BCryptPasswordEncoder bcryptPasswordEncoder;
	
	@GetMapping("/memberLogin.do")
	public String memberLogin() {
		return "/member/login/memberLogin";
	}

	@GetMapping("/memberEnroll.do")
	public String memberEnroll() {
		return "/member/login/memberEnroll";
	}
	
	@GetMapping("/findPw.do")
	public String findPw() {
		return "/member/login/findPw";
	}
	
	@GetMapping("/findPwUpdate.do")
	public String findPwUpdate() {
		return "/member/login/findPwUpdate";
	}
	@GetMapping("/findEmail.do")
	public String findEmail() {
		return "/member/login/findEmail";
	}
	
	@PostMapping("/findEmail.do")
	public String findEmail(@RequestParam String mName, @RequestParam String mPhone, Model model, RedirectAttributes redirectAttr) {
		try {
			log.debug("mName = {}",mName);
			log.debug("mPhone = {}",mPhone);
			Member findEmailMember = memberService.searchEmail(mName, mPhone);
			if(findEmailMember != null) {
				String email = findEmailMember.getMEmail();
				redirectAttr.addFlashAttribute("msg", "회원님의 이메일은 " + email + " 입니다. 로그인을 진행해주세요😊");
				return "redirect:/login/memberLogin.do";
				
			} else {
				redirectAttr.addFlashAttribute("msg", "가입하신 회원정보가 없습니다😥");
				return "redirect:/login/findEmail.do";
			}
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}
	
	@PostMapping("/findPwUpdate.do")
	public String findPwUpdate(@RequestParam String mEmail, @RequestParam String mPassword, RedirectAttributes redirectAttr) {
		try {
			mEmail = mEmail.replace(",", "");
			Member member = memberService.emailChk(mEmail);
			String encryptedPassword = bcryptPasswordEncoder.encode(mPassword);
			member.setMPassword(encryptedPassword);
			log.debug("member = {}",member);
			if(member != null) {
				int result = memberService.findPwUpdate(member);
				redirectAttr.addFlashAttribute("msg", "비밀번호를 성공적으로 수정하였습니다. 로그인을 해주세요😃");
			}
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		return "redirect:/login/memberLogin.do";
	}
	
	@PostMapping("/findPw.do")
	public String findPw(@RequestParam String mEmail, @RequestParam String mNickName,RedirectAttributes redirectAttr) {
		log.debug("mEmail,mNickName = {}{}", mEmail, mNickName);
		try {
			Member member = memberService.emailChk(mEmail);
			log.info("member = {}", member);
			
			if(member != null && mNickName.equals(member.getMNickName())) {
				redirectAttr.addAttribute("mEmail", mEmail);
				redirectAttr.addFlashAttribute("msg", "인증성공🎉 비밀번호를 변경해주세요.");
				return "redirect:/login/findPwUpdate.do";
			}
			else {
				redirectAttr.addFlashAttribute("msg", "조회된 회원이 없습니다.");
				return "redirect:/login/findPw.do";
			}
		} 
		catch(Exception e) {
			e.printStackTrace();
			throw e;
		}
	}
	
	@PostMapping("/loginSuccess.do")
	public String loginSuccess(@AuthenticationPrincipal Member member, HttpSession session, Model model, RedirectAttributes redirectAttr) {
		log.debug("loginSuccess");

		// security redirect사용하기
		SavedRequest savedRequest = (SavedRequest) session.getAttribute("SPRING_SECURITY_SAVED_REQUEST");
		String location = "/";
		if(savedRequest != null)
			location = savedRequest.getRedirectUrl();
		
		log.debug("location = {}", location);
//		return "redirect:" + location;
		return "redirect:/";
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
			
			if(result > 0) {
				redirectAttr.addFlashAttribute("msg", "환영합니다🤗 로그인을 진행해주세요.");
			} else {
				redirectAttr.addFlashAttribute("msg", "회원 가입 과정에서 문제가 발생했습니다.");
			}

			
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		return "redirect:/login";
	}

	//이메일 인증
	@GetMapping("/mailCheck")
	@ResponseBody
	public String mailCheck(String mEmail) {
		return "/member/login/memberEnroll";
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
