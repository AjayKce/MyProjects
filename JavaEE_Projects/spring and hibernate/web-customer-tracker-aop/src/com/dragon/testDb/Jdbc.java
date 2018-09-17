package com.dragon.testDb;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Jdbc {

	public static void main(String[] args) {
		Connection con = null;
		String user = "root";
		String pass = "admin";
		String url = "jdbc:mysql://localhost:3306/web_customer_tracker";
		try {
			con = DriverManager.getConnection(url,user,pass);
			System.out.println("Connected");
		} catch (SQLException e) {
			System.out.println(e);
		}
	}

}
