package com.user;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.annotation.Resource;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

@WebServlet("/UserServlet")
public class UserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private UserDbUtil userDb;
	CreateDatabase Db= new CreateDatabase();
	@Resource(name="jdbc/user_tracker")
	private DataSource datasource;
	
	
	@Override
	public void init() throws ServletException {
		super.init();
		try {
			userDb = new UserDbUtil(datasource);
		}catch(Exception e) {
			throw new ServletException(e);
		}
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String thecommand = request.getParameter("command");
		if(thecommand==null) {
			thecommand="HOME";
		}
		switch(thecommand) {
		
		case "REGISTER":
			try {
				register(request,response);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			break;
		case "LOGIN":
			try {
				login(request,response);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			break;
		case "CHANGEPASSWORD":
			try {
				changepassword(request,response);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			break;
		default:
		{
			try {
				createDB(request,response);
			} catch (SQLException e) {
			}
			homepage(request,response);
		}
		
		}
		
	}

	private void createDB(HttpServletRequest request, HttpServletResponse response) throws SQLException {
		System.out.println(userDb.hasDb());
		if(userDb.hasDb()==false) {
			userDb.createDb();
		}
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

	private void changepassword(HttpServletRequest request, HttpServletResponse response) throws IOException, SQLException {
		PrintWriter out = response.getWriter();
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String cpassword = request.getParameter("changepassword");
		User st = new User(username,password);
		User newuse = new User(username,cpassword,cpassword);
		if(userDb.verifylogin(st)) {
			userDb.updatepassword(newuse);
			out.println("<!DOCTYPE html>");
			out.println("<html>");
			out.println("<head>");
			out.println("<title>Changed Page</title>");
			out.println("<link rel='stylesheet' href='https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css'>");
			out.println("<script src='https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js'></script>");
			out.println("<script src='https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js'></script>");
			out.println("</head>");
			out.println("<body>");
			out.println("<div class='container'>");
			out.println("<div class='row'>");
			out.println("<div class='well well-lg'>Hello "+username+" You have successfully Changed your password</div>");
			out.println("<a href='Login.html'>Go to Login Page</a>");
			out.println("</div></div></body></html>");
		}
		else {
			out.println("<!DOCTYPE html><html><head><meta charset='ISO-8859-1'><title>Change Password</title>");
			out.println("<link rel='stylesheet' href='https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css'>");
			out.println("<script src='https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js'></script>");
			out.println("<script src='https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js'></script>");
			out.println("<link rel='stylesheet' href='StaticFiles/css/ChangePassword.css'>");
			out.println("</head><body><div class='container'><div class='row'>");
			out.println("<h1 align='center'>Change Your Form</h1><br>");
			out.println("<h3 align='center' style='color:red;'>Your credentials are wrong please enter correct credentials and change password</h3>");
			out.println("<div class='col-md-4 col-lg-4 col-sm-0 col-xs-0'></div>");
			out.println("<div class='col-md-4 col-lg-4 col-sm-12 col-xs-12'>");
			out.println("<form class='form' method='post' action='UserServlet' >");
			out.println("<label for='user' class='col-md-6 col-lg-6 col-sm-6 col-xs-6'>UserName : </label>");
			out.println("<input type='text' name='username' class='form-control' id='user' required><br />");
			out.println("<label for='pass' class='col-md-6 col-lg-6 col-sm-6 col-xs-6'>Current-PassWord : </label>");
			out.println("<input type='password' name='password' class='form-control' id='pass' required><br />");
			out.println("<label for='cpass' class='col-md-6 col-lg-6 col-sm-6 col-xs-6' required>NEW-PassWord : </label>");
			out.println("<input type='password' name='changepassword' class='form-control' id='cpass'><br />");
			out.println("<input type='hidden' name='command' value='CHANGEPASSWORD'>");
			out.println("<center><input type='submit' class='btn btn-success' value='submit'></center>");
			out.println("</form><a href='index.html'><button class='btn btn-primary'>Go to Home</button></a></div><div class='col-md-4 col-lg-4 col-sm-0 col-xs-0'></div></div>");
			out.println("</div></body></html>");
		}
	}

	private void login(HttpServletRequest request, HttpServletResponse response) throws IOException, SQLException {
		PrintWriter out = response.getWriter();
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		User st = new User(username,password);
		if(userDb.verifylogin(st)) {
			out.println("<!DOCTYPE html>");
			out.println("<html>");
			out.println("<head>");
			out.println("<title>Registered Page</title>");
			out.println("<link rel='stylesheet' href='https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css'>");
			out.println("<script src='https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js'></script>");
			out.println("<script src='https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js'></script>");
			out.println("</head>");
			out.println("<body>");
			out.println("<div class='container'>");
			out.println("<div class='row'>");
			out.println("<div class='well well-lg'>Welcome "+username+" You have successfully Logged In</div>");
			out.println("<a href='index.html'>Go to Home Page</a>");
			out.println("</div></div></body></html>");
		}
		else {
			out.println("<!DOCTYPE html><html><head><meta charset='ISO-8859-1'><title>Home Page</title>");
			out.println("<link rel='stylesheet' href='https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css'>");
			out.println("<script src='https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js'></script>");
			out.println("<script src='https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js'></script>");
			out.println("<link rel='stylesheet' href='StaticFiles/css/login.css'></head><body>");
			out.println("<div class='container'>");
			out.println("<div class='row'><h1 align='center'>Login Your Form</h1><br />");
			out.println("<h3 align='center' style='color:red;'>Your credentials are wrong please enter correct credentials</h3>");
			out.println("<div class='col-md-4 col-lg-4 col-sm-0 col-xs-0'></div>");
			out.println("<div class='col-md-4 col-lg-4 col-sm-12 col-xs-12'>");
			out.println("<form class='form' method='post' action='UserServlet' >");
			out.println("<label for='user' class='col-md-6 col-lg-6 col-sm-6 col-xs-6'>UserName : </label>");
			out.println("<input type='text' name='username' class='form-control' id='user' required><br />");
			out.println("<label for='pass' class='col-md-6 col-lg-6 col-sm-6 col-xs-6'>PassWord : </label>");
			out.println("<input type='password' name='password' class='form-control' id='pass' required><br />");
			out.println("<input type='hidden' name='command' value='LOGIN'>");
			out.println("<center><input type='submit' class='btn btn-success' value='submit'>");
			out.println("</center></form><a href='index.html'><button class='btn btn-primary'>Go to Home</button></a></div>");
			out.println("<div class='col-md-4 col-lg-4 col-sm-0 col-xs-0'></div>");
			out.println("</div></div></body></html>");
		}
		
	}

	private void homepage(HttpServletRequest request, HttpServletResponse response) throws IOException {
		PrintWriter out = response.getWriter();
		out.println("<!DOCTYPE html>");
		out.println("<html><head><meta charset='ISO-8859-1'><title>Home Page</title>");
		out.println("<link rel='stylesheet' href='https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css'>");
		out.println("<script src='https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js'></script>");
		out.println("<script src='https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js'></script>");
		out.println("<link rel='stylesheet' href='StaticFiles/css/index.css'>");
		out.println("</head><body>");
		out.println("<hr/><h1 align='center' id='header'>Welcome To User Tracker</h1>");
		out.println("<hr/><div class='container'>");
		out.println("<div class='row'><div class='col-lg-4 col-md-4 col-xs-4 col-sm-4'>");
		out.println("<center><a href='Login.html'><button class='btn btn-success' type='submit'>Login</button></a></center>");
		out.println("</div><div class='col-lg-4 col-md-4 col-xs-4 col-sm-4'>");
		out.println("<center><a href='ChangePassword.html'><button class='btn btn-info' type='submit'>ChangePassword</button></a></center>");
		out.println("</div><div class='col-lg-4 col-md-4 col-xs-4 col-sm-4'>");
		out.println("<center><a href='Register.html'><button  class='btn btn-primary' type='submit'>Register</button></a></center>");
		out.println("</div></div></div><hr/></body></html>");
	}

	private void register(HttpServletRequest request, HttpServletResponse response) throws IOException, SQLException {
		PrintWriter out = response.getWriter();
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String rpassword = request.getParameter("rpassword");
		User user = new  User(username,password,rpassword);
		if(password.equals(rpassword)) {
			        if(userDb.register(user)) {
					out.println("<!DOCTYPE html>");
					out.println("<html>");
					out.println("<head>");
					out.println("<title>Registered Page</title>");
					out.println("<link rel='stylesheet' href='https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css'>");
					out.println("<script src='https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js'></script>");
					out.println("<script src='https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js'></script>");
					out.println("</head>");
					out.println("<body>");
					out.println("<div class='container'>");
					out.println("<div class='row'>");
					out.println("<div class='well well-lg'>You have successfully Registered</div>");
					out.println("<a href='Login.html'>Go to login Page</a>");
					out.println("</div></div></body></html>");
			        }
			        else {
			        	out.println("<!DOCTYPE html>");
			    		out.println("<html>");
			    		out.println("<head>");
			    		out.println("<meta charset='ISO-8859-1'>");
			    		out.println("<title>Home Page</title>");
			    		out.println("<link rel='stylesheet' href='https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css'>");
			    				out.println("<script src='https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js'></script>");
			    				out.println("<script src='https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js'></script>");
			    				out.println("<link rel='stylesheet' href='StaticFiles/css/Register.css'>");
			    				out.println("</head>");
			    				out.println("<body>");
			    				out.println("<div class='container'>");
			    				out.println("<div class='row'>");
			    				out.println("<h1 align='center'>Register Your Form</h1>");
			    				out.println("<br>");
			    				out.println("<h3 align='center' style='color:red'>The user is already registered</h3><br/>");
			    				out.println("<div class='col-md-4 col-lg-4 col-sm-0 col-xs-0'></div>");
			    				out.println("<div class='col-md-4 col-lg-4 col-sm-12 col-xs-12'>");
			    				out.println("<form method='post' class='form' action='UserServlet' >");
			    				out.println("<label for='user' class='col-md-6 col-lg-6 col-sm-6 col-xs-6'>UserName : </label>");
			    				out.println("<input type='text' name='username' value="+request.getParameter("username")+" class='form-control' id='user' required><br />");
			    				out.println("<label for='pass' class='col-md-6 col-lg-6 col-sm-6 col-xs-6' value=''>PassWord : </label>");
			    				out.println("<input type='password' name='password' class='form-control' id='pass' required><br />");
			    				out.println("<label for='rpass' class='col-md-6 col-lg-6 col-sm-6 col-xs-6' value='' required>Re-Enter-PassWord : </label>");
			    				out.println("<input type='password' name='rpassword' class='form-control' id='rpass'><br />");
			    				out.println("<input type='hidden' name='command' value='REGISTER'>");
			    				out.println("<center>");
			    				out.println("	<input type='submit' class='btn btn-success' value='submit'>");
			    				out.println("</center>");
			    				out.println("</form>");
			    				out.println("<a href='index.html'><button class='btn btn-primary'>Go to Home</button></a></div>");
			    				out.println("<div class='col-md-4 col-lg-4 col-sm-0 col-xs-0'></div>");
			    				out.println("</div>");
			    			    out.println("</div>");
			    			    out.println("</body>");
			                    out.println("</html>");
			        }
		}
		else {
			renderRegisterFile(request,response);
		}
	}


	private void renderRegisterFile(HttpServletRequest request, HttpServletResponse response) throws IOException {
		PrintWriter out = response.getWriter();
		out.println("<!DOCTYPE html>");
		out.println("<html>");
				out.println("<head>");
				out.println("<meta charset='ISO-8859-1'>");
				out.println("<title>Home Page</title>");
				out.println("<link rel='stylesheet' href='https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css'>");
				out.println("<script src='https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js'></script>");
				out.println("<script src='https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js'></script>");
				out.println("<link rel='stylesheet' href='StaticFiles/css/Register.css'>");
				out.println("</head>");
				out.println("<body>");
				out.println("<div class='container'>");
				out.println("<div class='row'>");
				out.println("<h1 align='center'>Register Your Form</h1>");
				out.println("<br>");
				out.println("<h3 align='center' style='color:red'>The password is incorrect pls enter correct password</h3><br/>");
				out.println("<div class='col-md-4 col-lg-4 col-sm-0 col-xs-0'></div>");
				out.println("<div class='col-md-4 col-lg-4 col-sm-12 col-xs-12'>");
				out.println("<form method='post' class='form' action='UserServlet' >");
				out.println("<label for='user' class='col-md-6 col-lg-6 col-sm-6 col-xs-6'>UserName : </label>");
				out.println("<input type='text' name='username' value="+request.getParameter("username")+" class='form-control' id='user' required><br />");
				out.println("<label for='pass' class='col-md-6 col-lg-6 col-sm-6 col-xs-6' value=''>PassWord : </label>");
				out.println("<input type='password' name='password' class='form-control' id='pass' required><br />");
				out.println("<label for='rpass' class='col-md-6 col-lg-6 col-sm-6 col-xs-6' value='' required>Re-Enter-PassWord : </label>");
				out.println("<input type='password' name='rpassword' class='form-control' id='rpass'><br />");
				out.println("<input type='hidden' name='command' value='REGISTER'>");
				out.println("<center>");
				out.println("	<input type='submit' class='btn btn-success' value='submit'>");
				out.println("</center>");
				out.println("</form>");
				out.println("<a href='index.html'><button class='btn btn-primary'>Go to Home</button></a></div>");
				out.println("<div class='col-md-4 col-lg-4 col-sm-0 col-xs-0'></div>");
				out.println("</div>");
			    out.println("</div>");
			    out.println("</body>");
                out.println("</html>");
	}


}
