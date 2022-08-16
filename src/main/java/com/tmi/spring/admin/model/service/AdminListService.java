package com.tmi.spring.admin.model.service;

import java.util.List;

import com.tmi.spring.admin.model.dto.AdminList;

public interface AdminListService {

	List<AdminList> selectAdminList(int cPage, int numPerPage);

}
