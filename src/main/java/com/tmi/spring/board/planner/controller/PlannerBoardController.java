package com.tmi.spring.board.planner.controller;

import java.time.LocalDate;
import java.time.Period;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ResourceLoader;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.tmi.spring.board.planner.model.dto.InsertPlannerBoard;
import com.tmi.spring.board.planner.model.dto.PlannerBoard;
import com.tmi.spring.board.planner.model.dto.PlannerBoardComment;
import com.tmi.spring.board.planner.model.service.PlannerBoardService;
import com.tmi.spring.board.review.model.dto.ReviewBoardComment;
import com.tmi.spring.common.HelloSpringUtils;
import com.tmi.spring.member.model.dto.Member;
import com.tmi.spring.planner.model.dto.Planner;
import com.tmi.spring.planner.model.dto.PlannerPlan;
import com.tmi.spring.planner.model.service.PlannerService;

import lombok.extern.slf4j.Slf4j;

/**
 * 
 * @생성 김용민 이경석
 * @작업 김용민 이경석
 *
 */

@Controller
@Slf4j
public class PlannerBoardController {
	
	@Autowired
	PlannerBoardService plannerBoardService;
	
	@Autowired
	ServletContext application;
	
	@Autowired
	ResourceLoader resourceLoader;
	
	@Autowired
	PlannerService plannerService;
	
	@GetMapping("/board/planner/plannerBoard.do")
	public ModelAndView PlannerBoard( @RequestParam(defaultValue = "1") int cPage, ModelAndView mav, HttpServletRequest request) {
		try {
			int numPerPage = 8;
			List<PlannerBoard> list = plannerBoardService.selectPlannerBoardList(cPage, numPerPage);
			List<PlannerPlan> plans = plannerBoardService.findPlansList(list);
			Iterator<PlannerBoard> it = list.iterator();

			log.debug("list = {}", list);
			log.debug("plans = {}", plans);
			mav.addObject("list", list);
			mav.addObject("plans", plans);
			
			int totalContent = plannerBoardService.selectTotalContent();
			String url = request.getRequestURI();
			log.debug("url = {}", url);

			while(it.hasNext()) {
				PlannerBoard boardEntity = it.next();
				
				//Jsoup를 이용해서 첫번째 img의 src의 값을 팡싱한 후 값을 저장
				Document doc = Jsoup.parse(boardEntity.getPb_content());
				if(doc.selectFirst("img") != null) {
					String src = doc.selectFirst("img").attr("src");
					boardEntity.setPb_content(src);
				}
			}
			
			
			
			log.debug("totalContent = {}", totalContent);
			String pagebar = HelloSpringUtils.getPagebar(cPage, numPerPage, totalContent, url);
			log.debug("pagebar = {}", pagebar);
			mav.addObject("pagebar", pagebar);
			
			mav.setViewName("board/planner/plannerBoard");	
			
		} catch (Exception e) {
			log.error("게시글 목록 조회 오류",e);
			throw e;
		}
		return mav;
	}
	
	@GetMapping("/board/planner/plannerBoardForm.do")
	public void PlannerBoardForm(@AuthenticationPrincipal Member member, Planner planner, Model model) {
		try {
			String memberEmail = member.getMEmail();
			log.debug("memberEmail = {}", memberEmail);
			
			List<Planner> plannerList = plannerService.findPlannerByEmail(memberEmail);
			log.debug("plannerList = {}", plannerList);
			
			List<PlannerPlan> plans = plannerService.findPlansList(plannerList);
			log.debug("plans = {}", plans);
			
			model.addAttribute("plannerList", plannerList);
			model.addAttribute("plans", plans);
						
		} catch (Exception e) {
			log.error("Planner 조회 오류", e);
			throw e;
		}
	}
	
	@PostMapping("/board/planner/plannerBoardEnroll.do")
	public String PlannerBoardEnroll(InsertPlannerBoard insertPlannerBoard) {
		try {
			log.debug("plannerBoard = {}", insertPlannerBoard);
		
			int result = plannerBoardService.insertPlannerBoard(insertPlannerBoard);
			
		}  catch (Exception e) {
			log.error("게시글 등록 오류", e);
			throw e;
		}
		
		return "redirect:/board/planner/plannerBoard.do";
	}
	
