package com.tmi.spring.admin.notice.model.service;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tmi.spring.admin.notice.model.dao.NoticeBoardDao;
import com.tmi.spring.admin.notice.model.dto.NoticeBoard;

@Service
public class NoticeBoardServiceImpl implements NoticeBoardService {

	
	@Autowired
	NoticeBoardDao noticeBoardDao;
	
	@Override
	public List<NoticeBoard> selectNoticeBoardList(int cPage, int numPerPage) {
		int offset = (cPage -1) * numPerPage;
		int limit = numPerPage;
		RowBounds rowBounds = new RowBounds(offset, limit);
		return noticeBoardDao.selectNoticeBoardList(rowBounds);
		
	}
}
