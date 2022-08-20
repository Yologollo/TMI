package com.tmi.spring.member.model.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.session.RowBounds;

import com.tmi.spring.member.model.dto.Member;
import com.tmi.spring.member.model.dto.MemberFriendBoard;
import com.tmi.spring.member.model.dto.MemberPlannerBoard;
import com.tmi.spring.member.model.dto.MemberReviewBoard;

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

	List<MemberFriendBoard> findByFriendBoardListByEmail(String memberEmail, RowBounds rowBounds);

	int selectFriendBoardTotalContent(String memberEmail);

	List<MemberPlannerBoard> findByPlannerBoardListByEmail(String memberEmail, RowBounds rowBounds);

	int selectPlannerBoardTotalContent(String memberEmail);

	List<MemberReviewBoard> findByReviewBoardListByEmail(String memberEmail, RowBounds rowBounds);

	int selectReviewBoardTotalContent(String memberEmail);

}
