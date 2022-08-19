package com.tmi.spring.member.model.dao;

import org.apache.ibatis.annotations.Mapper;

import com.tmi.spring.member.model.dto.Member;

/**
 * 
 * @생성 최윤서
 * @작업 최윤서
 *
 */
@Mapper
public interface MemberDao {

	int insertMember(Member member);

	int insertMemberRole(Member member);

	Member emailChk(String mEmail);

	Member NickNameChk(String mNickName);

	int findPwUpdate(Member member);

	int updateMember(Member updateMember);

	int memberDelete(int mNo);

}
