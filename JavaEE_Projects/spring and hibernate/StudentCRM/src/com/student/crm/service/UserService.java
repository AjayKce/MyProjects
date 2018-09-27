package com.student.crm.service;

import java.util.List;

import com.student.crm.entity.Student;
import com.student.crm.entity.User;

public interface UserService {
void addStudent(User theUser);
public boolean emailExists(String email);
public boolean userExists(String username);
public boolean authenticated(String user, String pass);
public int getUserId(String user, String pass);
public Object getUser(int userId);
void deleteUser(int userId);
boolean verified(String user, String pass);
String getValidator(int id);
User getExistingUser(String string);
}
