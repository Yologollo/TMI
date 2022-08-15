package com.tmi.spring.board.review.model.dto;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

import com.tmi.spring.board.friend.model.dto.FriendBoardAttachment;
import com.tmi.spring.board.friend.model.dto.FriendBoardComment;
import com.tmi.spring.board.friend.model.dto.InsertFriendBoard;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.NonNull;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class InsertReviewBoard {
	private List<ReviewBoardAttachment> attachments = new ArrayList<>();
	private List<ReviewBoardComment> comments = new ArrayList<>();
	
	private int rbNo;
	private int rbPNo;
	private String rbMEmail;
	private String rbTitle;
	private String rbContent;
	private LocalDateTime rbCreatedAt;
	private LocalDateTime rbUpdatedAt;
	private int rbReadCount;
	
	public void addAttachment(@NonNull ReviewBoardAttachment attach) {
			attachments.add(attach);
	}

	public void setBoardComments(List<ReviewBoardComment> comments) {
			this.comments = comments;
	}
}
