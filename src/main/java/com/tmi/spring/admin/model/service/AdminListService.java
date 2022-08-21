package com.tmi.spring.admin.model.service;

import java.util.List;

import com.tmi.spring.admin.model.dto.AdminList;
import com.tmi.spring.admin.notice.model.dto.NoticeBoard;

public interface AdminListService {

	List<AdminList> selectAdminList(int cPage, int numPerPage);

	int selectTotalContent();

	int memeberDelete(String memberEmail);

	int memberListSearch(String memberName);

	


	
	
	
	
	
	
	

}
