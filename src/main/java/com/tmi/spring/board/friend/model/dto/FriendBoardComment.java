package com.tmi.spring.board.friend.model.dto;

import java.time.LocalDateTime;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class FriendBoardComment {
	private int fbcNo;
	private String fbcMEmail;
	private int fbcFbNo;
	private LocalDateTime fbcCreatedAt;
	private String fbcContent;
}
