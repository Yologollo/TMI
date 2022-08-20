package com.tmi.spring.board.planner.model.dto;

import java.time.LocalDate;
import java.time.LocalDateTime;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class PlannerBoardEntity {
	private int pb_no;
	private int pb_p_no;
	private String m_nickname;
	private String pb_title;
	private String pb_content;
	private LocalDateTime pb_created_at;
	private LocalDateTime pb_updated_at;
	private int pb_read_count;
	private int pNo;
	private String pTitle;
	private String pExplan;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private LocalDate pLeaveDate;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private LocalDate pReturnDate;
}
