package com.tmi.spring.member.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.tmi.spring.common.HelloSpringUtils;
import com.tmi.spring.member.model.dto.Member;
import com.tmi.spring.member.model.dto.MemberFriendBoard;
import com.tmi.spring.member.model.dto.MemberPlannerBoard;
import com.tmi.spring.member.model.dto.MemberReviewBoard;
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
@RequestMapping("/mypage")
@SessionAttributes({"loginMember"})
public class MyPageController {
	
	@Autowired
	MemberService memberService;
	
	@Autowired
	BCryptPasswordEncoder bcryptPasswordEncoder;
	
	@GetMapping("/memberDetail.do")
	public String memberDetail(@AuthenticationPrincipal Member member, Model model) {
		log.debug("member = {}", member);
		
		model.addAttribute(member);
		return "/member/mypage/memberDetail";
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
	
	@PostMapping("/memberUpdate.do")
	public String memberUpdate(Member updateMember, @AuthenticationPrincipal Member loginMember){
		log.debug("updateMember = {}", updateMember);
		log.debug("loginMember = {}", loginMember);
		
		Map<String, Object> map = new HashMap<>();
		
		try {
			// 1. db갱신
			int result = memberService.updateMember(updateMember);
			
			// 2. security가 관리하는 session 사용자정보 업데이트
			loginMember.setMName(updateMember.getMName());
			loginMember.setMNickName(updateMember.getMNickName());
			loginMember.setMPhone(updateMember.getMPhone());
			
			// 비밀번호/권한정보가 바뀌었을때는 전체 Authentication을 대체
			Authentication newAuthentication = new UsernamePasswordAuthenticationToken(
														loginMember, loginMember.getPassword(), loginMember.getAuthorities());
			
			SecurityContextHolder.getContext().setAuthentication(newAuthentication);
			
			
			map.put("msg", "회원 정보를 성공적으로 수정했습니다.");
		} catch (Exception e) {
			log.error("회원정보 수정 오류!", e);
			map.put("msg", "회원정보 수정 오류!");
		}
		return "redirect:/mypage/memberDetail.do";
	}
	
	@PostMapping("/memberUpdatePw.do")
	public String findPwUpdate(@RequestParam String mEmail, @RequestParam String mPassword, RedirectAttributes redirectAttr) {
		try {
			mEmail = mEmail.replace(",", "");
			Member member = memberService.emailChk(mEmail);
			String rawPassword = member.getMPassword();
			String encryptedPassword = bcryptPasswordEncoder.encode(mPassword);
			member.setMPassword(encryptedPassword);
			log.debug("member = {}",member);
			if(member != null) {
				int result = memberService.findPwUpdate(member);
			}
		} catch (Exception e) {
			log.error("비밀번호 변경 오류", e);
			throw e;
		}
		return "redirect:/login/memberLogout.do";
	}
	
	@GetMapping("/memberDelete.do")
	public String memberDelete() {
		return "/member/mypage/memberDelete";
	}
	
	@PostMapping("/memberDelete.do")
	public String memberDelete(@AuthenticationPrincipal Member member, HttpSession session) {
		try {
			int result = memberService.memberDelete(member.getMNo());
			session.invalidate();
			
			HttpHeaders headers = new HttpHeaders();
			headers.add("Content-Type", "text/html; charset=utf-8");

		} catch (Exception e) {
			log.error("회원 탈퇴 오류", e);
			throw e;
		}
		return "redirect:/";
	}
	
	@GetMapping("/memberFriendBoardList.do")
	public ModelAndView memberFriendBoardList(@AuthenticationPrincipal Member member, @RequestParam(defaultValue = "1") int cPage, ModelAndView mav, HttpServletRequest request) {
		try {
			int numPerPage = 5;
			String memberEmail = member.getMEmail();
			log.debug("member.getMEmail() = {}", member.getMEmail());
			List<MemberFriendBoard> boardList = memberService.findByFriendBoardListByEmail(cPage, numPerPage, memberEmail);
			log.debug("boardList = {}", boardList);
			int totalContent = memberService.selectFriendBoardTotalContent(memberEmail);
			String url = request.getRequestURI();

			log.debug("totalContent = {}", totalContent);
			String pagebar = HelloSpringUtils.getPagebar(cPage, numPerPage, totalContent, url);
			log.debug("pagebar = {}", pagebar);
			
			
			mav.addObject("boardList", boardList);
			mav.addObject("pagebar", pagebar);
			
			mav.setViewName("member/mypage/memberFriendBoardList");
			
		} catch (Exception e) {
			log.error("게시글 조회 오류", e);
			throw e;
		}
		return mav;
	}
	
	@GetMapping("/memberPlannerBoardList.do")
	public ModelAndView memberPlannerBoardList(@AuthenticationPrincipal Member member, @RequestParam(defaultValue = "1") int cPage, ModelAndView mav, HttpServletRequest request) {
		try {
			int numPerPage = 5;
			String memberEmail = member.getMEmail();
			log.debug("member.getMEmail() = {}", member.getMEmail());
			List<MemberPlannerBoard> boardList = memberService.findByPlannerBoardListByEmail(cPage, numPerPage, memberEmail);
			log.debug("boardList = {}", boardList);
			int totalContent = memberService.selectPlannerBoardTotalContent(memberEmail);
			String url = request.getRequestURI();
			
			log.debug("totalContent = {}", totalContent);
			String pagebar = HelloSpringUtils.getPagebar(cPage, numPerPage, totalContent, url);
			log.debug("pagebar = {}", pagebar);
			
			
			mav.addObject("boardList", boardList);
			mav.addObject("pagebar", pagebar);
			
			mav.setViewName("member/mypage/memberPlannerBoardList");
			
		} catch (Exception e) {
			log.error("게시글 조회 오류", e);
			throw e;
		}
		return mav;
	}
	
	@GetMapping("/memberReviewBoardList.do")
	public ModelAndView memberReviewBoardList(@AuthenticationPrincipal Member member, @RequestParam(defaultValue = "1") int cPage, ModelAndView mav, HttpServletRequest request) {
		try {
			int numPerPage = 5;
			String memberEmail = member.getMEmail();
			log.debug("member.getMEmail() = {}", member.getMEmail());
			List<MemberReviewBoard> boardList = memberService.findByReviewBoardListByEmail(cPage, numPerPage, memberEmail);
			log.debug("boardList = {}", boardList);
			int totalContent = memberService.selectReviewBoardTotalContent(memberEmail);
			String url = request.getRequestURI();
			
			log.debug("totalContent = {}", totalContent);
			String pagebar = HelloSpringUtils.getPagebar(cPage, numPerPage, totalContent, url);
			log.debug("pagebar = {}", pagebar);
			
			
			mav.addObject("boardList", boardList);
			mav.addObject("pagebar", pagebar);
			
			mav.setViewName("member/mypage/memberReviewBoardList");
			
		} catch (Exception e) {
			log.error("게시글 조회 오류", e);
			throw e;
		}
		return mav;
	}

}
