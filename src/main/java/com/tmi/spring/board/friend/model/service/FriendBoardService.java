package com.tmi.spring.board.friend.model.service;

import java.util.List;

import com.tmi.spring.board.friend.model.dto.FriendBoard;
import com.tmi.spring.board.friend.model.dto.InsertFriendBoard;

public interface FriendBoardService {

	List<FriendBoard> selectFriendBoardList(int cPage, int numPerPage);

	int selectTotalContent();

	int insertFriendBoard(InsertFriendBoard insertFriendBoard);

}
