package com.star.smail.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.star.smail.entity.Mail;

public interface MailRepository extends JpaRepository<Mail, Long> {
	
	List<Mail> findAllByRecevierUsernameIgnoreCase(String username);
	
}
