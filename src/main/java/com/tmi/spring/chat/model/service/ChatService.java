package com.tmi.spring.chat.model.service;

import java.util.List;
import java.util.Map;

import com.tmi.spring.chat.model.dto.ChatContent;
import com.tmi.spring.chat.model.dto.ChatRoom;

/**
 * 
 * @생성 최윤서
 * @작업 최윤서
 *
 */

public interface ChatService {

	int createChatRoom(String chatroomId, String sendEmail, String receiveEmail);

	ChatRoom findChatRoomByMemberEmail(String sendEmail, String receiveEmail);
	
	// 메세지 insert
	int insertChatContentSend(Map<String, Object> payload);

	// 채팅 내용 조회
	List<ChatContent> findChatContentByChatRoomId(String chatroomId);

	List<ChatContent> findRecentChatRoomList(String loginMemberEmail);

	List<ChatContent> findChatRoomList(String roomId);

}
