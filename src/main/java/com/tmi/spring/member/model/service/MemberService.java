package com.tmi.spring.member.model.service;

import com.tmi.spring.member.model.dto.Member;

/**
 * 
 * @생성 최윤서
 * @작업 최윤서
 *
 */
public interface MemberService {
	
	String ROLE_USER = "ROLE_USER";
	String ROLE_ADMIN = "ROLE_ADMIN";

	int insertMember(Member member);

	Member selectOneMember(String mEmail);

}
