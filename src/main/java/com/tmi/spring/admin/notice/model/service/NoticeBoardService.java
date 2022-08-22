package com.tmi.spring.admin.notice.model.service;

import java.util.List;

import com.tmi.spring.admin.notice.model.dto.InsertNoticeBoard;
import com.tmi.spring.admin.notice.model.dto.NoticeBoard;
import com.tmi.spring.admin.notice.model.dto.NoticeBoardAttachment;
import com.tmi.spring.board.friend.model.dto.InsertFriendBoard;

public interface NoticeBoardService {

	List<NoticeBoard> selectNoticeBoardList(int cPage, int numPerPage);

	int selectTotalContent();
	
	int insertNoticeBoard(InsertNoticeBoard insertNoticeBoard);

	InsertNoticeBoard selectOneNoticeBoard(int no);

	int updateReadCount(int no);

	int deleteNoticeBoard(int no);

	NoticeBoardAttachment selectOneAttachment(int attachNo);

	int deleteAttachment(int attachNo);

	int updateNoticeBoard(InsertNoticeBoard insertNoticeBoard);

 
}
