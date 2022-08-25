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
public class NoticeBoardAttachment {
	private int nbaNo; 					//게시판 번호
	private int nbaNbNo; 				//첨부파일 번호	
	private String nbaOriginalFilename;	//업로드한 파일명
	private String nbaRenamedFilename;	//저장된 파일명
	private LocalDateTime nbaCreatedAt; //작성날짜
	
	
		
}
