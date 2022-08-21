package com.tmi.spring.admin.model.dto;

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
	private  String m_email;
	private String m_phone;
}
