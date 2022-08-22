package com.tmi.spring.member.model.dto;

import java.time.LocalDateTime;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.NonNull;

/**
 * 
 * @생성 이경석
 * @작업 이경석
 *
 */

@Data
@NoArgsConstructor
@AllArgsConstructor
public class MemberFriendBoard extends MemberEntity{
	private int fbNo;
	private int fbPNo;
	private String mNickName;
	private String fbTitle;
	private String fbContent;
	private LocalDateTime fbCreatedAt;
	private LocalDateTime fbUpdatedAt;
	private int fbReadCount;
	
	private int attachCount;
	private int commentCount;
	
	public MemberFriendBoard(String mNickName, int mNo, String mEmail, String mPassword,
			String mName, String mPhone, LocalDateTime mCreatedAt, int fbNo, int fbPNo, 
			String fbTitle, String fbContent, LocalDateTime fbCreatedAt, LocalDateTime fbUpdatedAt, 
			int fbReadCount, int attachCount, int commentCount) {
		super(mNickName, mNo, mEmail, mPassword, mName, mPhone, mCreatedAt);
		this.fbNo = fbNo;
		this.fbPNo = fbPNo;
		this.mNickName = mNickName;
		this.fbTitle = fbTitle;
		this.fbContent = fbContent;
		this.fbCreatedAt = fbCreatedAt;
		this.fbUpdatedAt = fbUpdatedAt;
		this.fbReadCount = fbReadCount;
		this.attachCount = attachCount;
		this.commentCount = commentCount;
	}

}
