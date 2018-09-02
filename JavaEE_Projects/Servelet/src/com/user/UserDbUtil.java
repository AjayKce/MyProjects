package com.user;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.sql.DataSource;

public class UserDbUtil {
	private DataSource dataSource;
	public UserDbUtil(DataSource theDataSource) {
		dataSource = theDataSource;
	}
	

	public boolean register(User user) throws SQLException {
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet Rs = null;
		boolean set = false;
		boolean flag=true;
		String username = user.getUsername();
		String Query = "select username from user where username=?";
		try {
			conn=dataSource.getConnection();
			stmt=conn.prepareStatement(Query);
			stmt.setString(1,username);
			Rs=stmt.executeQuery();
			while(Rs.next()) {
				String result = Rs.getString("username");
				if(result==null) {
					flag=true;
					break;
				}
				else {
					flag=false;
					break;
				}
			}
			if(flag) {
				sucessRegister(user);
				set=true;
			}
			else {
				set=false;
			}
		}catch(Exception e) {
			
		}
		finally {
		}
		return set;
	}


	private boolean sucessRegister(User user) throws SQLException {
		Connection conn = null;
		PreparedStatement stmt = null;
		String username = user.getUsername();
		String Query = "insert into user(username,password,repassword)values(?,?,?)";
		try {
			conn=dataSource.getConnection();
			stmt=conn.prepareStatement(Query);
			stmt.setString(1,user.getUsername());
			stmt.setString(2,user.getPassword());
			stmt.setString(3,user.getRepassword());
			stmt.execute();
		} catch (SQLException e) {
		}
		finally {
			conn.close();
			stmt.close();
		}			
		return true;
	}


	public boolean verifylogin(User st) throws SQLException {
		Connection conn=null;
		PreparedStatement stmt = null;
		ResultSet Rs=null;
		boolean flag=false;
		String query = "SELECT count(username) FROM user_tracker.user where username=? and password=?";
		try {
			conn=dataSource.getConnection();
			stmt=conn.prepareStatement(query);
			stmt.setString(1,st.getUsername());
			stmt.setString(2,st.getPassword());
			Rs=stmt.executeQuery();
			while(Rs.next()) {
				String res=Rs.getString("count(username)");
				//System.out.println(res);
				if(res.equals("1")) {
					flag=true;
				}
				else {
					flag=false;
				}
			}
		}catch(Exception e) {
			
		}
		finally {
			conn.close();
			stmt.close();
			Rs.close();
		}
		//System.out.println(flag);
		return flag;
	}


	public void updatepassword(User newuse) throws SQLException {
		Connection conn=null;
		PreparedStatement stmt = null;
		String Query = "update user set password=?,repassword=? where username=?";
		try {
			conn=dataSource.getConnection();
			stmt=conn.prepareStatement(Query);
			stmt.setString(1,newuse.getPassword());
			stmt.setString(2,newuse.getRepassword());
			stmt.setString(3,newuse.getUsername());
			stmt.execute();
		} catch (SQLException e) {
		}finally {
			conn.close();
			stmt.close();
		}
	}


	public boolean hasDb() throws SQLException {
		Connection conn=null;
		PreparedStatement stmt=null;
		ResultSet Rs=null;
		boolean flag=false;
		int c=0;
		String query = "SELECT count(*) FROM user_tracker.user";
		try {
			conn=dataSource.getConnection();
			stmt=conn.prepareStatement(query);
			Rs = stmt.executeQuery();
			while(Rs.next()) {
				String res = Rs.getString("count(*)");
				c = Integer.parseInt(res);
				System.out.println(c);
			}
			if(c==0) {
				flag=false;
			}
			else {
				flag=true;
			}
			
		} catch (SQLException e) {
		}
		System.out.println(flag);
		return flag;
	}

	public void createDb() throws SQLException {
		Connection conn = null;
		Statement stmt = null;
		String query = "Create table user(id int(11) NOT NULL AUTO_INCREMENT,username varchar(20),password varchar(20),repassword varchar(20),PRIMARY KEY (id));";
		System.out.println(query);
		try {
			conn=dataSource.getConnection();
			stmt=conn.createStatement();
			stmt.executeUpdate(query);
		} catch (SQLException e) {
           System.out.println("err : "+e);
		}
		
	}


	
	
	
}


