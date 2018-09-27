package com.student.crm.email;

import java.util.Properties;    
import javax.mail.*;    
import javax.mail.internet.*; 

public class ForgetSendMail {
	public boolean send(String toMail,String validator) {
		String to = toMail;
	      String from = "aajay0288@gmail.com";
	      final String username = "aajay0288@gmail.com";
	      final String password = "8508223990";
	      Properties properties = new Properties();
	      properties.put("mail.smtp.host", "smtp.gmail.com");
	        properties.put("mail.smtp.port", "587");
	        properties.put("mail.smtp.starttls.enable", "true");
	        properties.put("mail.smtp.auth", "true");
	        properties.put("mail.smtp.ssl.trust", "smtp.gmail.com");
	        Session session = Session.getInstance(properties,
	         new javax.mail.Authenticator() {
	            protected PasswordAuthentication getPasswordAuthentication() {
	               return new PasswordAuthentication(username, password);
	            }
		});

	      try {
	            Message message = new MimeMessage(session);
	            message.setFrom(new InternetAddress(from));
	            message.setRecipients(Message.RecipientType.TO,
	            		InternetAddress.parse(to));
	            message.setSubject("Reset Your Password");

				String content = "<html lang='en'>" + 
				"<head>" + 
				"    <meta charset='UTF-8'>" + 
				"    <meta name='viewport' content='width=device-width, initial-scale=1.0'>" + 
				"    <meta http-equiv='X-UA-Compatible' content='ie=edge'>" + 
				"    <link rel='stylesheet' href='http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css'>" + 
				"    <script src='https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js'></script>" + 
				"    <script src='http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js'></script>" + 
				"</head>" + 
				"<body>" + 
				"    <div class='container-fluid'>" + 
				"        <div class='row'>" + 
				"            <div class='col-lg-4 col-md-4 col-xs-12 col-sm-12'></div>" + 
				"            <div class='col-lg-4 col-md-4 col-xs-12 col-sm-12'>" + 
				"                <h2 style='color:blue' align='center'>Click the button to verify your App</h2>" + 
				"                <span class='col-lg-4 col-md-4 col-xs-4 col-sm-4'></span>" + 
				"                <span class='col-lg-4 col-md-4 col-xs-4 col-sm-4'>" + 
				"                    <center>"
				+ "						<a href='http://localhost:8080/StudentCRM/passwordReset?email="+toMail+"&forgetCode="+validator+"'>" + 
				"                        <button style='width:30%;padding:10px;background-color:green;color:white' class='btn btn-success'>Reset password</button>" + 
				"                    </a><center>" + 
				"                </span>" + 
				"                <span class='col-lg-4 col-md-4 col-xs-4 col-sm-4'></span>" + 
				"            </div>" + 
				"            <div class='col-lg-4 col-md-4 col-xs-12 col-sm-12'></div>" + 
				"        </div>" + 
				"    </div>" + 
				"</body>" + 
				"</html>";

	            message.setContent(content,"text/html");
	            Transport.send(message);

	            System.out.println("Sent message successfully....");
	            return true;

	      } catch (Exception e) {
		    return false;
	      }
	   }
}
