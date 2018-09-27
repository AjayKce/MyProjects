package com.student.crm.service;

import java.util.List;

import javax.validation.Valid;

import com.student.crm.entity.Student;

public interface StudentService {

	void addStudent(Student theStudent);

	boolean emailExists(String email, int userId);

	boolean rollNumberExists(String rollNo, int userId);

	boolean phoneNumberExists(String phoneNumber, int userId);

	List<Student> getStudents(int userId);

	Student getStudent(int id);

	void deleteStudent(Student student);

	List<Student> getFilteredStudents(String query);

	void deleteStudents(int userId);


}
