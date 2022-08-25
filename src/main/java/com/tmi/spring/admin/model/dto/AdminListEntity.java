package com.tmi.spring.admin.model.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
/**
 * 
 * 생성 : 권민지
 * 작업 : 권민지
 *
 */
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
