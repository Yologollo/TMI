package com.tmi.spring.chat;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.handler.annotation.DestinationVariable;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.stereotype.Controller;

import com.tmi.spring.chat.model.service.ChatService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class StompController {
	
	@Autowired
	ChatService chatService;
	/**
	 * 사용자가 /app/def 메세지를 전송한 경우
	 * 
	 * /topic/abc 구독자에게 메세지 전송(SimpleBroker)
	 * 
	 * @return
	 */
	
	@MessageMapping("/chat/{chatroomId}")
	@SendTo("/app/chat/{chatroomId}")
	public Map<String, Object> sendChat(Map<String, Object> payload, @DestinationVariable String chatroomId) {
		log.debug("payload = {}",payload);
		int result = chatService.insertChatContentSend(payload);
		return payload;
	}
}
