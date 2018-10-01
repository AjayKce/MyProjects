<%@ page import="javax.servlet.http.*,com.student.crm.entity.*,java.util.*" %>
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
        <!DOCTYPE html>
        <html lang="en">

        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <meta http-equiv="X-UA-Compatible" content="ie=edge">
            <title>table-view</title>
            <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
            <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
            <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
            <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
            <link href="${pageContext.request.contextPath}/resources/stylesheet/tableView.css" rel="stylesheet">
            <link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/images/logo.png" type="image/x-icon">
            <% User owner = (User)request.getAttribute("owner"); %>
            <%List<Student> students =(List<Student>)request.getAttribute("students"); %>
                    <script>
                            $(document).ready(function(){
                                <%for(Student temp:students){ %>
                                $("#extraDetails<%=temp.getId()%>").click(function(){
                                    $("#extraDetails<%=temp.getId()%>").hide();
                                    $(".extraDetails<%=temp.getId()%>").show();
                                    $(".studentDetails<%=temp.getId()%>").hide();
                                    $("#studentDetails<%=temp.getId()%>").show();
                                });
                                $("#studentDetails<%=temp.getId()%>").click(function(){
                                    $("#extraDetails<%=temp.getId()%>").show();
                                    $(".extraDetails<%=temp.getId()%>").hide();
                                    $(".studentDetails<%=temp.getId()%>").show();
                                    $("#studentDetails<%=temp.getId()%>").hide();
                                })
                                <%}%>
                            });
                    </script>
        </head>

        <body>
            <nav class="navbar navbar-inverse navbar-fixed-top">
                <div class="container-fluid">
                    <div class="navbar-header">
                        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
                          <span class="icon-bar"></span>
                          <span class="icon-bar"></span>
                          <span class="icon-bar"></span>
                        </button>
                        <a class="navbar-brand" href="">STUMAN</a>
                    </div>
                    <div class="collapse navbar-collapse" id="myNavbar">
                        <ul class="nav navbar-nav">
                            <li>
                                <a href="${pageContext.request.contextPath}/student/home">
                                <span class="glyphicon glyphicon-home"></span>
                                    Home
                                </a>
                            </li>
                            <li>
                                <a href="${pageContext.request.contextPath}/student/showStudentFormToAdd">
                                    <span class="fa fa-user-plus"></span>
                                    Add Student
                                </a>
                            </li>
                            <li>
                                <a href="${pageContext.request.contextPath}/student/showStudentFilterView">
                                    <span class="glyphicon glyphicon-filter"></span>
                                    Filter Student
                                </a>
                            </li>
                            <li>
                                <a href="${pageContext.request.contextPath}/student/export">
                                    <span class="glyphicon glyphicon-share"></span>
                                    Report
                                </a>
                            </li>
                            <li class="active">
                                <a href="${pageContext.request.contextPath}/student/showStudentTableView">
                                    <span class="glyphicon glyphicon-list-alt"></span>
                                    View Student
                                </a>
                            </li>
                            <li>
                                <a href="${pageContext.request.contextPath}/student/exportWord">
                                    <span class="fa fa-file-word-o"></span>
                                    Word Report
                                </a>
                            </li>
                            <li>
                                <a href="${pageContext.request.contextPath}/student/exportExcel">
                                    <span class="fa fa-file-excel-o"></span>
                                    Excel Report
                                </a>
                            </li>
                        </ul>
                        <ul class="nav navbar-nav navbar-right">
                            <li><a href="${pageContext.request.contextPath}/student/home">Hello, <%=owner.getUsername() %></a></li>
                        </ul>
                    </div>
                </div>
            </nav>
            <div class="container-fluid panelViewOuter">
                <div class="row">
                    <%for(Student temp:students){ %>
            
            <span class="col-lg-4 col-md-4 col-sm-12 col-xs-12 outer">
                <table class="table table-responsive table-bordered">
                   <tr>
                       <td colspan="2" style="color:blue;"><b><%=temp.getRollNo() %></b></td>
                   </tr>
                   <tr class="studentDetails<%=temp.getId()%>">
                       <td style="color:blue;"><%=temp.getFirstName() %></td>
                       <td style="color:blue;"><%=temp.getLastName() %></td>
                   </tr>
                   <tr class="studentDetails<%=temp.getId()%>">
                       <td>Gender : </td>
                       <td style="color:blue;"><%=temp.getGender() %></td>
                   </tr>
                   <tr class="studentDetails<%=temp.getId()%>">
                        <td>Email :</td>
                        <td style="color:blue;"><%=temp.getEmail() %></td>
                    </tr>
                    <tr class="studentDetails<%=temp.getId()%>">
                        <td>Phone Number :</td>
                        <td style="color:blue;"><%=temp.getPhoneNumber() %></td>
                    </tr>
                    <tr class="studentDetails<%=temp.getId()%>">
                        <td>Birth Date</td>
                        <td style="color:blue;"><% 
                                    String str = temp.getDateOfBirth();
                                    String year = str.substring(0, 4);
                                    String month = str.substring(5, 7);
                                    String date = str.substring(8, 10);
                                    String dob=date+"-"+month+"-"+year;
                                    out.println(dob);
                                    %></td>
                    </tr>
                   <tr class="studentDetails<%=temp.getId()%>">
                       <td>Blood Group :</td>
                       <td style="color:blue;"><%=temp.getBloodGroup() %></td>
                   </tr>
                   <tr class="studentDetails<%=temp.getId()%>">
                       <td>Department : </td>
                        <td style="color:blue;"><%=temp.getDepartment() %></td>
                    </tr> 
                    <tr class="studentDetails<%=temp.getId()%>">
                        <td>Current Year :</td>
                        <td style="color:blue;"><%=temp.getCurrentYear() %></td>
                    </tr>
                    <tr class="studentDetails<%=temp.getId()%>">
                        <td>Current Semester :</td>
                        <td style="color:blue;"><%=temp.getCurrentSemester() %></td>
                    </tr>
                    <tr class="studentDetails<%=temp.getId()%>">
                        <td>Aadhar Number</td>
                        <td style="color:blue;"><%=temp.getAadhar() %></td>
                    </tr>
                    <tr class="extraDetails<%=temp.getId()%> collapse">
                        <td>Pan Card</td>
                        <td style="color:blue;"><%=temp.getPanCard() %></td>
                    </tr>
                    <tr class="extraDetails<%=temp.getId()%> collapse">
                        <td>Account Number</td>
                        <td style="color:blue;"><%=temp.getAccountNumber() %></td>
                    </tr>
                    <tr class="extraDetails<%=temp.getId()%> collapse">
                        <td>IFSC Code</td>
                        <td style="color:blue;"><%=temp.getIfsc() %></td>
                    </tr>
                    <tr class="extraDetails<%=temp.getId()%> collapse">
                        <td>Voter Id</td>
                        <td style="color:blue;"><%=temp.getVoteId() %></td>
                    </tr>       
                    <tr class="extraDetails<%=temp.getId()%> collapse">
                        <td>Parent Name</td>
                        <td style="color:blue;"><%=temp.getParentName() %></td>
                    </tr>
                    <tr class="extraDetails<%=temp.getId()%> collapse">
                            <td>Parent Gender</td>
                            <td style="color:blue;"><%=temp.getParentGender() %></td>
                        </tr>
                    <tr class="extraDetails<%=temp.getId()%> collapse">
                        <td>Parent Phone</td>
                        <td style="color:blue;"><%=temp.getParentPhoneNumber() %></td>
                    </tr>
                    <tr class="extraDetails<%=temp.getId()%> collapse">
                        <td>Pin Code</td>
                        <td style="color:blue;"></td>
                    </tr>
                    <tr class="extraDetails<%=temp.getId()%> collapse">
                        <td>Address</td>
                        <td><textarea disabled rows="3"><%=temp.getAddress() %></textarea></td>
                    </tr>
                    <tr  id="studentDetails<%=temp.getId()%>" class="collapse">
                            <td colspan="2">
                                <a class="btn btn-info" style="width:100%">Student Details</a>
                            </td>
                        </tr>
                    <tr id="extraDetails<%=temp.getId()%>">
                        <td colspan="2">
                        	<a class="btn btn-info" style="width:100%">Extra Details</a>
                        </td>
                    </tr>
                    <tr>
                    	<td>
                            <a href="${pageContext.request.contextPath}/student/panelUpdate?id=<%=temp.getId() %>&command=updateStudentTable">
                                <button style="width:100%" class="btn btn-primary">
                                    <span class="glyphicon glyphicon-edit"></span>
                                     Edit
                                </button>
                            </a>
                        </td>
                    	<td>
                            <a href="${pageContext.request.contextPath}/student/panelDelete?id=<%=temp.getId() %>&command=deleteStudentTable">
                                <button style="width:100%" class="btn btn-danger">
                                    <span class="glyphicon glyphicon-trash"></span>
                                    Delete
                                </button>
                            </a>
                        </td>
                    </tr>                  
                </table>
            </span>
            
            <%} %>
                </div>
            </div>
        </body>

        </html>