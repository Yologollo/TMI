package com.tmi.spring.board.friend.model.dto;

import java.time.LocalDateTime;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class FriendBoardEntity {
	private int fb_no;
	private int fb_p_no;
	private String m_nickname;
	private String fb_title;
	private String fb_content;
	private LocalDateTime fb_created_at;
	private LocalDateTime fb_updated_at;
	private int fb_read_count;
}
