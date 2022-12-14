package com.tmi.spring.admin.notice.model.dto;

import java.time.LocalDateTime;



import lombok.AllArgsConstructor;
import lombok.Data; 
import lombok.NoArgsConstructor;
/**
 * 
 * 생성 권민지
 * 작업 권민지
 *
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
public class NoticeBoardEntity {
	private int nb_no;
	private String m_nickname;
	private String nb_title;
	private String nb_content;
	private LocalDateTime nb_created_at;
	private LocalDateTime nb_updated_at;
	private int nb_read_count;
}
