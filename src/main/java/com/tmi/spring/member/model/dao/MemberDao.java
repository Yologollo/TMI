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

	Member selectOneMember(String mEmail);

}
