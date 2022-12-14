package com.tmi.spring.board.review.controller;

import java.io.File;
import java.io.IOException;
import java.net.URLEncoder;
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
import org.springframework.core.io.Resource;
import org.springframework.core.io.ResourceLoader;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
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

import com.tmi.spring.board.review.model.dto.InsertReviewBoard;
import com.tmi.spring.board.review.model.dto.ReviewBoard;
import com.tmi.spring.board.review.model.dto.ReviewBoardAttachment;
import com.tmi.spring.board.review.model.dto.ReviewBoardComment;
import com.tmi.spring.board.review.model.dto.ReviewBoardLove;
import com.tmi.spring.board.review.model.service.ReviewBoardService;
import com.tmi.spring.common.HelloSpringUtils;
import com.tmi.spring.member.model.dto.Member;
import com.tmi.spring.planner.model.dto.Planner;
import com.tmi.spring.planner.model.dto.PlannerPlan;
import com.tmi.spring.planner.model.service.PlannerService;

import lombok.extern.slf4j.Slf4j;

/**
 * 
 * @?????? ?????????
 * @?????? ?????????, ?????????
 *
 */

@Controller
@Slf4j
public class ReviewBoardController {
	
	@Autowired
	ReviewBoardService reviewBoardService;
	
	@Autowired
	ServletContext application;
	
	@Autowired
	ResourceLoader resourceLoader;
	
	@Autowired
	PlannerService plannerService;
	
	@GetMapping("/board/review/reviewBoard.do")
	public ModelAndView ReviewBoard( @RequestParam(defaultValue = "1") int cPage, ModelAndView mav, HttpServletRequest request, Model model) {
		try {
			int numPerPage = 8;
			List<ReviewBoard> list = reviewBoardService.selectReviewBoardList(cPage, numPerPage);
			Iterator<ReviewBoard> it = list.iterator();

			log.debug("list = {}", list);
			mav.addObject("list", list);
			
			int totalContent = reviewBoardService.selectTotalContent();
			String url = request.getRequestURI();
			log.debug("url = {}", url);

			while(it.hasNext()) {
				ReviewBoard boardEntity = it.next();
				
				//Jsoup??? ???????????? ????????? img??? src??? ?????? ????????? ??? ?????? ??????
				Document doc = Jsoup.parse(boardEntity.getRb_content());
				if(doc.selectFirst("img") != null) {
					String src = doc.selectFirst("img").attr("src");
					boardEntity.setRb_content(src);
				}
			}
			
			log.debug("totalContent = {}", totalContent);
			String pagebar = HelloSpringUtils.getPagebar(cPage, numPerPage, totalContent, url);
			log.debug("pagebar = {}", pagebar);
			mav.addObject("pagebar", pagebar);
			
			mav.setViewName("board/review/reviewBoard");	
			
		} catch (Exception e) {
			log.error("????????? ?????? ?????? ??????",e);
			throw e;
		}
		return mav;
	}
	
	@GetMapping("/board/review/reviewBoardForm.do")
	public void ReviewBoardForm(@AuthenticationPrincipal Member member, Planner planner, Model model) {
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
			log.error("Planner ?????? ??????", e);
			throw e;
		}
	}
	
	@PostMapping("/board/review/reviewBoardEnroll.do")
	public String ReviewBoardEnroll(InsertReviewBoard insertReviewBoard, 
									@RequestParam("upFile")MultipartFile[] upFiles, 
									RedirectAttributes redirectAttr) {
		try {
			log.debug("reviewBoard = {}", insertReviewBoard);
			
			String saveDirectory = application.getRealPath("/resources/upload/reviewboard");
			
			
			for(MultipartFile upFile : upFiles)
			{
				if(upFile.getSize() > 0)
				{
					String originalFilename = upFile.getOriginalFilename();
					String renamedFilename = HelloSpringUtils.getRenamedFilename(originalFilename);
					log.debug("renamedFilename = {}", renamedFilename);
					
					File destFile = new File(saveDirectory, renamedFilename);
					upFile.transferTo(destFile);
					
					ReviewBoardAttachment attach = new ReviewBoardAttachment();
					attach.setRbaOriginalFilename(originalFilename);
					attach.setRbaRenamedFilename(renamedFilename);
					insertReviewBoard.addAttachment(attach);
				}
			}
			
			int result = reviewBoardService.insertReviewBoard(insertReviewBoard);
			
		} catch(IOException e) {
			log.error("???????????? ?????? ??????", e);
			
		} catch (Exception e) {
			log.error("????????? ?????? ??????", e);
			throw e;
		}
		
		return "redirect:/board/review/reviewBoard.do";
	}
	
	@ResponseBody
	@RequestMapping(value = "/board/review/reviewBoardDetail.do" , method = {RequestMethod.GET, RequestMethod.POST})
