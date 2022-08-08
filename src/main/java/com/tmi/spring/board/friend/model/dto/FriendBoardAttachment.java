package com.tmi.spring.board.friend.model.dto;

import java.time.LocalDateTime;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class FriendBoardAttachment {
	private int fba_no;
	private int fba_fb_no;
	private String fba_original_filename;
	private String fba_renamed_filename;
	private LocalDateTime tba_created_at;
}
