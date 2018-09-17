package com.dragon.testDb;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/JdbcDemo")
public class JdbcDemo extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		PrintWriter out = response.getWriter();
		Connection con = null;
		String user = "springstudent";
		String pass = "springstudent";
		String url = "jdbc:mysql://localhost:3306/web_customer_tracker";
		try {
			try {
				Class.forName("com.mysql.jdbc.Driver");
			} catch (ClassNotFoundException e) {
				System.out.println(e);
			}
			con = DriverManager.getConnection(url,user,pass);
			out.println("Connected success!!!");
		} catch (SQLException e) {
			System.out.println(e);
		}
		
	}

}
