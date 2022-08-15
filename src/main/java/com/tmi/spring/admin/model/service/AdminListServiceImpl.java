package com.tmi.spring.admin.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tmi.spring.admin.model.dao.AdminListDao;

@Service
public class AdminListServiceImpl implements AdminListService {

	@Autowired
	AdminListDao adminlistDao;
}
