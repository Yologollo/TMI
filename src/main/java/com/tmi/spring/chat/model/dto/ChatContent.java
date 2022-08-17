package com.tmi.spring.chat.model.dto;


import java.time.LocalDateTime;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.NonNull;
/**
 * 
 * @생성 최윤서
 * @작업 최윤서
 *
 */

@Data
@NoArgsConstructor
@AllArgsConstructor
public class ChatContent {
	@NonNull
	private long contentNo;
	@NonNull
	private String chatroomId;
	@NonNull
	private String sendEmail;
	@NonNull
	private String receiveEmail;
	private String messageContent;
	@JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd HH:mm:ss")
	private LocalDateTime messageTime;
}
