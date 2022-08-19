 package com.tmi.spring.board.friend.controller;

import java.io.File;
import java.io.IOException;
import java.net.URLEncoder;
import java.time.LocalDate;
import java.time.Period;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.tmi.spring.board.friend.model.dto.FriendBoard;
import com.tmi.spring.board.friend.model.dto.FriendBoardAttachment;
import com.tmi.spring.board.friend.model.dto.FriendBoardComment;
import com.tmi.spring.board.friend.model.dto.InsertFriendBoard;
import com.tmi.spring.board.friend.model.service.FriendBoardService;
import com.tmi.spring.common.HelloSpringUtils;
import com.tmi.spring.member.model.dto.Member;
import com.tmi.spring.planner.model.dto.Planner;
import com.tmi.spring.planner.model.dto.PlannerPlan;
import com.tmi.spring.planner.model.service.PlannerService;

import lombok.extern.slf4j.Slf4j;

/**
 * 
 * @생성 이경석
 * @작업 이경석, 김용민
 *
 */

@Controller
@Slf4j
@SessionAttributes({"loginMember", "next"})
public class FriendBoardController {
	
	@Autowired
	FriendBoardService friendBoardService;
	
	@Autowired
	ServletContext application;
	
	@Autowired
	ResourceLoader resourceLoader;
	
	@Autowired
	PlannerService plannerService;

	@GetMapping("/board/friend/friendBoard.do")
	public ModelAndView FriendBoard( @RequestParam(defaultValue = "1") int cPage, ModelAndView mav, HttpServletRequest request) {
		try {
			int numPerPage = 5;
			List<FriendBoard> list = friendBoardService.selectFriendBoardList(cPage, numPerPage);
			log.debug("list = {}", list);
			mav.addObject("list", list);
			
			int totalContent = friendBoardService.selectTotalContent();
			String url = request.getRequestURI();

			log.debug("totalContent = {}", totalContent);
			String pagebar = HelloSpringUtils.getPagebar(cPage, numPerPage, totalContent, url);
			log.debug("pagebar = {}", pagebar);
			mav.addObject("pagebar", pagebar);
			
			mav.setViewName("board/friend/friendBoard");
		} catch (Exception e) {
			log.error("게시글 목록 조회 오류",e);
			throw e;
		}
		return mav;
	}
	
	@GetMapping("/board/friend/friendBoardForm.do")
	public void FriendBoardForm(@AuthenticationPrincipal Member member, Planner planner, Model model) {
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
	
	@PostMapping("/board/friend/friendBoardEnroll.do")
	public String FriendBoardEnroll(InsertFriendBoard insertFriendBoard, 
									@RequestParam("upFile")MultipartFile[] upFiles, 
									RedirectAttributes redirectAttr) {
		try {
			log.debug("friendBoard = {}", insertFriendBoard);
			
			String saveDirectory = application.getRealPath("/resources/upload/friendboard");
			
			
			for(MultipartFile upFile : upFiles)
			{
				if(upFile.getSize() > 0)
				{
					String originalFilename = upFile.getOriginalFilename();
					String renamedFilename = HelloSpringUtils.getRenamedFilename(originalFilename);
					log.debug("renamedFilename = {}", renamedFilename);
					
					File destFile = new File(saveDirectory, renamedFilename);
					upFile.transferTo(destFile);
					
					FriendBoardAttachment attach = new FriendBoardAttachment();
					attach.setFbaOriginalFilename(originalFilename);
					attach.setFbaRenamedFilename(renamedFilename);
					insertFriendBoard.addAttachment(attach);
				}
			}
			
			int result = friendBoardService.insertFriendBoard(insertFriendBoard);
			
		} catch(IOException e) {
			log.error("첨부파일 저장 오류", e);
			
		} catch (Exception e) {
			log.error("게시글 등록 오류", e);
			throw e;
		}
		
		return "redirect:/board/friend/friendBoard.do";
	}
	
	@GetMapping("/board/friend/friendBoardDetail.do")
	public ModelAndView FriendBoardDetail(@RequestParam int no, Model model, ModelAndView mav, HttpServletRequest request, HttpServletResponse response) {
		try {
			log.debug("no = {}", no);			
			InsertFriendBoard insertFriendBoard = friendBoardService.selectOneFriendBoard(no);
			log.debug("insertFriendBoard = {}", insertFriendBoard);			
			
			
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
						int result = friendBoardService.updateReadCount(no);
					}
				}
			}
			
			if(visitor == 0)
			{
				Cookie cookie1 = new Cookie("visit", request.getParameter("no"));
				cookie1.setMaxAge(60*60*24);
				response.addCookie(cookie1);
				int result = friendBoardService.updateReadCount(no);
			}
			
