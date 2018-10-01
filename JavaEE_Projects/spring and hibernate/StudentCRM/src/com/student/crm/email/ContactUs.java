package com.student.crm.email;

import java.util.Properties;    
import javax.mail.*;    
import javax.mail.internet.*; 

public class ContactUs {
	public boolean send(String name,String email,String comment) {
		String to = "aajay0288@gmail.com";
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
	            message.setSubject("Contact From STUMAN");

				String content = "<html>\r\n" + 
						"<body>\r\n" + 
						"	<form style='background-color:silver;'>\r\n" + 
						"	<p align='center'>\r\n" + 
						"		<table>\r\n" + 
						"			<tr><td>From : </td><td>"+name+"</td></tr>\r\n" + 
						"			<tr><td>Email : </td><td>"+email+"</td></tr>\r\n" + 
						"			<tr><td>Message : </td><td><textarea rows='5' cols='20' readonly>"+comment+"</textarea></td></tr>\r\n" + 
						"		</table>\r\n" + 
						"	</p>\r\n" + 
						"	</form>\r\n" + 
						"</body>\r\n" + 
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
