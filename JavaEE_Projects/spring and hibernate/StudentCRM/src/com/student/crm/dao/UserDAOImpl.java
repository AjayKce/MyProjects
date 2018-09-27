package com.student.crm.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.student.crm.entity.Student;
import com.student.crm.entity.User;

@Repository
public class UserDAOImpl implements UserDAO {

	@Autowired
	private SessionFactory sessionFactory;
	
	@Override
	public void addStudent(User theUser) {
		Session session = sessionFactory.getCurrentSession();
		session.saveOrUpdate(theUser);
	}

	@Override
	public boolean emailExists(String email) {
		Session session = sessionFactory.getCurrentSession();
		Query query=session.createQuery("from User s where s.email='"+email+"'");
		List<User> user = (List<User>) query.getResultList();
		boolean result=false;
		for(User temp:user) {
			result = true;
			System.out.println(result);
		}
		return result;
	}

	@Override
	public boolean userExists(String username) {
		Session session = sessionFactory.getCurrentSession();
		Query query=session.createQuery("from User s where s.username='"+username+"'");
		List<User> user = (List<User>) query.getResultList();
		boolean result=false;
		for(User temp:user) {
			result = true;
		}
		return result;
	}

	@Override
	public boolean authorised(String user, String pass) {
		Session session = sessionFactory.getCurrentSession();
		Query query=session.createQuery("from User s where s.username='"+user+"' and s.password='"+pass+"'");
		List<User> users = (List<User>) query.getResultList();
		boolean result=false;
		for(User temp:users) {
			result = true;
		}
		return result;
	}

	@Override
	public int getUserId(String user, String pass) {
		Session session = sessionFactory.getCurrentSession();
		Query query=session.createQuery("from User s where s.username='"+user+"' and s.password='"+pass+"'");
		List<User> users = (List<User>) query.getResultList();
		int result=0;
		for(User temp:users) {
			result = temp.getId();
		}
		return result;
	}

	@Override
	public Object getUser(int userId) {
		Session session = sessionFactory.getCurrentSession();
		User user=session.createQuery("from User s where s.id="+userId+"",User.class).getSingleResult();
		return user;
	}

	@Override
	public void deleteUser(int userId) {
		Session session = sessionFactory.getCurrentSession();
		Query query=session.createQuery("from User s where s.id='"+userId+"'");
		List<User> users = (List<User>) query.getResultList();
		for(User temp:users) {
			session.delete(temp);
		}
	}

	@Override
	public boolean verified(String user, String pass) {
		Session session = sessionFactory.getCurrentSession();
		Query query=session.createQuery("from User s where s.username='"+user+"' and s.password='"+pass+"' and s.validate='valid'");
		List<User> users = (List<User>) query.getResultList();
		boolean result=false;
		for(User temp:users) {
			result = true;
		}
		return result;
	}

	@Override
	public String getValidator(int id) {
		Session session = sessionFactory.getCurrentSession();
		Query query=session.createQuery("from User s where s.id='"+id+"'");
		List<User> users = (List<User>) query.getResultList();
		String result=null;
		for(User temp:users) {
			result = temp.getValidate();
		}
		return result;
	}

	@Override
	public User getExistingUser(String email) {
		Session session = sessionFactory.getCurrentSession();
		Query query=session.createQuery("from User s where s.email='"+email+"'");
		List<User> users = (List<User>) query.getResultList();
		User result=null;
		for(User temp:users) {
			result = temp;
		}
		return result;
	}

}
