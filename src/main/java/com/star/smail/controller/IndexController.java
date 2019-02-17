package com.star.smail.controller;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.StringTrimmerEditor;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
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

import com.star.smail.entity.Authorities;
import com.star.smail.entity.Users;
import com.star.smail.service.AuthoritiesService;
import com.star.smail.service.UserService;

@Controller
public class IndexController {
	
	@Autowired
	UserService userService;
	@Autowired
	AuthoritiesService authService;
	
	boolean userExist = false;
	boolean isPasswordMatch = false;
	
	@InitBinder
	public void initBinder(WebDataBinder dataBinder) {
		StringTrimmerEditor stringTrimmerEditor = new StringTrimmerEditor(true);
		dataBinder.registerCustomEditor(String.class, stringTrimmerEditor);
	}
	
	
	@RequestMapping("/")
	public String start() {
		return "index";
	}
	
	@GetMapping("/customLogin")
	public String signIn() {
		System.out.println("Hello To Spring ");
		return "login";
	}
	
	
	@GetMapping("/createAccount")
	public String createAccount(Model model) {
		
		//System.out.println(isPasswordMatch);
		if(isPasswordMatch) {
			model.addAttribute("theConfirmPassword", "The password does not match with confirm password");
		}
		
		//System.out.println(userExist);
		if(userExist) {
			model.addAttribute("theUserExist", "Use different Username, Cause this one Already Exist!");
		}
		
		Users Users = new Users();
		model.addAttribute("theUsers", Users);
		return "create-account";
	}
	
	@PostMapping("/processForm")
	public String processForm(@Valid @ModelAttribute("theUsers") Users theUsers,
							BindingResult bindingResult) {
		System.out.println(bindingResult);
		
		
		if(bindingResult.hasErrors()) {
			System.out.println("Null Error");
			return "create-account";
		}
		
		//Checking if the password match with the Confirm Password.
		isPasswordMatch = theUsers.getConfirmPassword().equals(theUsers.getPassword());
		
		if(!isPasswordMatch) {
			return "redirect:createAccount?isPasswordMatch";
		}
		
		//Checking if the user is already exist in the database.
		userExist = userService.isUserExist(theUsers.getUsername());
		System.out.println("" + theUsers.getUsername());
		
		if(userExist) {
			System.out.println("User Already Exist" + userExist);
			return "redirect:createAccount?userExist";
		}
		
		//Creating new user and redirecting to home page
		
		//Adding "@smail.com" at end of the username.
		theUsers.setUsername(theUsers.getUsername() + "@smail.com");
		
		Authorities authorities = new Authorities();
		authorities.setUsername(theUsers.getUsername());
		System.out.println(authorities.toString());
		authService.saveAuthorities(authorities);
		userService.saveUser(theUsers);
		return "redirect:/";
		
	}
	
}
