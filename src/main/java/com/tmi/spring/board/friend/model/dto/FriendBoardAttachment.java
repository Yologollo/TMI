package com.tmi.spring.board.friend.model.dto;

import java.time.LocalDateTime;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class FriendBoardAttachment {
	private int fbaNo;
	private int fbaFbNo;
	private String fbaOriginalFilename;
	private String fbaRenamedFilename;
	private LocalDateTime tbaCreatedAt;
}
