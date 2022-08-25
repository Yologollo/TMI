package com.tmi.spring.admin.model.service;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tmi.spring.admin.model.dao.AdminListDao;
import com.tmi.spring.admin.model.dto.AdminList;
import com.tmi.spring.member.model.dto.Member;

import lombok.extern.slf4j.Slf4j;
/**
 * 
 * 생성 권민지
 * 작업 권민지
 *
 */
@Service
@Slf4j
public  class AdminListServiceImpl implements AdminListService {

	@Autowired
	AdminListDao adminlistDao;
	
	@Override
	public List<AdminList> selectAdminList(int cPage, int numPerPage) {
		int offset = (cPage -1) * numPerPage;
		int limit = numPerPage;
		RowBounds rowBounds = new RowBounds(offset, limit);
		return adminlistDao.selectAdminList(rowBounds);
	}

	@Override
	public int selectTotalContent() {
		return adminlistDao.selectTotalContent();
	}

	
	@Override
	public int memeberDelete(String memberEmail) {
		return adminlistDao.memeberDelete(memberEmail);
	}
	
	@Override
	public List<Member> memberListSearch(String memberName) {
		return adminlistDao.memberListSearch(memberName);
	}
}
