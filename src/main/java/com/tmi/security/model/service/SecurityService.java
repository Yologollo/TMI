package com.tmi.security.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.tmi.security.model.dao.SecurityDao;
import com.tmi.spring.member.model.dto.Member;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class SecurityService implements UserDetailsService {

	@Autowired
	SecurityDao securityDao;
	
	@Override
	public UserDetails loadUserByUsername(String mEmail) throws UsernameNotFoundException {
		log.debug("@SecurityService(mEmail) = {}", mEmail);
		Member member = securityDao.loadUserByUsername(mEmail);
		log.debug("member = {}", member);
		if(member == null)
			throw new UsernameNotFoundException(mEmail); // 로그인페이지로 리다이렉트 
		return member;
	}

}
