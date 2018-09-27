package com.student.crm.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.student.crm.entity.Student;

@Repository
public class StudentDAOImpl implements StudentDAO {

	@Autowired
	SessionFactory sessionFactory;

	@Override
	public void addStudent(Student theStudent) {
		Session session = sessionFactory.getCurrentSession();
		session.saveOrUpdate(theStudent);
	}

	@Override
	public boolean emailExists(String email,int userId) {
		Session session = sessionFactory.getCurrentSession();
		Query query =session.createQuery("from Student s where s.email='"+email+"' and s.userId='"+userId+"'");
		List<Student> student =(List<Student>)query.getResultList();
		boolean result=false;
		for(Student temp:student) {
			result=true;
		}
		return result;
	}

	@Override
	public boolean rollNumberExists(String rollNo, int userId) {
		Session session = sessionFactory.getCurrentSession();
		Query query =session.createQuery("from Student s where s.rollNo='"+rollNo+"' and s.userId='"+userId+"'");
		List<Student> student =(List<Student>)query.getResultList();
		boolean result=false;
		for(Student temp:student) {
			result=true;
		}
		return result;
	}

	@Override
	public boolean phoneNumberExists(String phoneNumber, int userId) {
		Session session = sessionFactory.getCurrentSession();
		Query query =session.createQuery("from Student s where s.phoneNumber='"+phoneNumber+"' and s.userId='"+userId+"'");
		List<Student> student =(List<Student>)query.getResultList();
		boolean result=false;
		for(Student temp:student) {
			result=true;
		}
		return result;
	}

	@Override
	public List<Student> getStudents(int userId) {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("from Student s where s.userId='"+userId+"' order by s.rollNo");
		List<Student> students =(List<Student>)query.getResultList();
		return students;
	}

	@Override
	public Student getStudent(int id) {
		Session session = sessionFactory.getCurrentSession();
		Student student = session.createQuery("from Student s where s.id='"+id+"'",Student.class).getSingleResult();
		return student;
	}

	@Override
	public void deleteStudent(Student student) {
		Session session = sessionFactory.getCurrentSession();
		session.delete(student);
	}

	@Override
	public List<Student> getFilteredStudents(String query) {
		Session session = sessionFactory.getCurrentSession();
		Query query1 = session.createQuery(query);
		List<Student> students =(List<Student>)query1.getResultList();
		return students;
	}

	@Override
	public void deleteStudents(int userId) {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("from Student s where s.userId='"+userId+"'");
		List<Student> students =(List<Student>)query.getResultList();
		for(Student temp:students) {
			session.delete(temp);
		}
	}
	
}