//	@GetMapping("/board/review/reviewBoardDetail.do")
	public ModelAndView ReviewBoardDetail(@RequestParam int no, Model model, ModelAndView mav, HttpServletRequest request, HttpServletResponse response) {
		try {
			log.debug("no = {}", no);			
			InsertReviewBoard insertReviewBoard = reviewBoardService.selectOneReviewBoard(no);
			log.debug("insertReviewBoard = {}", insertReviewBoard);		
			
			Cookie[] cookies = request.getCookies();
			int visitor = 0;
			
			for(Cookie cookie : cookies)
			{
				log.info(cookie.getName());
				if(cookie.getName().equals("visit"))
				{
					visitor = 1;
					
					log.info("visit??????");
					
					if(cookie.getValue().contains(request.getParameter("no")))
					{						
						log.info("visit no??????");
					}
					else
					{
						cookie.setValue(cookie.getValue()+"_" + request.getParameter("no"));
						cookie.setMaxAge(60*60*24);
						response.addCookie(cookie);
						int result = reviewBoardService.updateReadCount(no);
					}
				}
			}
			
			if(visitor == 0)
			{
				Cookie cookie1 = new Cookie("visit", request.getParameter("no"));
				cookie1.setMaxAge(60*60*24);
				response.addCookie(cookie1);
				int result = reviewBoardService.updateReadCount(no);
			}
			int loveCount = reviewBoardService.loveCount(no);
			log.debug("loveCount= {}", loveCount);
			
			Planner planner = reviewBoardService.findBoardPlannerByNoModel(no);
			log.debug("planner = {}", planner);

			LocalDate start = planner.getPLeaveDate();
	        LocalDate end = planner.getPReturnDate();
	        
	        Period period = Period.between(start, end); // ???????????? ??????
	        log.debug("days = {}", period.getDays());

	        List<LocalDate> days = new ArrayList<>();
	        for(int i = 0; i < period.getDays(); i++){
	            days.add(start.plusDays(i)); // ?????????
	        }
	        log.debug("days = {}", days);

	        model.addAttribute("days", days);
			
			mav.addObject("loveCount",loveCount);
			mav.addObject("insertReviewBoard", insertReviewBoard);
			mav.setViewName("board/review/reviewBoardDetail");

		} catch (Exception e) {
			log.error("????????? ?????? ??????", e);
			throw e;
		}
		return mav;
	}
	
	@GetMapping("/board/review/reviewBoardUpdate.do")
	public void ReviewBoardUpdate(@RequestParam int no, @AuthenticationPrincipal Member member, Planner planner, Model model) {
		try {
			InsertReviewBoard insertReviewBoard = reviewBoardService.selectOneReviewBoard(no);
			log.debug("insertReviewBoard = {}", insertReviewBoard);
			
			String memberEmail = member.getMEmail();
			log.debug("memberEmail = {}", memberEmail);
			
			List<Planner> plannerList = plannerService.findPlannerByEmail(memberEmail);
			log.debug("plannerList = {}", plannerList);
			
			List<PlannerPlan> plans = plannerService.findPlansList(plannerList);
			log.debug("plans = {}", plans);
			
			model.addAttribute("plannerList", plannerList);
			model.addAttribute("plans", plans);
			
			model.addAttribute("insertReviewBoard",insertReviewBoard);
		} catch (Exception e) {
			log.error("????????? ?????? ??? ??????", e);
			throw e;
		}
	}
	
	@PostMapping("/board/review/reviewBoardUpdate.do")
	public String reviewBoardUpdate(
			@ModelAttribute InsertReviewBoard insertReviewBoard,
			@RequestParam("upFile") MultipartFile[] upFiles,
			@RequestParam(value="delFile", required=false) int[] delFiles,
			RedirectAttributes redirectAttr) throws Exception {
		
		String saveDirectory = application.getRealPath("/resources/upload/reviewboard");
		
		try {
				if(delFiles != null)
				{
					for(int attachNo : delFiles)
					{
						ReviewBoardAttachment attach = reviewBoardService.selectOneAttachment(attachNo);
						log.debug("attach= {}", attach);
						log.debug("insertReviewBoard = {}", insertReviewBoard);
						
						String renamedFilename = attach.getRbaRenamedFilename();
						File delFile = new File(saveDirectory, renamedFilename);
						if(delFile.exists())
						{
							delFile.delete();
							log.debug("{}??? {}?????? ??????", attachNo, renamedFilename);
						}
						
						int result = reviewBoardService.deleteAttachment(attachNo);
						log.debug("{}??? Attachment ????????? ??????", attachNo);
					}
				}
				
				for(MultipartFile upFile : upFiles)
				{
					if(upFile.getSize() > 0)
					{
						ReviewBoardAttachment attach = new ReviewBoardAttachment();
						attach.setRbaOriginalFilename(upFile.getOriginalFilename());
						attach.setRbaRenamedFilename(HelloSpringUtils.getRenamedFilename(upFile.getOriginalFilename()));
						attach.setRbaRbNo(insertReviewBoard.getRbNo());
						insertReviewBoard.addAttachment(attach);
						
						File destFile = new File(saveDirectory, attach.getRbaRenamedFilename());
						upFile.transferTo(destFile);
					}
				}
				
				int result = reviewBoardService.updateReviewBoard(insertReviewBoard);
				
		}
		catch(Exception e) {
			log.error("????????? ?????? ??????", e);
			throw e;
		}

		return "redirect:/board/review/reviewBoardDetail.do?no=" + insertReviewBoard.getRbNo();
	}
	
	@GetMapping(path = "/board/review/fileDownload.do", produces = MediaType.APPLICATION_OCTET_STREAM_VALUE)
	@ResponseBody
	public Resource fileDownload(@RequestParam int no, HttpServletResponse response) throws Exception {
		Resource resource = null;
		try {
			ReviewBoardAttachment attach = reviewBoardService.selectOneAttachment(no);
			log.debug("attach = {}", attach);
			
			String saveDirectory = application.getRealPath("/resources/upload/reviewboard");
			File downFile = new File(saveDirectory, attach.getRbaRenamedFilename());
			
			String location = "file:" + downFile;
			log.debug("location = {}",location);
			resource = resourceLoader.getResource(location);
			
			String filename = URLEncoder.encode(attach.getRbaOriginalFilename(), "utf-8");
//			response.setContentType(MediaType.APPLICATION_OCTET_STREAM_VALUE);
			response.addHeader(HttpHeaders.CONTENT_DISPOSITION, "attachment; filename=\"" + filename + "\"");
			
		} catch (Exception e) {
			log.error("?????? ???????????? ??????", e);
			throw e;
		}
		
		return resource;
	}
	
	@GetMapping("/board/review/reviewBoardDelete.do")
	public String reviewBoardDelete(@RequestParam int no) {
		try {
			log.debug("no = {}",no);
			int result = reviewBoardService.deleteReviewBoard(no);
			
		} catch (Exception e) {
			log.error("????????? ?????? ??????",e);
			throw e;
		}
		
		return "redirect:/board/review/reviewBoard.do";
	}
	
	@PostMapping("/board/review/reviewBoardCommentEnroll.do")
	public String reviewBoardCommentEnroll(@RequestParam int rbcRbNo, @RequestParam String rbcMEmail, @RequestParam String rbcContent) {
		try {
			log.debug("rbcRbNo = {}",rbcRbNo);
			log.debug("rbMEmail = {}",rbcMEmail);
			log.debug("rbcContent = {}",rbcContent);
			
			ReviewBoardComment rbComment = new ReviewBoardComment(0, rbcRbNo, rbcMEmail, null, rbcContent);
			
			int result = reviewBoardService.insertReviewComment(rbComment);
			
		} catch (Exception e) {
			log.error("?????? ?????? ??????", e);
			throw e;
		}
		return  "redirect:/board/review/reviewBoardDetail.do?no=" + rbcRbNo;
	}
	
	@GetMapping("/board/review/deleteComment.do")
	public String reviewBoardDeleteComment(@RequestParam int rbcRbNo, @RequestParam int rbcNo) {
		try {
			log.debug("rbcRbNo = {}", rbcRbNo);
			log.debug("rbcNo = {}", rbcNo);
			
			int result = reviewBoardService.deleteReviewBoardComment(rbcNo);
			
		} catch (Exception e) {
			log.error("?????? ?????? ??????",e);
			throw e;
		}
		return "redirect:/board/review/reviewBoardDetail.do?no=" + rbcRbNo;
	}
	
	@GetMapping("/board/review/reviewBoardLove.do")
	public String reviewBoardLove(@RequestParam int loNo, @AuthenticationPrincipal Member member, RedirectAttributes redirectAttr) {
		log.debug("loNo = {}", loNo);
		int result = 0;
		
		String email = member.getMEmail();
		log.debug("email = {}", email);
		
		String Find = reviewBoardService.selectFindLove(loNo, email);			
		
		if(Find == null)
		{			
			result = reviewBoardService.insertLove(loNo, email);			
		}
		else
		{
//			String msg = "?????? ???????????? ????????????.";
			redirectAttr.addFlashAttribute("msg", "?????? ????????? ????????????.");
//			return "redirect:/login/findPwUpdate.do";
		}
		
		return "redirect:/board/review/reviewBoardDetail.do?no=" + loNo;
	}
	
	@GetMapping("/board/bestreview/bestReview.do")
	public ModelAndView bestReview( @RequestParam(defaultValue = "1") int cPage, ModelAndView mav, HttpServletRequest request, Model model) {
		try {
			int numPerPage = 8;
			List<ReviewBoard> list2 = reviewBoardService.selectBestReviewBoardList(cPage, numPerPage);
			Iterator<ReviewBoard> it = list2.iterator();

			log.debug("list2 = {}", list2);
			mav.addObject("list2", list2);
			
			int totalContent = reviewBoardService.selectTotalContent();
			String url = request.getRequestURI();
			log.debug("url = {}", url);

			while(it.hasNext()) {
				ReviewBoard boardEntity = it.next();
				
				//Jsoup??? ???????????? ????????? img??? src??? ?????? ????????? ??? ?????? ??????
				Document doc = Jsoup.parse(boardEntity.getRb_content());
				if(doc.selectFirst("img") != null) {
					String src = doc.selectFirst("img").attr("src");
					boardEntity.setRb_content(src);
				}
			}
			
			log.debug("totalContent = {}", totalContent);
			String pagebar = HelloSpringUtils.getPagebar(cPage, numPerPage, totalContent, url);
			log.debug("pagebar = {}", pagebar);
			mav.addObject("pagebar", pagebar);
			
			mav.setViewName("board/bestreview/bestReview");	
			
		} catch (Exception e) {
			log.error("????????? ?????? ?????? ??????",e);
			throw e;
		}
		return mav;
	}
	
