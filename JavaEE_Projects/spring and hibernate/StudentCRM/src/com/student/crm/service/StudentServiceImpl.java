package com.student.crm.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.student.crm.dao.StudentDAO;
import com.student.crm.entity.Student;

@Service
public class StudentServiceImpl implements StudentService {

	@Autowired
	StudentDAO studentDao;
	
	@Transactional
	@Override
	public void addStudent(Student theStudent) {
		studentDao.addStudent(theStudent);
	}

	@Transactional
	@Override
	public boolean emailExists(String email,int userId) {
		if(studentDao.emailExists(email,userId)) {
			return true;
		}
		else {
			return false;
		}
	}

	@Transactional
	@Override
	public boolean rollNumberExists(String rollNo, int userId) {
		if(studentDao.rollNumberExists(rollNo,userId)) {
			return true;
		}
		else {
			return false;
		}
	}

	@Transactional
	@Override
	public boolean phoneNumberExists(String phoneNumber, int userId) {
		if(studentDao.phoneNumberExists(phoneNumber,userId)) {
			return true;
		}
		else {
			return false;
		}
	}

	@Transactional
	@Override
	public List<Student> getStudents(int userId) {
		List<Student> students = studentDao.getStudents(userId);
		return students;
	}

	@Transactional
	@Override
	public Student getStudent(int id) {
		Student student = studentDao.getStudent(id);
		return student;
	}

	@Transactional
	@Override
	public void deleteStudent(Student student) {
		studentDao.deleteStudent(student);
		
	}

	@Transactional
	@Override
	public List<Student> getFilteredStudents(String query) {
		List<Student> students = studentDao.getFilteredStudents(query);
		return students;
	}

	@Transactional
	@Override
	public void deleteStudents(int userId) {
		studentDao.deleteStudents(userId);		
	}


}
