package com.tmi.spring.member.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.tmi.spring.member.model.dao.MemberDao;
import com.tmi.spring.member.model.dto.Member;

/**
 * 
 * @생성 최윤서
 * @작업 최윤서
 *
 */
@Service
public class MemberSeriveImpl implements MemberService {

	@Autowired
	MemberDao memberDao;

	@Transactional(rollbackFor = Exception.class)
	@Override
	public int insertMember(Member member) {
		int result = memberDao.insertMember(member);
		result = memberDao.insertMemberRole(member); // ROLE_USER
		return result;
	}

	@Override
	public Member selectOneMember(String mEmail) {
		return memberDao.selectOneMember(mEmail);
	}

}
