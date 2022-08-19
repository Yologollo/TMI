package com.tmi.spring.member.model.service;

import java.util.HashMap;

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
	public Member emailChk(String member) {
		return memberDao.emailChk(member);
	}

	@Override
	public Member NickNameChk(String mNickName) {
		return memberDao.NickNameChk(mNickName);
	}

	@Override
	public int findPwUpdate(Member member) {
		return memberDao.findPwUpdate(member);
	}

	@Override
	public int updateMember(Member updateMember) {
		return memberDao.updateMember(updateMember);
	}



}
