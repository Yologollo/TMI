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
	private String mNickname;
	private String fbTitle;
	private String fbContent;
	private LocalDateTime fbCreatedAt;
	private LocalDateTime fbUpdatedAt;
	private int fbReadCount;
}
