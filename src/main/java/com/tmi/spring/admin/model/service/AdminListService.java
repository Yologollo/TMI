package com.tmi.spring.admin.model.service;

import java.util.List;

import com.tmi.spring.admin.model.dto.AdminList;
import com.tmi.spring.admin.notice.model.dto.NoticeBoard;
import com.tmi.spring.member.model.dto.Member;
/**
 * 
 * 생성 권민지
 * 작업 권민지
 *
 */
public interface AdminListService {

	List<AdminList> selectAdminList(int cPage, int numPerPage);

	int selectTotalContent();

	int memeberDelete(String memberEmail);

	List<Member> memberListSearch(String memberName);

}
