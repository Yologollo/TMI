package com.tmi.spring.member.model.dto;

import java.time.LocalDateTime;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class MemberReviewBoard extends MemberEntity {
	private int rbNo;
	private int rbPNo;
	private String mNickName;
	private String rbTitle;
	private String rbContent;
	private LocalDateTime rbCreatedAt;
	private LocalDateTime rbUpdatedAt;
	private int rbReadCount;
	
	private int attachCount;
	private int commentCount;
	
	public MemberReviewBoard(String mNickName, int mNo, String mEmail, String mPassword,
			String mName, String mPhone, LocalDateTime mCreatedAt, int rbNo, int rbPNo, String rbTitle, String rbContent,
			LocalDateTime rbCreatedAt, LocalDateTime rbUpdatedAt, int rbReadCount, int attachCount, int commentCount) {
		super(mNickName, mNo, mEmail, mPassword, mName, mPhone, mCreatedAt);
		this.rbNo = rbNo;
		this.rbPNo = rbPNo;
		this.mNickName = mNickName;
		this.rbTitle = rbTitle;
		this.rbContent = rbContent;
		this.rbCreatedAt = rbCreatedAt;
		this.rbUpdatedAt = rbUpdatedAt;
		this.rbReadCount = rbReadCount;
		this.attachCount = attachCount;
		this.commentCount = commentCount;
	}

}

