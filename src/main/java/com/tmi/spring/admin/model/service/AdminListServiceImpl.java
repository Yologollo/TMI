package com.tmi.spring.admin.model.service;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tmi.spring.admin.model.dao.AdminListDao;
import com.tmi.spring.admin.model.dto.AdminList;

@Service
public class AdminListServiceImpl implements AdminListService {

	@Autowired
	AdminListDao adminlistDao;
	
	@Override
	public List<AdminList> selectAdminList(int cPage, int numPerPage) {
		int offset = (cPage -1) * numPerPage;
		int limit = numPerPage;
		RowBounds rowBounds = new RowBounds(offset, limit);
		return adminlistDao.selectAdminList(rowBounds);
	}
}
