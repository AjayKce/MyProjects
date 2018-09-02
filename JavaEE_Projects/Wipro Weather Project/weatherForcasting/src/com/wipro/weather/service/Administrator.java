package com.wipro.weather.service;

import java.sql.SQLException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import com.wipro.weather.bean.WeatherBean;
import com.wipro.weather.util.InvalidInputException;
import com.wipro.weather.dao.WeatherDAO;

public class Administrator {
	WeatherDAO weatherdeo = new WeatherDAO();
	public String addForecast(WeatherBean weatherBean) throws SQLException, ParseException {
		if(weatherBean==null||weatherBean.getLocation()==null||weatherBean.getDate()==null) {
			InvalidInputException error = new InvalidInputException("INVALID INPUT");
			System.out.println(error.getMessage());
			return error.getMessage();
		}
		if((weatherBean.getLocation()).length()<2) {
			InvalidInputException error = new InvalidInputException("INVALID LOCATION");
			System.out.println(error.getMessage());
			return error.getMessage();
		}
		if(ValidateDate(weatherBean.getDate())==false) {
			InvalidInputException error = new InvalidInputException("INVALID DATE");
			System.out.println(error.getMessage());
			return error.getMessage();
		}
		if(weatherdeo.reportExists(weatherBean.getLocation(),weatherBean.getDate())==true) {
			InvalidInputException error = new InvalidInputException("ALREADY EXISTS");
			System.out.println(error.getMessage());
			return error.getMessage();
		}
		String reportId = weatherdeo.generateReportID(weatherBean.getLocation(),weatherBean.getDate());
		if(reportId!=null) {
			weatherBean.setReportId(reportId);
			weatherdeo.createForecast(weatherBean);
		}
		return "Added";
		
	}
	
	private boolean ValidateDate(Date date) throws ParseException {
		Calendar cal = Calendar.getInstance();
	    String day =String.valueOf(cal.get(Calendar.DATE));
	    String month = String.valueOf(cal.get(Calendar.MONTH) + 1);
	    String year = String.valueOf(cal.get(Calendar.YEAR));
	    String fullDate = year+"-"+month+"-"+day;
	    
	    Date d = date;
		Date now = null;
		
		DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");  
		String userDate = dateFormat.format(d);
		now = dateFormat.parse(fullDate);
		String today = dateFormat.format(now);
		Date d1 = dateFormat.parse(today);
		Date d2 = dateFormat.parse(userDate);
		if(d1.compareTo(d2)==-1) {
			return true;
		}
		else {
			return false;
		}
		
	}

	public WeatherBean viewForecast(String location,Date date) throws SQLException {
		WeatherBean result = weatherdeo.fetchForecast(location, date);
		return result;
	}
}
