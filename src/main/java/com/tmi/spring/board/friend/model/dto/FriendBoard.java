package com.tmi.spring.board.friend.model.dto;

import java.time.LocalDateTime;

import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@NoArgsConstructor
@ToString(callSuper = true)
public class FriendBoard extends FriendBoardEntity {
	private int attachCount;
	private int commentCount;

	public FriendBoard(int fb_no, int fb_p_no, String m_nickname, String fb_title, String fb_content,
			LocalDateTime fb_created_at, LocalDateTime fb_updated_at, int fb_read_count, int attachCount, int commentCount) {
		super(fb_no, fb_p_no, m_nickname, fb_title, fb_content, fb_created_at, fb_updated_at, fb_read_count);
		this.attachCount = attachCount;
		this.commentCount = commentCount;
	}
}
