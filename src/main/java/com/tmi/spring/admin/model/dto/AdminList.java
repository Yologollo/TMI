package com.tmi.spring.admin.model.dto;

import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@NoArgsConstructor
@ToString(callSuper = true)
public class AdminList extends AdminListEntity {
	private int attachCount;

	public AdminList(int m_no, String m_nickname, String m_name, String m_email, String m_phone) {
		super( m_no, m_nickname, m_name, m_email, m_phone);
		
	}

	
	
	
}
