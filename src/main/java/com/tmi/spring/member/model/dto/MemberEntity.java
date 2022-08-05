package com.tmi.spring.member.model.dto;

import java.time.LocalDateTime;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.NonNull;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class MemberEntity {
	
	@NonNull
	protected String mNickName;
	protected int mNo;
	@NonNull
	protected String mEmail;
	@NonNull
	protected String mPassword;
	@NonNull
	protected String mName;
	@NonNull
	protected String mPhone;
	protected String mSocialType;
	@NonNull
	protected LocalDateTime mCreatedAt;
}
