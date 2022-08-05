package com.tmi.security.model.dao;

import org.apache.ibatis.annotations.Mapper;

import com.tmi.spring.member.model.dto.Member;

@Mapper
public interface SecurityDao {
	
	Member loadUserByUsername(String mEmail);
	
}
