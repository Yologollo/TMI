package com.tmi.spring.admin.notice.model.dto;

import java.time.LocalDateTime;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class NoticeBoardAttachment {
	private int nbaNO;
	private int nbaNbNo;
	private String nbaOriginalFilename;
	private String nbaRenamedFilename;
	private LocalDateTime nbaCreatedAt;
	
	
		
}
