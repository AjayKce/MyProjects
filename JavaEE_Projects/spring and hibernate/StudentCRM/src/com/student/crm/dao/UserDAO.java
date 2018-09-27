package com.student.crm.dao;

import java.util.List;

import com.student.crm.entity.Student;
import com.student.crm.entity.User;

public interface UserDAO {
	public void addStudent(User theUser);
	public boolean emailExists(String email);
	public boolean userExists(String username);
	public boolean authorised(String user, String pass);
	public int getUserId(String user, String pass);
	public Object getUser(int userId);
	public void deleteUser(int userId);
	public boolean verified(String user, String pass);
	public String getValidator(int id);
	public User getExistingUser(String string);
}
