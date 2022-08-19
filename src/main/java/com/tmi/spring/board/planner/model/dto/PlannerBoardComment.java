package com.tmi.spring.board.planner.model.dto;

import java.time.LocalDateTime;

import com.tmi.spring.board.review.model.dto.ReviewBoardComment;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class PlannerBoardComment {
	private int pbcNo;
	private int pbcPbNo;
	private String pbcMEmail;
	private LocalDateTime pbcCreatedAt;
	private String pbcContent;
}
