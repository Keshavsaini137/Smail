package com.star.smail.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

@Entity
public class Users {
	
	//@Id
	//@Column(unique=true)
	@GeneratedValue
	private long id;
	
	@NotNull(message="is required")
	@Size(min=1, message="is required")
	private String firstName;
	
	//@NotNull(message="is required")
	//@Size(min=1)
	private String lastName;
	
	@Id
	@Column(nullable=false)
	@NotNull(message="is required")
	@Size(min=3, message="is required")
	private String username;
	
	@Column(nullable=false)
	@NotNull(message="is required")
	@Size(min=6, message="is required")
	private String password;
	
	@Column(nullable=false,length=5)
	private byte enabled = 1;
	
	//Authorities authorities;
	
	public Users() {
		
	}
	
	public String getFirstName() {
		return firstName;
	}



	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}



	public String getLastName() {
		return lastName;
	}



	public void setLastName(String lastName) {
		this.lastName = lastName;
	}



	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public Users(String username, String password) {
		super();
		this.username = username;
		this.password = password;
	}
	
	

	public Users(String firstName, String lastName, String username, String password) {
		super();
		this.firstName = firstName;
		this.lastName = lastName;
		this.username = username;
		this.password = password;
	}



	@Override
	public String toString() {
		return "user [id=" + id + ", username=" + username + ", password=" + password + "]";
	}



	public String getUsername() {
		return username;
	}



	public void setUsername(String username) {
		this.username = username;
	}
	
	
	
}













