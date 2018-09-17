package com.dragon.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.dragon.dao.CustomerDAO;
import com.dragon.entity.Customer;

@Service
public class CustomerServiceImpl implements CustomerService {
	
	@Autowired
	private CustomerDAO customer;

	@Override
	@Transactional
	public List<Customer> getCustomers() {
		List<Customer> customers = customer.getCustomers();
		return customers;
	}
	
	@Override
	@Transactional
	public void saveCustomer(Customer theCustomer) {
		customer.saveCustomer(theCustomer);
	}

	@Override
	@Transactional
	public Customer getCustomer(int theId) {
		Customer cust = customer.getCustomer(theId);
		return cust;
	}

	@Override
	@Transactional
	public void deleteCustomer(int theId) {
		customer.deleteCustomer(theId);		
	}

}
