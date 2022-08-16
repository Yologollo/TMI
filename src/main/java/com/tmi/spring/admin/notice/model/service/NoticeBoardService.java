package com.tmi.spring.admin.notice.model.service;

import java.util.List;

import com.tmi.spring.admin.notice.model.dto.NoticeBoard;

public interface NoticeBoardService {

	List<NoticeBoard> selectNoticeBoardList(int cPage, int numPerPage);

}
