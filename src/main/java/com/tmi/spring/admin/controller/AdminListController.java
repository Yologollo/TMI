
package com.tmi.spring.admin.controller;
  
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import
  org.springframework.stereotype.Controller;
import
  org.springframework.web.bind.annotation.GetMapping;
import
  org.springframework.web.bind.annotation.RequestMapping;
import
  org.springframework.web.bind.annotation.RequestParam;
import
  org.springframework.web.servlet.ModelAndView;

import com.tmi.spring.admin.model.dto.AdminList;
import
  com.tmi.spring.admin.model.service.AdminListService;
import com.tmi.spring.common.HelloSpringUtils;

import lombok.extern.slf4j.Slf4j;
  
  @Controller
  @RequestMapping("/admin")
  @Slf4j public class AdminListController {
  
  
	  private static final String String = null;
	@Autowired
	  private AdminListService adminListService;
  
  
	  @GetMapping("/memberList.do") 
	  public ModelAndView memberList (@RequestParam(defaultValue = "1") int cPage, ModelAndView mav,
				HttpServletRequest request) {
			try {
				// 목록조회
				int numPerPage = 5;
				List<AdminList> list = adminListService.selectAdminList(cPage, numPerPage);
				log.debug("list = {}", list);
				mav.addObject("list", list);

				// 페이지바
				int totalContent = adminListService.selectTotalContent();
				String url = request.getRequestURI();

				log.debug("totalContent = {}", totalContent);
				String pagebar = HelloSpringUtils.getPagebar(cPage, numPerPage, totalContent, url);
				log.debug("pagebar = {}", pagebar);
				mav.addObject("pagebar", pagebar);

				// viewName설정
				mav.setViewName("/admin/memberList");
			} catch (Exception e) {
				log.error(" 회원 조회 오류", e);
			}

			return mav;
		}

  
	  @GetMapping(value ="/memeberDelete.do", produces = "application/json")
	  public ResponseEntity<?> memeberDelete(@RequestParam String memberEmail) {
		  log.debug("memberEmail = {}", memberEmail);
		  Map<String, Object> map = new HashMap<>();
	  try { 
			int result = adminListService.memeberDelete(memberEmail);
			map.put("msg", "회원을 정상적으로 탈퇴시켰습니다.");
			return ResponseEntity.ok(map);

		} catch (Exception e) {
			log.error("회원 탈퇴 오류", e);
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).build();
		}

	}
  
	
	  @GetMapping("/memberListSearch.do")
	  public ResponseEntity<?> memberListSearch(@RequestParam String membername) {
		  log.debug("membername = {}", membername);
		  Map<String, Object> map = new HashMap<>();
		  try { 
				int result = adminListService.memberListSearch(membername);
				map.put("msg", "회원조회가 되었습니다.");
				return ResponseEntity.ok(map);

			} catch (Exception e) {
				log.error("회원 조회 오류", e);
				return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).build();
			}
		  
	
	  }
	 

//     li
	 
  
  
  }
 