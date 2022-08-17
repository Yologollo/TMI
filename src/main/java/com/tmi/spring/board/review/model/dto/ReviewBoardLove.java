package com.tmi.spring.board.review.model.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class ReviewBoardLove {
	private int rblNo;
	private int rblRbNo;
	private String rblMEmail;
	private int rblType;
}
