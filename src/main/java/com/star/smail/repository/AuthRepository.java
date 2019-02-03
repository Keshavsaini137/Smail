package com.star.smail.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.star.smail.entity.Authorities;

public interface AuthRepository extends JpaRepository<Authorities, String>{

}
