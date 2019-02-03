package com.star.smail.service;

import java.time.LocalDate;
import java.time.ZoneId;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.star.smail.controller.UserController;
import com.star.smail.entity.Mail;
import com.star.smail.repository.MailRepository;

@Service
public class MailServiceImpl implements MailService{

	@Autowired
	MailRepository mailRepo;
	
	@Autowired
	UserController userController;
	
	@Override
	public void sendMail(Mail mail) {
		mail.setDate(getCurrentDate());
		mailRepo.save(mail);
	}
	
	@Override
	public List<Mail> showMails(String username) {
		//String username = userController.logedInUsername;
		List<Mail> mails = mailRepo.findAllByRecevierUsernameIgnoreCase(username);
		return mails;
	}
	
	
	
	private Date getCurrentDate() {
		LocalDate lDate = LocalDate.now();
		//Date date = Date.valueOf(lDate);
		
		Date date = Date.from(lDate.atStartOfDay(ZoneId.systemDefault()).toInstant());
		//Date date = new SimpleDateFormat("yyyy-MM-dd").parse(lDate.toString());
		return date;
	}
	
}
