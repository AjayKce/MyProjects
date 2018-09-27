package com.student.crm.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.validation.constraints.Pattern;

@Entity
@Table(name="user")
public class User {	
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="id")
	private int id;
	
	@Pattern(regexp="^[a-zA-Z]{1,}$",message="firstname is invalid")
	@Column(name="first_name")
	private String firstName;
	
	@Pattern(regexp="^[a-zA-Z]{1,}$",message="lastname is invalid")
	@Column(name="last_name")
	private String lastName;
	
	@Pattern(regexp="^[a-z][a-z0-9.]+[@]{1}[a-z]+[.]{1}[a-z.]+$",message="Email is invalid")
	@Column(name="email")
	private String email;
	
	@Pattern(regexp="^[a-zA-Z0-9-/]{1,}$",message="date is invalid")
	@Column(name="date_of_birth")
	private String dateOfBirth;
	
	@Pattern(regexp="^[a-zA-Z][a-zA-Z0-9]{1,}$",message="username is invalid")
	@Column(name="username")
	private String username;
	
	@Pattern(regexp="^[a-zA-Z0-9!@#$%^&*()]{8,}$",message="password is invalid(should contain 1 lowercase,1 uppercase,1 special character and 8 characters long")
	@Column(name="password")
	private String password;
	
	@Column(name="validate")
	private String validate;
	
	@Column(name="forgetPassword")
	private String forgetPassword;
	
	public User() {
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
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

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getDateOfBirth() {
		return dateOfBirth;
	}

	public void setDateOfBirth(String dateOfBirth) {
		this.dateOfBirth = dateOfBirth;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getValidate() {
		return validate;
	}

	public void setValidate(String validate) {
		this.validate = validate;
	}

	public String getForgetPassword() {
		return forgetPassword;
	}

	public void setForgetPassword(String forgetPassword) {
		this.forgetPassword = forgetPassword;
	}

	

	
}
