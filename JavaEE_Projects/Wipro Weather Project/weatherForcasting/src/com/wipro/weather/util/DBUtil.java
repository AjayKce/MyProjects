package com.wipro.weather.util;

import java.sql.*;

public class DBUtil {
	public static Connection getDBConnection() {
		Connection con = null;
		String url="jdbc:mysql://localhost:3306/weatherforecast";
		String user="root";
		String pass="admin";
		try {
			Class.forName("com.mysql.jdbc.Driver");  
			con=DriverManager.getConnection(url,user,pass);
		}catch(Exception e) {
			System.out.println(e);
		}
		return con;
		
	}
	
}
