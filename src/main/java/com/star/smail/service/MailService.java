package com.star.smail.service;

import java.util.List;

import com.star.smail.entity.Mail;

public interface MailService {
	
	public void sendMail(Mail mail);
	
	public List<Mail> showMails(String username);

	public Mail showMail(Long mailId);
	
}
