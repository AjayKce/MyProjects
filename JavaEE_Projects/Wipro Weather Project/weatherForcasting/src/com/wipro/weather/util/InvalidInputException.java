package com.wipro.weather.util;

public class InvalidInputException {
	private String message;

	public InvalidInputException(String message) {
		this.message = message;
	}
 
	
	
	public String getMessage() {
		return message;
	}



	@Override
	public String toString() {
		return "InvalidInputException [message=" + message + "]";
	}
	
	
}
