package com.tmi.spring.member.model.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.session.RowBounds;

import com.tmi.spring.member.model.dto.Member;
import com.tmi.spring.member.model.dto.MemberBoard;

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

	List<MemberBoard> findByBoardAllListByEmail(String memberEmail, RowBounds rowBounds);

	int selectTotalContent(String memberEmail);

	List<MemberBoard> findByFriendBoardListByEmail(String memberEmail, RowBounds rowBounds);

	int selectFriendBoardTotalContent(String memberEmail);

}
