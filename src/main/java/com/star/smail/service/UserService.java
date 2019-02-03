package com.star.smail.service;

import com.star.smail.entity.Users;

public interface UserService {
	
	public void saveUser(Users user);

	public boolean isUserExist(String username);
	
}