//	@GetMapping("/")
//	public ModelAndView index( @RequestParam(defaultValue = "1") int cPage, ModelAndView mav, HttpServletRequest request, Model model) {
//		try {
//			int numPerPage = 3;
//			List<ReviewBoard> list4 = reviewBoardService.selectMainReviewBoardList(cPage, numPerPage);
//			Iterator<ReviewBoard> it = list4.iterator();
//
//			log.debug("list4 = {}", list4);
//			mav.addObject("list4", list4);
//			
//			int totalContent = reviewBoardService.selectTotalContent();
//			String url = request.getRequestURI();
//			log.debug("url = {}", url);
//
//			while(it.hasNext()) {
//				ReviewBoard boardEntity = it.next();
//				
//				//Jsoup??? ???????????? ????????? img??? src??? ?????? ????????? ??? ?????? ??????
//				Document doc = Jsoup.parse(boardEntity.getRb_content());
//				if(doc.selectFirst("img") != null) {
//					String src = doc.selectFirst("img").attr("src");
//					boardEntity.setRb_content(src);
//				}
//			}
//			
//			log.debug("totalContent = {}", totalContent);
//			String pagebar = HelloSpringUtils.getPagebar(cPage, numPerPage, totalContent, url);
//			log.debug("pagebar = {}", pagebar);
//			mav.addObject("pagebar", pagebar);
//			
//			mav.setViewName("/");	
//			
//		} catch (Exception e) {
//			log.error("????????? ?????? ?????? ??????",e);
//			throw e;
//		}
//		return mav;
//	}

}









