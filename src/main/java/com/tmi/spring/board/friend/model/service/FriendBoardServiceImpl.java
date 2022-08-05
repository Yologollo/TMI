package com.tmi.spring.board.friend.model.service;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tmi.spring.board.friend.model.dao.FriendBoardDao;
import com.tmi.spring.board.friend.model.dto.FriendBoard;

@Service
public class FriendBoardServiceImpl implements FriendBoardService {

	@Autowired
	FriendBoardDao friendBoardDao;
	
	@Override
	public List<FriendBoard> selectFriendBoardList(int cPage, int numPerPage) {
		int offset = (cPage - 1) * numPerPage;
		int limit = numPerPage;
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		return friendBoardDao.selectFriendBoardList(rowBounds);
	}
}