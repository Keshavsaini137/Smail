package com.star.smail.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.star.smail.entity.Authorities;
import com.star.smail.repository.AuthRepository;

@Service
public class AuthoritiesServiceImpl implements AuthoritiesService{

	@Autowired
	AuthRepository authRepository;
	
	@Override
	public void saveAuthorities(Authorities authorities) {
		
	authRepository.save(authorities);	
	}
		
}
