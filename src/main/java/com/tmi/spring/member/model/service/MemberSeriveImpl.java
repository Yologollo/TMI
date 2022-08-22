package com.tmi.spring.member.model.service;


import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.tmi.spring.member.model.dao.MemberDao;
import com.tmi.spring.member.model.dto.Member;
import com.tmi.spring.member.model.dto.MemberFriendBoard;
import com.tmi.spring.member.model.dto.MemberPlannerBoard;
import com.tmi.spring.member.model.dto.MemberReviewBoard;

/**
 * 
 * @생성 최윤서
 * @작업 최윤서, 김용민
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

	@Override
	public int memberDelete(int mNo) {
		return memberDao.memberDelete(mNo);
	}
	
	@Override
	public List<MemberFriendBoard> findByFriendBoardListByEmail(int cPage, int numPerPage, String memberEmail) {
		int offset = (cPage -1) * numPerPage;
		int limit = numPerPage;
		RowBounds rowBounds = new RowBounds(offset, limit);
		return memberDao.findByFriendBoardListByEmail(memberEmail, rowBounds);
	}
	
	@Override
	public int selectFriendBoardTotalContent(String memberEmail) {
		return memberDao.selectFriendBoardTotalContent(memberEmail);
	}

	@Override
	public List<MemberPlannerBoard> findByPlannerBoardListByEmail(int cPage, int numPerPage, String memberEmail) {
		int offset = (cPage -1) * numPerPage;
		int limit = numPerPage;
		RowBounds rowBounds = new RowBounds(offset, limit);
		return memberDao.findByPlannerBoardListByEmail(memberEmail, rowBounds);
	}

	@Override
	public int selectPlannerBoardTotalContent(String memberEmail) {
		return memberDao.selectPlannerBoardTotalContent(memberEmail);
	}

	@Override
	public List<MemberReviewBoard> findByReviewBoardListByEmail(int cPage, int numPerPage, String memberEmail) {
		int offset = (cPage -1) * numPerPage;
		int limit = numPerPage;
		RowBounds rowBounds = new RowBounds(offset, limit);
		return memberDao.findByReviewBoardListByEmail(memberEmail, rowBounds);
	}

	@Override
	public int selectReviewBoardTotalContent(String memberEmail) {
		return memberDao.selectReviewBoardTotalContent(memberEmail);
	}
}
