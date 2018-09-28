    <%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
    <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
    <%@ page import="java.util.List" %>
    <%@ page import="com.student.crm.entity.Student" %>
    <html>
     <head>
      <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
      <title>Sample Hello World Example</title>
     </head>
    <body>
     <table cellpadding="1"  cellspacing="0" border="1" bordercolor="gray">
      <thead>
       <th>first name</th>
       <th>last name</th>
       <th>roll no</th>
       <th>gender</th>
       <th>blood group</th>
       <th>department</th>
       <th>current year</th>
       <th>current semester</th>
       <th>email</th>
       <th>phone number</th>
       <th>date-of-birth</th>
       <th>pancard number</th>
       <th>account number</th>
       <th>ifsc code</th>
       <th>aadhar number</th>
       <th>voter id</th>
       <th>parent name</th>
       <th>parent gender</th>
       <th>parent-phone-number</th>
       <th>address</th>
       <th>pincode</th>
      </thead>
      <%
       List<Student> students  = (List<Student>)request.getAttribute("students");
             if (students != null) {
                 response.setContentType("application/vnd.ms-excel");
                 response.setHeader("Content-Disposition", "inline; filename="+ "studentreport.xlsx");
             }
       for(Student temp: students){
      %>
       <tr>
       		<td><%=temp.getFirstName() %></td>
       		<td><%=temp.getLastName() %></td>
       		<td><%=temp.getRollNo() %></td>
       		<td><%=temp.getGender() %></td>
       		<td><%=temp.getBloodGroup() %></td>
       		<td><%=temp.getDepartment() %></td>
       		<td><%=temp.getCurrentYear() %></td>
       		<td><%=temp.getCurrentSemester() %></td>
       		<td><%=temp.getEmail() %></td>
       		<td><%=temp.getPhoneNumber() %></td>
       		<td><%
            String str = temp.getDateOfBirth();
            String year = str.substring(0, 4);
            String month = str.substring(5, 7);
            String date = str.substring(8, 10);
            String dob=date+"-"+month+"-"+year;
            out.println(dob);%></td>
       		<td><%=temp.getPanCard() %></td>
       		<td><%=temp.getAccountNumber() %></td>
       		<td><%=temp.getIfsc() %></td>
       		<td><%=temp.getAadhar() %></td>
       		<td><%=temp.getVoteId() %></td>
       		<td><%=temp.getParentName() %></td>
       		<td><%=temp.getParentGender() %></td>
       		<td><%=temp.getParentPhoneNumber() %></td>
       		<td><%=temp.getAddress() %></td>
       		<td><%=temp.getPinCode() %></td>
      </tr>
      <% 
       }
      %>
     </table>
    </body>
    </html>