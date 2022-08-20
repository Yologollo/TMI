package com.tmi.spring.member.model.dto;

import java.time.LocalDateTime;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.NonNull;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class MemberBoard extends MemberEntity{
	private int fbNo;
	private int fbPNo;
	private String fbMEmail;
	private String fbTitle;
	private String fbContent;
	private LocalDateTime fbCreatedAt;
	private LocalDateTime fbUpdatedAt;
	private int fbReadCount;
	
	private int pbNo;
	private int pbPNo;
	private String pbMEmail;
	private String pbTitle;
	private String pbContent;
	private LocalDateTime pbCreatedAt;
	private LocalDateTime pbUpdatedAt;
	private int pbReadCount;
	
	private int rbNo;
	private int rbPNo;
	private String rbMEmail;
	private String rbTitle;
	private String rbContent;
	private LocalDateTime rbCreatedAt;
	private LocalDateTime rbUpdatedAt;
	private int rbReadCount;
}
