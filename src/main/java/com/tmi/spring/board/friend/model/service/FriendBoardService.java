package com.tmi.spring.board.friend.model.service;

import java.util.List;

import com.tmi.spring.board.friend.model.dto.FriendBoard;

public interface FriendBoardService {

	List<FriendBoard> selectFriendBoardList(int cPage, int numPerPage);

}