			Planner planner = friendBoardService.findBoardPlannerByNoModel(no);
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
			
//	        int result = friendBoardService.updateReadCount(no);
			mav.addObject("insertFriendBoard", insertFriendBoard);
			mav.setViewName("board/friend/friendBoardDetail");

		} catch (Exception e) {
			log.error("게시글 조회 오류", e);
			throw e;
		}
		return mav;
	}

	@GetMapping("/board/friend/friendBoardUpdate.do")
	public void friendBoardUpdate(@RequestParam int no, @AuthenticationPrincipal Member member, Planner planner, Model model) {
		try {
			InsertFriendBoard insertFriendBoard = friendBoardService.selectOneFriendBoard(no);
			log.debug("insertFriendBoard = {}", insertFriendBoard);
			
			String memberEmail = member.getMEmail();
			log.debug("memberEmail = {}", memberEmail);
			
			List<Planner> plannerList = plannerService.findPlannerByEmail(memberEmail);
			log.debug("plannerList = {}", plannerList);
			
			List<PlannerPlan> plans = plannerService.findPlansList(plannerList);
			log.debug("plans = {}", plans);
			
			model.addAttribute("plannerList", plannerList);
			model.addAttribute("plans", plans);
			model.addAttribute("insertFriendBoard",insertFriendBoard);
		} catch (Exception e) {
			log.error("게시글 수정 폼 오류", e);
			throw e;
		}
	}
	
	@PostMapping("/board/friend/friendBoardUpdate.do")
	public String friendBoardUpdate(
			@ModelAttribute InsertFriendBoard insertFriendBoard,
			@RequestParam("upFile") MultipartFile[] upFiles,
			@RequestParam(value="delFile", required=false) int[] delFiles,
			RedirectAttributes redirectAttr) throws Exception {
		
		String saveDirectory = application.getRealPath("/resources/upload/friendboard");
		
		try {
				if(delFiles != null)
				{
					for(int attachNo : delFiles)
					{
						FriendBoardAttachment attach = friendBoardService.selectOneAttachment(attachNo);
						log.debug("attach= {}", attach);
						log.debug("insertFriendBoard = {}", insertFriendBoard);
						
						String renamedFilename = attach.getFbaRenamedFilename();
						File delFile = new File(saveDirectory, renamedFilename);
						if(delFile.exists())
						{
							delFile.delete();
							log.debug("{}번 {}파일 삭제", attachNo, renamedFilename);
						}
						
						int result = friendBoardService.deleteAttachment(attachNo);
						log.debug("{}번 Attachment 레코드 삭제", attachNo);
					}
				}
				
				for(MultipartFile upFile : upFiles)
				{
					if(upFile.getSize() > 0)
					{
						FriendBoardAttachment attach = new FriendBoardAttachment();
						attach.setFbaOriginalFilename(upFile.getOriginalFilename());
						attach.setFbaRenamedFilename(HelloSpringUtils.getRenamedFilename(upFile.getOriginalFilename()));
						attach.setFbaFbNo(insertFriendBoard.getFbNo());
						insertFriendBoard.addAttachment(attach);
						
						File destFile = new File(saveDirectory, attach.getFbaRenamedFilename());
						upFile.transferTo(destFile);
					}
				}
				
				int result = friendBoardService.updateFriendBoard(insertFriendBoard);
				
		}
		catch(Exception e) {
			log.error("게시글 수정 오류", e);
			throw e;
		}

		return "redirect:/board/friend/friendBoardDetail.do?no=" + insertFriendBoard.getFbNo();
	}
	
	@GetMapping(path = "/board/friend/fileDownload.do", produces = MediaType.APPLICATION_OCTET_STREAM_VALUE)
	@ResponseBody
	public Resource fileDownload(@RequestParam int no, HttpServletResponse response) throws Exception {
		Resource resource = null;
		try {
			FriendBoardAttachment attach = friendBoardService.selectOneAttachment(no);
			log.debug("attach = {}", attach);
			
			String saveDirectory = application.getRealPath("/resources/upload/friendboard");
			File downFile = new File(saveDirectory, attach.getFbaRenamedFilename());
			
			String location = "file:" + downFile;
			log.debug("location = {}",location);
			resource = resourceLoader.getResource(location);
			
			String filename = URLEncoder.encode(attach.getFbaOriginalFilename(), "utf-8");
//			response.setContentType(MediaType.APPLICATION_OCTET_STREAM_VALUE);
			response.addHeader(HttpHeaders.CONTENT_DISPOSITION, "attachment; filename=\"" + filename + "\"");
			
		} catch (Exception e) {
			log.error("파일 다운로드 오류", e);
			throw e;
		}
		
		return resource;
	}
	
	@GetMapping("/board/friend/friendBoardDelete.do")
	public String friendBoardDelete(@RequestParam int no) {
		try {
			log.debug("no = {}",no);
			int result = friendBoardService.deleteFriendBoard(no);
			
			
		} catch (Exception e) {
			log.error("게시판 삭제 오류",e);
			throw e;
		}
		
		return "redirect:/board/friend/friendBoard.do";
	}
	
	@PostMapping("/board/friend/friendBoardCommentEnroll.do")
	public String friendBoardCommentEnroll(@RequestParam int fbcFbNo, @RequestParam String fbcMEmail, @RequestParam String fbcContent) {
		try {
			log.debug("fbNo = {}",fbcFbNo);
			log.debug("fbMEmail = {}",fbcMEmail);
			log.debug("fbcContent = {}",fbcContent);
			
			FriendBoardComment fbComment = new FriendBoardComment(0, fbcMEmail, fbcFbNo, null, fbcContent);
			
			int result = friendBoardService.insertFriendComment(fbComment);
			
		} catch (Exception e) {
			log.error("댓글 작성 오류", e);
			throw e;
		}
		return  "redirect:/board/friend/friendBoardDetail.do?no=" + fbcFbNo;
	}
	
	@GetMapping("/board/friend/deleteComment.do")
	public String friendBoarddeleteComment(@RequestParam int fbcFbNo, @RequestParam int fbcNo) {
		try {
			log.debug("fbcFbNo = {}", fbcFbNo);
			log.debug("fbcNo = {}", fbcNo);
			
			int result = friendBoardService.deleteFriendBoardComment(fbcNo);
			
		} catch (Exception e) {
			log.error("댓글 삭제 오류",e);
			throw e;
		}
		return "redirect:/board/friend/friendBoardDetail.do?no=" + fbcFbNo;
	}

}






