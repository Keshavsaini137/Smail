package com.star.smail.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.star.smail.entity.Users;

public interface UserRepository extends JpaRepository<Users, Long> {
	//FindAll by email
	
	List<Users> findAllByUsernameIgnoreCase(String email);
	
	boolean existsByUsername(String username);
	//boolean findByUsername(String username);
	
}
