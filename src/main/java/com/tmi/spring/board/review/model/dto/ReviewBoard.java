package com.tmi.spring.board.review.model.dto;

import java.time.LocalDateTime;

import com.tmi.spring.board.friend.model.dto.FriendBoard;

import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@NoArgsConstructor
@ToString(callSuper = true) 
public class ReviewBoard extends ReviewBoardEntity {
	private int attachCount;
	private int commentCount;
	
	public ReviewBoard(int rb_no, int rb_p_no, String m_nickname, String rb_title, String rb_content,
			LocalDateTime rb_created_at, LocalDateTime rb_updated_at, int rb_read_count, int attachCount, int commentCount) {
		super(rb_no, rb_p_no, m_nickname, rb_title, rb_content, rb_created_at, rb_updated_at, rb_read_count);
		this.attachCount = attachCount;
		this.commentCount = commentCount;
	}
}
