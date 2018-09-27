package com.student.crm.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.validation.constraints.Pattern;

@Entity
@Table(name="student")
public class Student {
	@Id
	@Column(name="id")
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id;
	
	@Column(name="user_id")
	private int userId;
	
	@Pattern(regexp="^[A-Za-z]{3,}$",message="invalid")
	@Column(name="first_name")
	private String firstName;
	
	@Pattern(regexp="^[A-Za-z]{1,}$",message="invalid")
	@Column(name="last_name")
	private String lastName;
	
	@Pattern(regexp="^[A-Z0-9]{5,}$",message="invalid(use capital)")
	@Column(name="roll_no")
	private String rollNo;
	
	@Pattern(regexp="^[A-Za-z]+$",message="select gender")
	@Column(name="gender")
	private String gender;
	
	@Pattern(regexp="^[A-Za-z+-]+$",message="select blood group")
	@Column(name="blood_group")
	private String bloodGroup;
	
	@Pattern(regexp="^[A-Z]{1,}$",message="select department")
	@Column(name="department")
	private String department;
	
	@Pattern(regexp="^[IV]{1,}$",message="select year")
	@Column(name="current_year")
	private String currentYear;
	
	@Pattern(regexp="^[IV]{1,}$",message="select semester")
	@Column(name="current_semester")
	private String currentSemester;
	
	@Pattern(regexp="^[a-z][a-z0-9]+[@]{1}[a-z]+[.]{1}[a-z.]+$",message="invalid email")
	@Column(name="email")
	private String email;
	
	@Pattern(regexp="^[0-9]{10}$",message="invalid number")
	@Column(name="phone_number")
	private String phoneNumber;
	
	@Pattern(regexp="^[a-zA-Z0-9-/]{1,}$",message="invalid date")
	@Column(name="date_of_birth")
	private String dateOfBirth;
	
	@Pattern(regexp="^([A-Z]{5}[0-9]{4}[A-Z]{1}|{0})$",message="invalid pancard")
	@Column(name="pan_card")
	private String panCard;
	
	@Pattern(regexp="^([a-zA-Z0-9]{8,}|{0})$",message="invalid account")
	@Column(name="account_number")
	private String accountNumber;
	
	@Pattern(regexp="^([a-zA-Z0-9]{8,}|{0})$",message="invalid ifsc")
	@Column(name="ifsc")
	private String ifsc;
	
	@Pattern(regexp="^([0-9]{12}|{0})$",message="invalid aadhar")
	@Column(name="aadhar")
	private String aadhar;
	
	@Pattern(regexp="^([0-9]{11}|{0})$",message="invalid voterid")
	@Column(name="vote_id")
	private String voteId;
	
	@Pattern(regexp="^[A-Za-z .]{3,}$",message="invalid")
	@Column(name="parent_name")
	private String parentName;
	
	@Pattern(regexp="^[A-Za-z]{1,}$",message="select gender")
	@Column(name="parent_gender")
	private String parentGender;
	
	@Pattern(regexp="^[0-9]{10}$",message="invalid")
	@Column(name="parent_phone_number")
	private String parentPhoneNumber;
	
	@Pattern(regexp="^[a-zA-Z0-9\\w\\W]{1,}$",message="please enter address")
	@Column(name="address")
	private String address;
	
	@Pattern(regexp="^[0-9]{6}$",message="invalid pincode")
	@Column(name="pin_code")
	private String pinCode;
	
	public Student() {
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
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

	public String getRollNo() {
		return rollNo;
	}

	public void setRollNo(String rollNo) {
		this.rollNo = rollNo;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getBloodGroup() {
		return bloodGroup;
	}

	public void setBloodGroup(String bloodGroup) {
		this.bloodGroup = bloodGroup;
	}

	public String getDepartment() {
		return department;
	}

	public void setDepartment(String department) {
		this.department = department;
	}

	public String getCurrentYear() {
		return currentYear;
	}

	public void setCurrentYear(String currentYear) {
		this.currentYear = currentYear;
	}

	public String getCurrentSemester() {
		return currentSemester;
	}

	public void setCurrentSemester(String currentSemester) {
		this.currentSemester = currentSemester;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhoneNumber() {
		return phoneNumber;
	}

	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}

	public String getDateOfBirth() {
		return dateOfBirth;
	}

	public void setDateOfBirth(String dateOfBirth) {
		this.dateOfBirth = dateOfBirth;
	}

	public String getPanCard() {
		return panCard;
	}

	public void setPanCard(String panCard) {
		this.panCard = panCard;
	}

	

	public String getAccountNumber() {
		return accountNumber;
	}

	public void setAccountNumber(String accountNumber) {
		this.accountNumber = accountNumber;
	}

	public String getIfsc() {
		return ifsc;
	}

	public void setIfsc(String ifsc) {
		this.ifsc = ifsc;
	}

	public String getAadhar() {
		return aadhar;
	}

	public void setAadhar(String aadhar) {
		this.aadhar = aadhar;
	}

	public String getVoteId() {
		return voteId;
	}

	public void setVoteId(String voteId) {
		this.voteId = voteId;
	}

	public String getParentName() {
		return parentName;
	}

	public void setParentName(String parentName) {
		this.parentName = parentName;
	}

	public String getParentGender() {
		return parentGender;
	}

	public void setParentGender(String parentGender) {
		this.parentGender = parentGender;
	}

	public String getParentPhoneNumber() {
		return parentPhoneNumber;
	}

	public void setParentPhoneNumber(String parentPhoneNumber) {
		this.parentPhoneNumber = parentPhoneNumber;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getPinCode() {
		return pinCode;
	}

	public void setPinCode(String pinCode) {
		this.pinCode = pinCode;
	}
	
	
	
}
