package com.tmi.spring.member.model.service;


import java.util.List;

import com.tmi.spring.member.model.dto.Member;
import com.tmi.spring.member.model.dto.MemberBoard;


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

	Member emailChk(String mEmail);

	Member NickNameChk(String mNickName);

	int findPwUpdate(Member member);

	int updateMember(Member updateMember);

	int memberDelete(int mNo);

	List<MemberBoard> findByBoardAllListByEmail(int cPage, int numPerPage, String memberEmail);

	int selectTotalContent(String memberEmail);


}
