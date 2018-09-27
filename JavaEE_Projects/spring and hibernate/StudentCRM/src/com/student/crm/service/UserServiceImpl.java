package com.student.crm.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.student.crm.dao.UserDAO;
import com.student.crm.entity.Student;
import com.student.crm.entity.User;

@Service
public class UserServiceImpl implements UserService {
	
	@Autowired
	private UserDAO userDao;

	@Transactional
	@Override
	public void addStudent(User theUser) {
		userDao.addStudent(theUser);
	}

	@Transactional
	@Override
	public boolean emailExists(String email) {
		if(userDao.emailExists(email)) {
			return true;
		}
		else {
			return false;
		}
	}

	@Transactional
	@Override
	public boolean userExists(String username) {
		if(userDao.userExists(username)) {
			return true;
		}
		else {
			return false;
		}
	}

	@Transactional
	@Override
	public boolean authenticated(String user, String pass) {
		if(userDao.authorised(user,pass)) {
			return true;
		}
		else {
		return false;
		}
	}

	@Transactional
	@Override
	public int getUserId(String user, String pass) {
		int result = userDao.getUserId(user,pass);
		return result;
	}

	@Transactional
	@Override
	public Object getUser(int userId) {
		return userDao.getUser(userId);
	}

	@Transactional
	@Override
	public void deleteUser(int userId) {
		userDao.deleteUser(userId);
	}

	@Transactional
	@Override
	public boolean verified(String user, String pass) {
		return userDao.verified(user,pass);
	}

	@Transactional
	@Override
	public String getValidator(int id) {
		return userDao.getValidator(id);
	}

	@Transactional
	@Override
	public User getExistingUser(String email) {
		return userDao.getExistingUser(email);
	}



}
