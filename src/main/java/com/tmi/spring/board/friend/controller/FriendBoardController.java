 package com.tmi.spring.board.friend.controller;

import java.io.File;
import java.io.IOException;
import java.net.URLEncoder;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.Resource;
import org.springframework.core.io.ResourceLoader;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
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
import com.tmi.spring.board.friend.model.dto.InsertFriendBoard;
import com.tmi.spring.board.friend.model.service.FriendBoardService;
import com.tmi.spring.common.HelloSpringUtils;

import lombok.extern.slf4j.Slf4j;

/**
 * 
 * @생성 김용민
 * @작업 이경석
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

	@GetMapping("/board/friend/friendBoard.do")
	public ModelAndView FriendBoard(@RequestParam(defaultValue = "1") int cPage, ModelAndView mav, HttpServletRequest request) {
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
	public void FriendBoardForm() {}
	
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
	public ModelAndView FriendBoardDetail(@RequestParam int no, ModelAndView mav) {
		try {
			log.debug("no = {}", no);			
			InsertFriendBoard insertFriendBoard = friendBoardService.selectOneFriendBoard(no);
			log.debug("insertFriendBoard = {}", insertFriendBoard);
			
			mav.addObject("insertFriendBoard", insertFriendBoard);
			mav.setViewName("board/friend/friendBoardDetail");

		} catch (Exception e) {
			log.error("게시글 조회 오류", e);
			throw e;
		}
		return mav;
	}
	
	@GetMapping("/board/friend/friendBoardUpdate.do")
	public void friendBoardUpdate(@RequestParam int no, Model model) {
		try {
			InsertFriendBoard insertFriendBoard = friendBoardService.selectOneFriendBoard(no);
			log.debug("insertFriendBoard = {}", insertFriendBoard);
			
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

}






