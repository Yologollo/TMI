package com.tmi.spring.email.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailSender;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.stereotype.Service;

@Service
public class EmailService {

	final String FROM_ADDRESS = "yoonseo.common@gmail.com";
	
	@Autowired
	private MailSender mailSender;
	
	public void sendMail(String toAddress, String subject, String msgBody) {
		SimpleMailMessage smm = new SimpleMailMessage();
		smm.setFrom(FROM_ADDRESS);
		smm.setTo(toAddress);
		smm.setSubject(subject);
		smm.setText(msgBody);
		
		mailSender.send(smm);
	}
	
}
