package com.tmi.spring.board.planner.model.dto;

import java.time.LocalDate;
import java.time.LocalDateTime;

import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@NoArgsConstructor
@ToString(callSuper = true)
public class PlannerBoardSearch extends PlannerBoardEntity {
	private int commentCount;
	
	// 검색용
	private String searchType;
	private String keyword;
	
	public PlannerBoardSearch(int commentCount, String searchType, String keyword) {
		super();
		this.commentCount = commentCount;
		this.searchType = searchType;
		this.keyword = keyword;
	}
	
	
	public PlannerBoardSearch(int pb_no, int pb_p_no, String m_nickname, String pb_title, String pb_content,
			LocalDateTime pb_created_at, LocalDateTime pb_updated_at, int pb_read_count, int pNo, String pTitle,
			String pExplan, LocalDate pLeaveDate, LocalDate pReturnDate) {
		super(pb_no, pb_p_no, m_nickname, pb_title, pb_content, pb_created_at, pb_updated_at, pb_read_count, pNo, pTitle,
				pExplan, pLeaveDate, pReturnDate);
	}

}
