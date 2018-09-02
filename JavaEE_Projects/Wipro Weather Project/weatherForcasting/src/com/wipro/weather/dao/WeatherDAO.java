package com.wipro.weather.dao;

import java.util.Date;
import java.util.Random;
import java.sql.*;
import java.text.DateFormat;
import java.text.SimpleDateFormat;

import com.wipro.weather.bean.WeatherBean;
import com.wipro.weather.util.DBUtil;

public class WeatherDAO {
	
	static Connection con = null;
	PreparedStatement stmt = null;
	ResultSet rs = null;
	
public String createForecast(WeatherBean weatherBean) throws SQLException {
	con = DBUtil.getDBConnection();
	String query = "insert into weather_tb values(?,?,?,?,?,?,?)";
	stmt = con.prepareStatement(query);
	DateFormat formatter = new SimpleDateFormat("yyyy-MM-dd"); 
	String date = formatter.format(weatherBean.getDate());
	stmt.setString(1, weatherBean.getReportId());
	stmt.setString(2, weatherBean.getLocation());
	stmt.setString(3,date);
	stmt.setInt(4, weatherBean.getTemperature());
	stmt.setInt(5,weatherBean.getHumidity());
	stmt.setString(6,weatherBean.getWind() );
	stmt.setString(7,weatherBean.getForecast());
	boolean set = stmt.execute();
	if(set) {
		return weatherBean.getReportId();
	}
	else {
		return "FAIL";
	}
}

public WeatherBean fetchForecast(String location, Date date) throws SQLException {
	con = DBUtil.getDBConnection();
	DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");  
	String userDate = dateFormat.format(date);
	String query = "select * from weather_tb where LOCATION=? and R_DATE=?";
		stmt = con.prepareStatement(query);
		stmt.setString(1, location);
		stmt.setString(2, userDate);
		rs = stmt.executeQuery();
		WeatherBean result = new WeatherBean();
		if(rs!=null) {
			while(rs.next()) {
				result.setReportId(rs.getString("REPORTID"));
				result.setDate(rs.getDate("R_DATE"));
				result.setForecast(rs.getString("FORECAST"));
				result.setHumidity(rs.getInt("HUMIDITY"));
				result.setLocation(rs.getString("LOCATION"));
				result.setTemperature(rs.getInt("TEMPERATURE"));
				result.setWind(rs.getString("WIND"));
			}
			return result;
		}
		else {
			return null;
		}
}

public String generateReportID(String location,Date date) {
	Random rand = new Random();
	String  randomNumber =String.valueOf(rand.nextInt(100) + 10);
	String two = location.substring(0, 2).toUpperCase();
	DateFormat formatter = new SimpleDateFormat("yyyyMMdd"); 
	String da = formatter.format(date);
	String reportId = da+two+randomNumber;
	return reportId;
}

public boolean reportExists(String location,Date date) throws SQLException{
	con = DBUtil.getDBConnection();
	DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");  
	String userDate = dateFormat.format(date);
	String query = "select * from weather_tb where LOCATION=? and R_DATE=?";
		stmt = con.prepareStatement(query);
		stmt.setString(1, location);
		stmt.setString(2, userDate);
		rs = stmt.executeQuery();
		String res=null;
		while(rs.next()) {
			res="exists";
		}
		if(res==null) {
			return false;
		}
		else {
			return true;
		}
}

}