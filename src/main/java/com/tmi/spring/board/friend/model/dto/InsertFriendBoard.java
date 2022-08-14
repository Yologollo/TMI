package com.tmi.spring.board.friend.model.dto;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

import com.tmi.spring.member.model.dto.MemberEntity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.NonNull;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class InsertFriendBoard {
	private List<FriendBoardAttachment> attachments = new ArrayList<>();
	private List<FriendBoardComment> comments = new ArrayList<>();
	
	private int fbNo;
	private int fbPNo;
	private String fbMEmail;
	private String fbTitle;
	private String fbContent;
	private LocalDateTime fbCreatedAt;
	private LocalDateTime fbUpdatedAt;
	private int fbReadCount;
	
	public void addAttachment(@NonNull FriendBoardAttachment attach) {
			attachments.add(attach);
	}

	public void setBoardComments(List<FriendBoardComment> comments) {
			this.comments = comments;
	}
}
