package com.tmi.spring.board.planner.model.dto;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

import com.tmi.spring.board.review.model.dto.InsertReviewBoard;
import com.tmi.spring.board.review.model.dto.ReviewBoardAttachment;
import com.tmi.spring.board.review.model.dto.ReviewBoardComment;
import com.tmi.spring.planner.model.dto.Planner;
import com.tmi.spring.planner.model.dto.PlannerPlan;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.NonNull;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class InsertPlannerBoard {
	private List<PlannerBoardComment> comments = new ArrayList<>();
	private List<Planner> planner = new ArrayList<>();
	private List<PlannerPlan> plans = new ArrayList<>();
	
	private int pbNo;
	private int pbPNo;
	private String pbMEmail;
	private String pbTitle;
	private String pbContent;
	private LocalDateTime pbCreatedAt;
	private LocalDateTime pbUpdatedAt;
	private int pbReadCount;

public void setBoardComments(List<PlannerBoardComment> comments) {
		this.comments = comments;
}
}
