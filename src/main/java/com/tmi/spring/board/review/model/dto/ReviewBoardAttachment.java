package com.tmi.spring.board.review.model.dto;

import java.time.LocalDateTime;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class ReviewBoardAttachment {
	private int rbaNo;
	private int rbaRbNo;
	private String rbaOriginalFilename;
	private String rbaRenamedFilename;
	private LocalDateTime rbaCreatedAt;
}
