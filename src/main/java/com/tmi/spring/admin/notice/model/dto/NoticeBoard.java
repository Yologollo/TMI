package com.tmi.spring.admin.notice.model.dto;

import java.time.LocalDateTime;

import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@NoArgsConstructor
@ToString(callSuper = true) 
public class NoticeBoard extends NoticeBoardEntity {
	private int attachCount;
	
	
	
	public NoticeBoard(int nb_no, String m_nickname, String nb_title, String nb_content, LocalDateTime nb_created_at,
			LocalDateTime nb_updated_at, int nb_read_count, int attachCount) {
		super(nb_no, m_nickname, nb_title, nb_content, nb_created_at, nb_updated_at, nb_read_count);
		this.attachCount = attachCount;
		
	}
	
	
}
