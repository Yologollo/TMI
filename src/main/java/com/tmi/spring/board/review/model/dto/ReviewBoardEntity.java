package com.tmi.spring.board.review.model.dto;

import java.time.LocalDateTime;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class ReviewBoardEntity {
	private int rb_no;
	private int rb_p_no;
	private String m_nickname;
	private String rb_title;
	private String rb_content;
	private LocalDateTime rb_created_at;
	private LocalDateTime rb_updated_at;
	private int rb_read_count;
}
