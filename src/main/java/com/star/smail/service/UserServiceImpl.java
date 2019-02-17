package com.star.smail.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

//import com.star.smail.entity.User;
import com.star.smail.entity.Users;
import com.star.smail.repository.UserRepository;

@Service
public class UserServiceImpl implements UserService {

	@Autowired
	UserRepository userRepo;
	
	@Autowired
	private PasswordEncoder passwordEncoder;
	
	@Override
	@Transactional
	public void saveUser(Users user) {
		String password = user.getPassword();
		String encodedPassword = passwordEncoder.encode(password);
		user.setPassword(encodedPassword);
		System.out.println("|" + passwordEncoder.encode(password) + "|");
		
		userRepo.save(user);
	}

	@Override
	@Transactional
	public boolean isUserExist(String username) {
		boolean isExist = userRepo.existsByUsername(username);
		return isExist;
	}
	
	
}
