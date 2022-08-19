package com.tmi.spring.chat.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.tmi.spring.chat.controller.ChatController;
import com.tmi.spring.chat.model.dao.ChatDao;
import com.tmi.spring.chat.model.dto.ChatContent;
import com.tmi.spring.chat.model.dto.ChatRoom;

import lombok.extern.slf4j.Slf4j;

/**
 * 
 * @생성 최윤서
 * @작업 최윤서
 *
 */

@Transactional(rollbackFor = Exception.class)
@Service
@Slf4j
public class ChatServiceImpl implements ChatService{
	
	@Autowired
	ChatDao chatDao;

	@Override
	public int createChatRoom(String chatroomId, String sendEmail, String receiveEmail) {
		return chatDao.createChatRoom(chatroomId, sendEmail, receiveEmail);
	}
	@Override
	public ChatRoom findChatRoomByMemberEmail(String sendEmail, String receiveEmail) {
		ChatRoom chatRoom = null;
		chatRoom = chatDao.findChatRoomByMemberReceiveEmail(receiveEmail, sendEmail);
		if(chatRoom == null) 
			chatRoom = chatDao.findChatRoomByMemberSendEmail(sendEmail, receiveEmail);
		return chatRoom;
	}

	@Override
	public int insertChatContentSend(Map<String, Object> payload) {	
		return chatDao.insertChatContentSend(payload);
	}
	@Override
	public List<ChatContent> findChatContentByChatRoomId(String chatroomId) {
		return chatDao.findChatContentByChatRoomId(chatroomId);
	}
	@Override
	public List<ChatContent> findRecentChatRoomList(String loginMemberEmail) {
		return chatDao.findRecentChatRoomList(loginMemberEmail);
	}
	@Override
	public List<ChatContent> findChatRoomList(String roomId) {
		return chatDao.findChatRoomList(roomId);
	}
	@Override
	public int deleteChatRoom(String chatroomId) {
		return chatDao.deleteChatRoom(chatroomId);
	}

}
