package com.tmi.spring.chat.controller;

import java.util.List;
import java.util.Map;
import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.tmi.spring.chat.model.dto.ChatContent;
import com.tmi.spring.chat.model.dto.ChatRoom;
import com.tmi.spring.chat.model.service.ChatService;
import com.tmi.spring.member.model.dto.Member;

import lombok.extern.slf4j.Slf4j;

/**
 * 
 * @생성 최윤서
 * @작업 최윤서
 *
 */

@Controller
@Slf4j
@RequestMapping("/chat")
public class ChatController {
	
	@Autowired
	ChatService chatService;
	
	@GetMapping("/chatMainPage.do")
	public void chatMainPage() {
		
	}
	
	@GetMapping(value = "/room.do", produces = "application/json")
	public ResponseEntity<?> roomContentList(Map<String, Object> chatRoomList, @RequestParam String roomId) {
		try {
			log.debug("------중요------roomId = {}", roomId);
			List<ChatContent> list = chatService.findChatRoomList(roomId);
			log.debug("list = {}", list);
			return ResponseEntity.ok(list);
		} catch(Exception e) {
			log.error("채팅방 내용 조회 오류", e);
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).build();
		}
		
	}
	
	@GetMapping(value = "/roomList.do", produces = "application/json")
	public ResponseEntity<?> chatRoomList(Map<String, Object> chatRoomList, @RequestParam String loginMemberEmail) {
		try {
			log.debug("------중요------loginMemberEmail = {}", loginMemberEmail);
			List<ChatContent> list = chatService.findRecentChatRoomList(loginMemberEmail);
			log.debug("list = {}", list);
			return ResponseEntity.ok(list);
		} catch(Exception e) {
			log.error("채팅목록조회오류", e);
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).build();
		}
	}
	
	@GetMapping("/chatRoom.do")
	public void chatRoom(@AuthenticationPrincipal Member member, @RequestParam String email, Model model) {
		String sendEmail = member.getMEmail();
		String receiveEmail = email;
		log.debug("sendEmail = {}", sendEmail);
		log.debug("receiveEmail = {}", email);
		
		// send와 receive 둘 다 확인		
		ChatRoom chatRoom = chatService.findChatRoomByMemberEmail(sendEmail, receiveEmail);
		log.debug("chatRoom = {}", chatRoom);
		String chatroomId = null;
		if(chatRoom != null) {
			// 채팅방이 존재하는 경우
			chatroomId = chatRoom.getChatroomId();
			// 채팅내역 가져오기
			List<ChatContent> chatContentList = chatService.findChatContentByChatRoomId(chatroomId);
			log.debug("chatContentList = {}", chatContentList);
			model.addAttribute("chatContentList", chatContentList);

			
		} else {
			// 채팅방 처음 입장한 경우
			// chatroomId 생성
			chatroomId = getChatroomId();
			
			// 채팅방 생성 
			int result = chatService.createChatRoom(chatroomId, sendEmail, receiveEmail);
		}
		log.debug("chatroomId = {}", chatroomId);
		model.addAttribute("chatroomId",chatroomId);
		model.addAttribute("receiveEmail",receiveEmail);
	
	}

		private String getChatroomId() {
			final int LEN = 8;
			Random rnd = new Random();
			StringBuffer sb = new StringBuffer();
			for(int i = 0; i < LEN; i++) {
				if(rnd.nextBoolean()) {
					if(rnd.nextBoolean())
						sb.append((char)(rnd.nextInt(26) + 'A'));
					else
						sb.append((char)(rnd.nextInt(26) + 'a'));
				}
				else {
					sb.append(rnd.nextInt(10));
				}
			}
			return sb.toString();
		}
		
}
	