	@ResponseBody
	@RequestMapping(value = "/board/planner/plannerBoardDetail.do" , method = {RequestMethod.GET, RequestMethod.POST})
//	@GetMapping("/board/review/reviewBoardDetail.do")
	public ModelAndView PlannerBoardDetail(@RequestParam int no, Model model, ModelAndView mav, HttpServletRequest request, HttpServletResponse response) {
		try {
			log.debug("no = {}", no);			
			InsertPlannerBoard insertPlannerBoard = plannerBoardService.selectOnePlannerBoard(no);
			log.debug("insertPlannerBoard = {}", insertPlannerBoard);		
			
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
						int result = plannerBoardService.updateReadCount(no);
					}
				}
			}
			
			if(visitor == 0)
			{
				Cookie cookie1 = new Cookie("visit", request.getParameter("no"));
				cookie1.setMaxAge(60*60*24);
				response.addCookie(cookie1);
				int result = plannerBoardService.updateReadCount(no);
			}
			int loveCount = plannerBoardService.loveCount(no);
			log.debug("loveCount= {}", loveCount);
			
			Planner planner = plannerBoardService.findBoardPlannerByNoModel(no);
			log.debug("planner = {}", planner);

			LocalDate start = planner.getPLeaveDate();
	        LocalDate end = planner.getPReturnDate();
	        
	        Period period = Period.between(start, end); // 날짜차이 조회
	        log.debug("days = {}", period.getDays());

	        List<LocalDate> days = new ArrayList<>();
	        for(int i = 0; i < period.getDays(); i++){
	            days.add(start.plusDays(i)); // 몇일후
	        }
	        log.debug("days = {}", days);

	        model.addAttribute("days", days);
			
			mav.addObject("loveCount",loveCount);
			mav.addObject("insertPlannerBoard", insertPlannerBoard);
			mav.setViewName("board/planner/plannerBoardDetail");

		} catch (Exception e) {
			log.error("게시글 조회 오류", e);
			throw e;
		}
		return mav;
	}
	
	@GetMapping("/board/planner/plannerBoardUpdate.do")
	public void PlannerBoardUpdate(@RequestParam int no, @AuthenticationPrincipal Member member, Planner planner, Model model) {
		try {
			InsertPlannerBoard insertPlannerBoard = plannerBoardService.selectOnePlannerBoard(no);
			log.debug("insertPlannerBoard = {}", insertPlannerBoard);
			
			String memberEmail = member.getMEmail();
			log.debug("memberEmail = {}", memberEmail);
			
			List<Planner> plannerList = plannerService.findPlannerByEmail(memberEmail);
			log.debug("plannerList = {}", plannerList);
			
			List<PlannerPlan> plans = plannerService.findPlansList(plannerList);
			log.debug("plans = {}", plans);
			
			model.addAttribute("plannerList", plannerList);
			model.addAttribute("plans", plans);
			
			model.addAttribute("insertPlannerBoard",insertPlannerBoard);
		} catch (Exception e) {
			log.error("게시글 수정 폼 오류", e);
			throw e;
		}
	}
	
	@PostMapping("/board/planner/plannerBoardUpdate.do")
	public String plannerBoardUpdate(@ModelAttribute InsertPlannerBoard insertPlannerBoard,RedirectAttributes redirectAttr) throws Exception {
		
		try {
				
				int result = plannerBoardService.updatePlannerBoard(insertPlannerBoard);
				
		}
		catch(Exception e) {
			log.error("게시글 수정 오류", e);
			throw e;
		}

		return "redirect:/board/planner/plannerBoardDetail.do?no=" + insertPlannerBoard.getPbNo();
	}
	
	@GetMapping("/board/planner/plannerBoardDelete.do")
	public String plannerBoardDelete(@RequestParam int no) {
		try {
			log.debug("no = {}",no);
			int result = plannerBoardService.deletePlannerBoard(no);
			
		} catch (Exception e) {
			log.error("게시판 삭제 오류",e);
			throw e;
		}
		
		return "redirect:/board/planner/plannerBoard.do";
	}
	
	@PostMapping("/board/planner/plannerBoardCommentEnroll.do")
	public String plannerBoardCommentEnroll(@RequestParam int pbcPbNo, @RequestParam String pbcMEmail, @RequestParam String pbcContent) {
		try {
			log.debug("pbcPbNo = {}",pbcPbNo);
			log.debug("pbMEmail = {}",pbcMEmail);
			log.debug("pbcContent = {}",pbcContent);
			
			PlannerBoardComment pbComment = new PlannerBoardComment(0, pbcPbNo, pbcMEmail, null, pbcContent);
			
			int result = plannerBoardService.insertPlannerComment(pbComment);
			
		} catch (Exception e) {
			log.error("댓글 작성 오류", e);
			throw e;
		}
		return  "redirect:/board/planner/plannerBoardDetail.do?no=" + pbcPbNo;
	}
	
	@GetMapping("/board/planner/deleteComment.do")
	public String plannerBoardDeleteComment(@RequestParam int pbcPbNo, @RequestParam int pbcNo) {
		try {
			log.debug("pbcPbNo = {}", pbcPbNo);
			log.debug("pbcNo = {}", pbcNo);
			
			int result = plannerBoardService.deletePlannerBoardComment(pbcNo);
			
		} catch (Exception e) {
			log.error("댓글 삭제 오류",e);
			throw e;
		}
		return "redirect:/board/planner/plannerBoardDetail.do?no=" + pbcPbNo;
	}
	
	@GetMapping("/board/planner/plannerBoardLove.do")
	public String plannerBoardLove(@RequestParam int loNo, @AuthenticationPrincipal Member member, RedirectAttributes redirectAttr) {
		log.debug("loNo = {}", loNo);
		int result = 0;
		
		String email = member.getMEmail();
		log.debug("email = {}", email);
		
		String Find = plannerBoardService.selectFindLove(loNo, email);			
		
		if(Find == null)
		{			
			result = plannerBoardService.insertLove(loNo, email);			
		}
		else
		{
//			String msg = "이미 좋아요한 글입니다.";
			redirectAttr.addFlashAttribute("msg", "이미 좋아요한 글입니다.");
//			return "redirect:/login/findPwUpdate.do";
		}
		
		return "redirect:/board/planner/plannerBoardDetail.do?no=" + loNo;
	}
	
}
