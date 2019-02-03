package com.star.smail.controller;

import java.security.Principal;
import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.StringTrimmerEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.star.smail.entity.Mail;
import com.star.smail.service.AuthoritiesService;
import com.star.smail.service.MailService;
import com.star.smail.service.UserService;

@Controller
@RequestMapping("/user")
public class UserController {
	
	@Autowired
	UserService userService;
	
	public String logedInUsername;
	boolean userNotFound = true;
	boolean isMailSent = false;
	
	@Autowired
	AuthoritiesService authService;
	
	@Autowired
	MailService mailService;
	
	@InitBinder
	public void initBinder(WebDataBinder dataBinder) {
		StringTrimmerEditor stringTrimmerEditor = new StringTrimmerEditor(true);
		dataBinder.registerCustomEditor(String.class, stringTrimmerEditor);
	}
	
	
	@RequestMapping("/inbox")
	public String inbox(Model model,Principal principal) {
		
		System.out.println(isMailSent);
		if(isMailSent) {
			isMailSent = false;
			System.out.println("is mail sent");
			model.addAttribute("mailSent", "Mail has been Sent!");
		}
		
		System.out.println(isMailSent);
		
		
		logedInUsername = principal.getName();
		System.out.println(logedInUsername);
		List<Mail> theMails = mailService.showMails(logedInUsername);
		model.addAttribute("mails", theMails);
		return "inbox";
	}
	
//	@RequestMapping("/logout")
//	public String logout() {
//		return "login";
//	}
	
	@GetMapping("/compose")
	public String compose(Model model) {
		
		if(!userNotFound) {
			model.addAttribute("theUserNotFound", "There is no such user");
			System.out.println("there no user");
		}
		System.out.println("" + userNotFound);
		
		Mail mail = new Mail();
		model.addAttribute("theMail", mail);
		
		return "compose";
	}
	
	@PostMapping("/processingMail")
	public String processingMail(@ModelAttribute("theMail") @Valid Mail theMail, 
								 BindingResult bindingResult,
						   		 @RequestParam("recevierUsername") String recevierUsername) {
		System.out.println(bindingResult);
		
		
		if(bindingResult.hasErrors()) {
			System.out.println("Null Mail Error");
			return "compose";
		}
		else {
			userNotFound = userService.isUserExist(recevierUsername);
			
			if(userNotFound) {
				//add date and sender name 
				String _logedInUserName = logedInUsername; 
				isMailSent = userNotFound;
				theMail.setSenderUsername(_logedInUserName);
				mailService.sendMail(theMail);
				return "redirect:/user/inbox";
			}
			else {
				//System.out.println("There is no such User");
				
				return "redirect:/user/compose?userNotFound";
			}
		}
	}
	
}











