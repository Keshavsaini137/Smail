package com.star.smail.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

//import com.star.smail.entity.User;
import com.star.smail.entity.Users;
import com.star.smail.repository.UserRepository;

@Service
public class UserServiceImpl implements UserService {

	@Autowired
	UserRepository userRepo;
	
	@Override
	@Transactional
	public void saveUser(Users user) {
		
		userRepo.save(user);
	}

	@Override
	public boolean isUserExist(String username) {
		boolean isExist = userRepo.existsByUsername(username);
		return isExist;
	}
	
	
}
