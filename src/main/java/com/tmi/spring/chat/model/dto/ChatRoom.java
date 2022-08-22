package com.tmi.spring.chat.model.dto;

import java.time.LocalDateTime;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;

/**
 * 
 * @생성 최윤서
 * @작업 최윤서
 *
 */

@Data
@NoArgsConstructor
@AllArgsConstructor
@RequiredArgsConstructor
public class ChatRoom {
	@NonNull
	private String chatroomId;
	@NonNull
	private String sendEmail;
	@NonNull
	private String receiveEmail;
	private String lastCheck;
	private LocalDateTime createdAt;
	private LocalDateTime deleteAt;
	
}
