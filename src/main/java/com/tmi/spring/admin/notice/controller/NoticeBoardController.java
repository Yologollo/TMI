package com.tmi.spring.admin.notice.controller;

import java.io.File;
import java.io.IOException;
import java.net.URLEncoder;
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
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.tmi.spring.admin.notice.model.dto.InsertNoticeBoard;
import com.tmi.spring.admin.notice.model.dto.NoticeBoard;
import com.tmi.spring.admin.notice.model.dto.NoticeBoardAttachment;
import com.tmi.spring.admin.notice.model.service.NoticeBoardService;
import com.tmi.spring.board.friend.model.dto.FriendBoardAttachment;
import com.tmi.spring.common.HelloSpringUtils;

import lombok.extern.slf4j.Slf4j;
/**
 * 
 * @생성 권민지
 * @작업 권민지
 *
 */
@Controller
@Slf4j
public class NoticeBoardController {

	@Autowired
	NoticeBoardService noticeBoardService;

	@Autowired
	ServletContext application;
	 
	@Autowired
	ResourceLoader resourceLoader;

	@GetMapping("/admin/notice/noticeBoard.do")
	public ModelAndView noticeBoard(@RequestParam(defaultValue = "1") int cPage, ModelAndView mav,
			HttpServletRequest request) {
		try {
			// 목록조회
			int numPerPage = 10;
			List<NoticeBoard> list = noticeBoardService.selectNoticeBoardList(cPage, numPerPage);
			log.debug("list = {}", list);
			mav.addObject("list", list);

			// 페이지바
			int totalContent = noticeBoardService.selectTotalContent();
			String url = request.getRequestURI();

			log.debug("totalContent = {}", totalContent);
			String pagebar = HelloSpringUtils.getPagebar(cPage, numPerPage, totalContent, url);
			log.debug("pagebar = {}", pagebar);
			mav.addObject("pagebar", pagebar);

			// viewName설정
			mav.setViewName("admin/notice/noticeBoard");
		} catch (Exception e) {
			log.error("공지사항 목록 조회 오류", e);
		}

		return mav;
	}
	
	@GetMapping("/admin/notice/noticeBoardForm.do")
	public void NoticeBoardform() {
	}

	@PostMapping("/admin/notice/noticeBoardEnroll.do")
	public String NoticeBoardEnroll(InsertNoticeBoard insertNoticeBoard, //
			@RequestParam("upFile") MultipartFile[] upFiles, RedirectAttributes redirectAttr) {
		try {
			log.debug("noticeBoard = {}", insertNoticeBoard);

			String saveDirectory = application.getRealPath("/resources/upload/noticeboard");

			// 업로드할 파일 저장
			for (MultipartFile upFile : upFiles) {
				if (upFile.getSize() > 0) {
					// 파일재지정
					String originalFilename = upFile.getOriginalFilename();
					String renamedFilename = HelloSpringUtils.getRenamedFilename(originalFilename);
					log.debug("renamedFilename = {}", renamedFilename);

					File destFile = new File(saveDirectory, renamedFilename);
					upFile.transferTo(destFile); // 파일저장

					NoticeBoardAttachment attach = new NoticeBoardAttachment();
					attach.setNbaOriginalFilename(originalFilename);
					attach.setNbaRenamedFilename(renamedFilename);
					insertNoticeBoard.addAttachment(attach); //
				}
			}

			int result = noticeBoardService.insertNoticeBoard(insertNoticeBoard);

		} catch (IOException e) {
			log.error("첨부파일 저장 오류", e);

		} catch (Exception e) {
			log.error("게시글 등록 오류", e);
			throw e;
		}

		return "redirect:/admin/notice/noticeBoard.do";
	}

	@GetMapping("/admin/notice/noticeBoardDetail.do")
	public ModelAndView NoticeBoardDetail(@RequestParam int no, Model model, ModelAndView mav,
			HttpServletRequest request, HttpServletResponse response) {
		try {
			log.debug("no = {}", no);
			InsertNoticeBoard insertNoticeBoard = noticeBoardService.selectOneNoticeBoard(no);
			log.debug("insertNoticeBoard = {}", insertNoticeBoard);

			Cookie[] cookies = request.getCookies();
			int visitor = 0;

			for (Cookie cookie : cookies) {
				log.info(cookie.getName());
				if (cookie.getName().equals("visit")) {
					visitor = 1;

					log.info("visit통과");

					if (cookie.getValue().contains(request.getParameter("no"))) {
						log.info("visit no통과");
					} else {
						cookie.setValue(cookie.getValue() + "_" + request.getParameter("no"));
						cookie.setMaxAge(60 * 60 * 24);
						response.addCookie(cookie);
						int result = noticeBoardService.updateReadCount(no);
					}
				}
			}

			if (visitor == 0) {
				Cookie cookie1 = new Cookie("visit", request.getParameter("no"));
				cookie1.setMaxAge(60 * 60 * 24);
				response.addCookie(cookie1);
				int result = noticeBoardService.updateReadCount(no);
			}

			mav.addObject("insertNoticeBoard", insertNoticeBoard);
			mav.setViewName("admin/notice/noticeBoardDetail");

		} catch (Exception e) {
			log.error("게시글 조회 오류", e);
			throw e;
		}
		return mav;
	}

