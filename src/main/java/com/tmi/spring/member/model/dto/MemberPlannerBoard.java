package com.tmi.spring.member.model.dto;

import java.time.LocalDateTime;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class MemberPlannerBoard extends MemberEntity {
	private int pbNo;
	private int pbPNo;
	private String mNickName;
	private String pbTitle;
	private String pbContent;
	private LocalDateTime pbCreatedAt;
	private LocalDateTime pbUpdatedAt;
	private int pbReadCount;
	
	private int attachCount;
	private int commentCount;

	public MemberPlannerBoard(String mNickName, int mNo, String mEmail, String mPassword,
			String mName, String mPhone, LocalDateTime mCreatedAt, int pbNo, int pbPNo, String pbTitle, String pbContent,
			LocalDateTime pbCreatedAt, LocalDateTime pbUpdatedAt, int pbReadCount, int attachCount, int commentCount) {
		super(mNickName, mNo, mEmail, mPassword, mName, mPhone, mCreatedAt);
		this.pbNo = pbNo;
		this.pbPNo = pbPNo;
		this.mNickName = mNickName;
		this.pbTitle = pbTitle;
		this.pbContent = pbContent;
		this.pbCreatedAt = pbCreatedAt;
		this.pbUpdatedAt = pbUpdatedAt;
		this.pbReadCount = pbReadCount;
		this.attachCount = attachCount;
		this.commentCount = commentCount;
	}
}