package com.tmi.spring.admin.model.dto;

import java.time.LocalDateTime;

import com.tmi.spring.board.friend.model.dto.FriendBoardEntity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class AdminListEntity { 
	private int m_no;
	private String m_nickname;
	private String m_name;
	
}
