package com.tmi.spring.board.planner.model.dto;

import com.tmi.spring.board.review.model.dto.ReviewBoardLove;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class PlannerBoardLove {
	private int pblNo;
	private int pblPbNo;
	private String pblMEmail;
	private int pblType;

}
