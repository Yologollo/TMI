package com.tmi.spring.board.friend.model.dto;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.NonNull;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class InsertFriendBoard {
	private List<FriendBoardAttachment> attachments = new ArrayList<>();
	
	private int fb_no;
	private int fb_p_no;
	private String fb_m_email;
	private String fb_title;
	private String fb_content;
	private LocalDateTime fb_created_at;
	private LocalDateTime fb_updated_at;
	private int fb_read_count;
	
	public void addAttachment(@NonNull FriendBoardAttachment attach) {
			attachments.add(attach);
	}
}