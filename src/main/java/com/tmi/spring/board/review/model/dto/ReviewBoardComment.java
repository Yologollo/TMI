package com.tmi.spring.board.review.model.dto;

import java.time.LocalDateTime;

import com.tmi.spring.board.friend.model.dto.FriendBoardComment;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class ReviewBoardComment {
	private int rbcNo;
	private int rbcRbNo;
	private String rbcMEmail;
	private LocalDateTime rbcCreatedAt;
	private String rbcContent;
}
