package com.tmi.spring.board.planner.controller;

import java.io.File;
import java.io.IOException;
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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.tmi.spring.board.planner.model.dto.InsertPlannerBoard;
import com.tmi.spring.board.planner.model.dto.PlannerBoard;
import com.tmi.spring.board.planner.model.service.PlannerBoardService;
import com.tmi.spring.board.review.model.dto.InsertReviewBoard;
import com.tmi.spring.board.review.model.dto.ReviewBoardAttachment;
import com.tmi.spring.common.HelloSpringUtils;
import com.tmi.spring.member.model.dto.Member;
import com.tmi.spring.planner.model.dto.Planner;
import com.tmi.spring.planner.model.dto.PlannerPlan;
import com.tmi.spring.planner.model.service.PlannerService;

import lombok.extern.slf4j.Slf4j;

/**
 * 
 * @생성 김용민
 * @작업 김용민
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
	public ModelAndView PlannerBoard( @RequestParam(defaultValue = "1") int cPage, ModelAndView mav, HttpServletRequest request, Model model) {
		try {
			int numPerPage = 8;
			List<PlannerBoard> list = plannerBoardService.selectPlannerBoardList(cPage, numPerPage);
			Iterator<PlannerBoard> it = list.iterator();

			log.debug("list = {}", list);
			mav.addObject("list", list);
			
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
	
	@GetMapping("/board/review/reviewBoardForm.do")
	public void ReviewBoardForm(@AuthenticationPrincipal Member member, Planner planner, Model model) {
//		try {
//			String memberEmail = member.getMEmail();
//			log.debug("memberEmail = {}", memberEmail);
//			
//			List<Planner> plannerList = plannerService.findPlannerByEmail(memberEmail);
//			log.debug("plannerList = {}", plannerList);
//			
//			List<PlannerPlan> plans = plannerService.findPlansList(plannerList);
//			log.debug("plans = {}", plans);
//			
//			model.addAttribute("plannerList", plannerList);
//			model.addAttribute("plans", plans);
//						
//		} catch (Exception e) {
//			log.error("Planner 조회 오류", e);
//			throw e;
//		}
	}
	
//	@PostMapping("/board/planner/plannerBoardEnroll.do")
//	public String ReviewBoardEnroll(InsertPlannerBoard insertPlannerBoard) {
//		try {
//			log.debug("plannerBoard = {}", insertPlannerBoard);
//		
//			int result = plannerBoardService.insertPlannerBoard(insertPlannerBoard);
//			
//		}  catch (Exception e) {
//			log.error("게시글 등록 오류", e);
//			throw e;
//		}
//		
//		return "redirect:/board/review/reviewBoard.do";
//	}
	
	@ResponseBody
	@RequestMapping(value = "/board/planner/plannerBoardDetail.do" , method = {RequestMethod.GET, RequestMethod.POST})
//	@GetMapping("/board/review/reviewBoardDetail.do")
	public ModelAndView ReviewBoardDetail(@RequestParam int no, Model model, ModelAndView mav, HttpServletRequest request, HttpServletResponse response) {
		try {
			log.debug("no = {}", no);			
			InsertPlannerBoard insertPlannerBoard = plannerBoardService.selectOnePlannerBoard(no);
			log.debug("insertReviewBoard = {}", insertPlannerBoard);		
			
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
			
//			Planner planner = plannerBoardService.findBoardPlannerByNoModel(no);
//			log.debug("planner = {}", planner);

//			LocalDate start = planner.getPLeaveDate();
//	        LocalDate end = planner.getPReturnDate();
	        
//	        Period period = Period.between(start, end); // 날짜차이 조회
//	        log.debug("days = {}", period.getDays());
//
//	        List<LocalDate> days = new ArrayList<>();
//	        for(int i = 0; i < period.getDays(); i++){
//	            days.add(start.plusDays(i)); // 몇일후
//	        }
//	        log.debug("days = {}", days);
//
//	        model.addAttribute("days", days);
			
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
			log.debug("insertReviewBoard = {}", insertPlannerBoard);
			
//			String memberEmail = member.getMEmail();
//			log.debug("memberEmail = {}", memberEmail);
//			
//			List<Planner> plannerList = plannerService.findPlannerByEmail(memberEmail);
//			log.debug("plannerList = {}", plannerList);
//			
//			List<PlannerPlan> plans = plannerService.findPlansList(plannerList);
//			log.debug("plans = {}", plans);
//			
//			model.addAttribute("plannerList", plannerList);
//			model.addAttribute("plans", plans);
			
			model.addAttribute("insertPlannerBoard",insertPlannerBoard);
		} catch (Exception e) {
			log.error("게시글 수정 폼 오류", e);
			throw e;
		}
	}
	
//	@PostMapping("/board/planner/plannerBoardUpdate.do")
//	public String plannerBoardUpdate(
//			@ModelAttribute InsertPlannerBoard insertPlannerBoard,
//			@RequestParam("upFile") MultipartFile[] upFiles,
//			@RequestParam(value="delFile", required=false) int[] delFiles,
//			RedirectAttributes redirectAttr) throws Exception {
//		
//		String saveDirectory = application.getRealPath("/resources/upload/reviewboard");
//		
//		try {
//				if(delFiles != null)
//				{
//					for(int attachNo : delFiles)
//					{
//						ReviewBoardAttachment attach = reviewBoardService.selectOneAttachment(attachNo);
//						log.debug("attach= {}", attach);
//						log.debug("insertReviewBoard = {}", insertReviewBoard);
//						
//						String renamedFilename = attach.getRbaRenamedFilename();
//						File delFile = new File(saveDirectory, renamedFilename);
//						if(delFile.exists())
//						{
//							delFile.delete();
//							log.debug("{}번 {}파일 삭제", attachNo, renamedFilename);
//						}
//						
//						int result = reviewBoardService.deleteAttachment(attachNo);
//						log.debug("{}번 Attachment 레코드 삭제", attachNo);
//					}
//				}
//				
//				for(MultipartFile upFile : upFiles)
//				{
//					if(upFile.getSize() > 0)
//					{
//						ReviewBoardAttachment attach = new ReviewBoardAttachment();
//						attach.setRbaOriginalFilename(upFile.getOriginalFilename());
//						attach.setRbaRenamedFilename(HelloSpringUtils.getRenamedFilename(upFile.getOriginalFilename()));
//						attach.setRbaRbNo(insertReviewBoard.getRbNo());
//						insertReviewBoard.addAttachment(attach);
//						
//						File destFile = new File(saveDirectory, attach.getRbaRenamedFilename());
//						upFile.transferTo(destFile);
//					}
//				}
//				
//				int result = reviewBoardService.updateReviewBoard(insertReviewBoard);
//				
//		}
//		catch(Exception e) {
//			log.error("게시글 수정 오류", e);
//			throw e;
//		}
//
//		return "redirect:/board/review/reviewBoardDetail.do?no=" + insertReviewBoard.getRbNo();
//	}
	
}
