package com.wipro.weather.servlets;

import java.io.IOException;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.wipro.weather.bean.WeatherBean;
import com.wipro.weather.service.Administrator;

@WebServlet("/MainServlet")
public class MainServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public MainServlet() {

    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	doPost(request,response);
    }
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String command = request.getParameter("command");
		if(command==null) {
			command="HOME";
		}
		switch(command) {
		case "ADD":
			try {
				String result = addForecast(request);
				if(result.equals("true")) {
					response.sendRedirect("success.html");
				}
				else {
					response.sendRedirect("error.html");
				}
			} catch (Exception e) {
				System.out.println(e);
			}
			break;
		case "VIEW":
			try {
				WeatherBean view=viewForecast(request);
				request.setAttribute("view", view);
				RequestDispatcher res = request.getRequestDispatcher("displayForecast.jsp");
				res.forward(request, response);
			} catch (Exception e) {
				System.out.println(e);
			} 
			break;
		default:
			response.sendRedirect("menu.html");
		}
	}

	public String addForecast(HttpServletRequest request) throws ParseException, SQLException {
		Date da = new SimpleDateFormat("yyyy-MM-dd").parse(request.getParameter("date"));  
		WeatherBean add  = new WeatherBean();
		Administrator admin = new Administrator();
		add.setLocation(request.getParameter("location"));
		add.setDate(da);
		add.setTemperature(Integer.parseInt(request.getParameter("temperature")));
		add.setHumidity(Integer.parseInt(request.getParameter("humidity")));
		add.setWind(request.getParameter("wind"));
		add.setForecast(request.getParameter("forecast"));
		String resultMessage = admin.addForecast(add);
		if(resultMessage.equals("Added")) {
			return "true";
		}
		else {
			request.setAttribute("error",resultMessage);
			return "false";
		}
		
	}
	
	public WeatherBean viewForecast(HttpServletRequest request) throws ParseException, SQLException {
		String location = request.getParameter("slocation");
		Date date = new SimpleDateFormat("yyyy-MM-dd").parse(request.getParameter("sdate"));  
		Administrator admin = new Administrator();
		WeatherBean view = admin.viewForecast(location, date);
		return view;
	}
	
	
}
