package com.tmi.spring.board.planner.model.dto;

import java.time.LocalDateTime;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@NoArgsConstructor
@ToString(callSuper = true) 
public class PlannerBoard extends PlannerBoardEntity {
	private int commentCount;
	
	public PlannerBoard(int pb_no, int pb_p_no, String m_nickname, String pb_title, String pb_content,
			LocalDateTime pb_created_at, LocalDateTime pb_updated_at, int pb_read_count, int commentCount) {
		super(pb_no, pb_p_no, m_nickname, pb_title, pb_content, pb_created_at, pb_updated_at, pb_read_count);
		this.commentCount = commentCount;
	}
}