	@GetMapping("/admin/notice/noticeBoardDelete.do")
	public String noticeBoardDelete(@RequestParam int no) {
		try {
			log.debug("no = {}", no);
			int result = noticeBoardService.deleteNoticeBoard(no);

		} catch (Exception e) {
			log.error("게시판 삭제 오류", e);
			throw e;
		}

		return "redirect:/admin/notice/noticeBoard.do";
	}

	@GetMapping("/admin/notice/noticeBoardUpdate.do")
	public void friendBoardUpdate(@RequestParam int no, Model model) {
		try {
			InsertNoticeBoard insertNoticeBoard = noticeBoardService.selectOneNoticeBoard(no);
			log.debug("insertNoticeBoard = {}", insertNoticeBoard);

			model.addAttribute("insertNoticeBoard", insertNoticeBoard);
		} catch (Exception e) {
			log.error("게시글 수정폼 오류", e);
			throw e;
		}
	}

	@PostMapping("/admin/notice/noticeBoardUpdate.do")
	public String noticeBoardUpdate(
			@ModelAttribute InsertNoticeBoard insertNoticeBoard,
			@RequestParam("upFile") MultipartFile[] upFiles,
			@RequestParam(value = "delFile", required = false) int[] delFiles, 
			RedirectAttributes redirectAttr)
			throws Exception {

		String saveDirectory = application.getRealPath("/resources/upload/noticeboard");
		try {
			if (delFiles != null) {
				for (int attachNo : delFiles) {
					NoticeBoardAttachment attach = noticeBoardService.selectOneAttachment(attachNo);
					log.debug("attach= {}", attach);
					log.debug("insertNoticeBoard = {}", insertNoticeBoard);

					String renamedFilename = attach.getNbaRenamedFilename();
					File delFile = new File(saveDirectory, renamedFilename);
					if (delFile.exists()) {
						delFile.delete();
						log.debug("{}번 {}파일 삭제", attachNo, renamedFilename);
					}

					int result = noticeBoardService.deleteAttachment(attachNo);
					log.debug("{}번 Attachment 레코드 삭제", attachNo);
				}
			}
				//첨부파일 등록
			for (MultipartFile upFile : upFiles) {
				if (upFile.getSize() > 0) {
					NoticeBoardAttachment attach = new NoticeBoardAttachment();
					attach.setNbaOriginalFilename(upFile.getOriginalFilename());
					attach.setNbaRenamedFilename(HelloSpringUtils.getRenamedFilename(upFile.getOriginalFilename()));
					attach.setNbaNbNo(insertNoticeBoard.getNbNo());
					insertNoticeBoard.addAttachment(attach);

					File destFile = new File(saveDirectory, attach.getNbaRenamedFilename());
					upFile.transferTo(destFile);
				}
			}
			//수정
			int result = noticeBoardService.updateNoticeBoard(insertNoticeBoard);

		} catch (Exception e) {
			log.error("게시글 수정 오류", e);
			throw e;
		}

		return "redirect:/admin/notice/noticeBoardDetail.do?no=" + insertNoticeBoard.getNbNo();
	} // #no

	
	
	@GetMapping(path = "/admin/notice/fileDownload.do", produces = MediaType.APPLICATION_OCTET_STREAM_VALUE)
	@ResponseBody
	public Resource fileDownload(@RequestParam int no, HttpServletResponse response) throws Exception {
		Resource resource = null;
		try {
			//1.첨부파일 조회
			NoticeBoardAttachment attach = noticeBoardService.selectOneAttachment(no);
			log.debug("attach = {}", attach);
			
			String saveDirectory = application.getRealPath("/resources/upload/noticeboard");
			File downFile = new File(saveDirectory, attach.getNbaRenamedFilename());
			
			//2.Resource객체 생성
			String location = "file:" + downFile;
			log.debug("location = {}",location);
			resource = resourceLoader.getResource(location);
			
			//3. 응답헤더
			String filename = URLEncoder.encode(attach.getNbaOriginalFilename(), "utf-8");
			response.addHeader(HttpHeaders.CONTENT_DISPOSITION, "attachment; filename=\"" + filename + "\"");
			
		} catch (Exception e) {
			log.error("파일 다운로드 오류", e);
			throw e;
		}
		
		return resource;
	}
	
	
}
