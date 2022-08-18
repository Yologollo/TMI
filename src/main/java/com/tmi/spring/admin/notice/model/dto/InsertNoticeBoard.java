package com.tmi.spring.admin.notice.model.dto;

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

public class InsertNoticeBoard {
	private List<NoticeBoardAttachment> attachments = new ArrayList<>();
	
	private int nbNo;
	/* private int nbPNo; */
	private String nbMEmail;
	private String nbTitle;
	private String nbContent;
	private LocalDateTime nbCreatedAt;
	private LocalDateTime nbUpdatedAt;
	private int nbReadCount;
	
	public void addAttachment(@NonNull NoticeBoardAttachment attach) {
			attachments.add(attach);
	}
}
