<%@ page import="javax.servlet.http.*,com.student.crm.entity.*,java.util.*" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>panel view</title>
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
    <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link href="${pageContext.request.contextPath}/resources/stylesheet/panelView.css" rel="stylesheet">
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/images/logo.png" type="image/x-icon">
    <% User owner = (User)request.getAttribute("owner"); %>
    <%List<Student> students =(List<Student>)request.getAttribute("students"); %>
    <script>
        $(document).ready(function(){
        	<%for(Student temp:students){ %>
            $(".first<%=temp.getId()%>").click(function(){
                $("#first<%=temp.getId()%>").show();
                $("#second<%=temp.getId()%>").hide();
                $("#third<%=temp.getId()%>").hide();
                $("#fourth<%=temp.getId()%>").hide();
            });
            $(".second<%=temp.getId()%>").click(function(){
                $("#first<%=temp.getId()%>").hide();
                $("#second<%=temp.getId()%>").show();
                $("#third<%=temp.getId()%>").hide();
                $("#fourth<%=temp.getId()%>").hide();
            });
            $(".third<%=temp.getId()%>").click(function(){
                $("#first<%=temp.getId()%>").hide();
                $("#second<%=temp.getId()%>").hide();
                $("#third<%=temp.getId()%>").show();
                $("#fourth<%=temp.getId()%>").hide();
            });
            $(".fourth<%=temp.getId()%>").click(function(){
                $("#first<%=temp.getId()%>").hide();
                $("#second<%=temp.getId()%>").hide();
                $("#third<%=temp.getId()%>").hide();
                $("#fourth<%=temp.getId()%>").show();
            });
            <%}%>
        });
    </script>
</head>

<body>
        <nav class="navbar navbar-inverse navbar-fixed-top">
                <div class="container-fluid" >
                    <div class="navbar-header">
                        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
                          <span class="icon-bar"></span>
                          <span class="icon-bar"></span>
                          <span class="icon-bar"></span>
                        </button>
                        <a class="navbar-brand" href="">CRM</a>
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
                            <li class="active"> 
                                <a href="${pageContext.request.contextPath}/student/showStudentPanelView">
                                    <span class="glyphicon glyphicon-blackboard"></span>
                                View Panel
                                </a>
                            </li>
                            <li>
                                <a href="${pageContext.request.contextPath}/student/showStudentTableView">
                                    <span class="glyphicon glyphicon-list-alt"></span>
                                    View Table
                                </a>
                            </li>
                        </ul>
                        <ul class="nav navbar-nav navbar-right">
                            <li><a href="${pageContext.request.contextPath}/student/home">Hello, <%=owner.getUsername() %></a></li>
                        </ul>
                    </div>
                </div>
            </nav>
    <div class="container-fluid panelViewOuter" >
        <div class="row">
        <%for(Student temp:students){ %>
            <div class="col-lg-4 col-md-4 col-xs-12 col-sm-12 gridOuter">
                <div class="grid col-lg-12 col-md-12 col-xs-12 col-sm-12">
                    <span  class="col-lg-12 col-md-12 col-sm-12 col-xs-12 header">
                        <span class="col-lg-4 col-md-4 col-sm-4 col-xs-4"></span>
                        <h4 class="col-lg-4 col-md-4 col-sm-4 col-xs-4" id="rollNo"><%=temp.getRollNo() %></h4>
                        <span class="col-lg-4 col-md-4 col-sm-4 col-xs-4"></span>
                    </span>
                    <span class="col-lg-6 col-md-6 col-sm-6 col-xs-6">
                    <h4 class="col-lg-6 col-md-6 col-sm-6 col-xs-6" id="firstName"><%=temp.getFirstName() %></h4>
                    </span>
                    <span class="col-lg-6 col-md-6 col-sm-6 col-xs-6">
                    <h4 class="col-lg-6 col-md-6 col-sm-6 col-xs-6" id="lastName"><%=temp.getLastName() %></h4>
                    </span>
                <span id="first<%=temp.getId() %>">
                    <span class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <h5 id="gender">
                            <b class="col-lg-6 col-md-6 col-sm-6 col-xs-6">Student Gender : </b>
                            <i class="col-lg-6 col-md-6 col-sm-6 col-xs-6"><%=temp.getGender() %></i>
                        </h5>
                    </span>
                    <span class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <h5 id="bloodGroup">
                            <b class="col-lg-6 col-md-6 col-sm-6 col-xs-6">Blood Group : </b>
                            <i class="col-lg-6 col-md-6 col-sm-6 col-xs-6"><%=temp.getBloodGroup() %></i>
                        </h5>
                    </span>
                    <span class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <h5 id="department">
                            <b class="col-lg-6 col-md-6 col-sm-6 col-xs-6">Department : </b>
                            <i class="col-lg-6 col-md-6 col-sm-6 col-xs-6"><%=temp.getDepartment() %></i>
                        </h5>
                    </span>
                    <span class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <h5 id="currentYear">
                                <b class="col-lg-6 col-md-6 col-sm-6 col-xs-6">Current Year : </b>
                                <i class="col-lg-6 col-md-6 col-sm-6 col-xs-6"><%=temp.getCurrentYear() %></i>
                        </h5>
                    </span>
                    <span class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <h5 id="currentSemester">
                                <b class="col-lg-6 col-md-6 col-sm-6 col-xs-6">Semester : </b>
                                <i class="col-lg-6 col-md-6 col-sm-6 col-xs-6"><%=temp.getCurrentSemester() %></i>
                        </h5>
                    </span>
                </span>
                <span id="second<%=temp.getId()%>" class="collapse">
                    <span class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <h5 id="email">
                                <b class="col-lg-3 col-md-3 col-sm-3 col-xs-3">Email : </b>
                                <i class="col-lg-9 col-md-9 col-sm-9 col-xs-9"><%=temp.getEmail() %></i>
                        </h5>
                    </span>
                    <span class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <h5 id="phoneNumber">
                                <b class="col-lg-6 col-md-6 col-sm-6 col-xs-6">Phone : </b>
                                <i class="col-lg-6 col-md-6 col-sm-6 col-xs-6"><%=temp.getPhoneNumber() %></i>
                        </h5>
                    </span>
                     <span class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <h5 id="dateOfBirth">
                                <b class="col-lg-6 col-md-6 col-sm-6 col-xs-6">Birth Date : </b>
                                <i class="col-lg-6 col-md-6 col-sm-6 col-xs-6"><% 
                                    String str = temp.getDateOfBirth();
                                    String year = str.substring(0, 4);
                                    String month = str.substring(5, 7);
                                    String date = str.substring(8, 10);
                                    String dob=date+"-"+month+"-"+year;
                                    out.println(dob);
                                    %></i>
                        </h5>
                     </span>
                    <span class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <h5 id="panCard">
                            <b class="col-lg-6 col-md-6 col-sm-6 col-xs-6">Pan Number :</b>
                            <i class="col-lg-6 col-md-6 col-sm-6 col-xs-6"><%
                            if(temp.getPanCard()!=null){
                            	out.println(temp.getPanCard());                            	
                            }
                            %></i>
                        </h5>
                    </span>
                    <span class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <h5 id="accountNumber">
                            <b class="col-lg-6 col-md-6 col-sm-6 col-xs-6">Account Number :</b>
                            <i class="col-lg-6 col-md-6 col-sm-6 col-xs-6"><%
                            if(temp.getAccountNumber()!=null){
                            	out.println(temp.getAccountNumber());                            	
                            }
                            %></i>
                        </h5>
                    </span>
                </span>
                <span id="third<%=temp.getId()%>" class="collapse">
                    <span class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <h5 id="ifsc">
                            <b class="col-lg-4 col-md-4 col-sm-4 col-xs-4">IFSC :</b>
                            <i class="col-lg-8 col-md-8 col-sm-8 col-xs-8"><%
                            if(temp.getIfsc()!=null){
                            	out.println(temp.getIfsc());                            	
                            }
                            %></i>
                        </h5>
                    </span>
                    <span class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <h5 id="aadhar">
                            <b class="col-lg-6 col-md-6 col-sm-6 col-xs-6">Aadhar Number :</b>
                            <i class="col-lg-6 col-md-6 col-sm-6 col-xs-6"><%
                            if(temp.getAadhar()!=null){
                            	out.println(temp.getAadhar());                            	
                            }
                            %></i>
                        </h5>
                    </span>
                    <span class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <h5 id="voteId">
                            <b class="col-lg-6 col-md-6 col-sm-6 col-xs-6">Voter Id :</b>
                            <i class="col-lg-6 col-md-6 col-sm-6 col-xs-6"><%
                            if(temp.getVoteId()!=null){
                            	out.println(temp.getVoteId());                            	
                            }
                            %></i>
                        </h5>
                    </span>
                    <span class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <h5 id="parentName">
                            <b class="col-lg-6 col-md-6 col-sm-6 col-xs-6">Parent Name :</b>
                            <i class="col-lg-6 col-md-6 col-sm-6 col-xs-6"><%=temp.getParentName() %></i>
                        </h5>
                    </span>
                    <span class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <h5 id="parentGender">
                            <b class="col-lg-6 col-md-6 col-sm-6 col-xs-6">Parent Gender :</b>
                            <i class="col-lg-6 col-md-6 col-sm-6 col-xs-6"><%=temp.getParentGender() %></i>
                        </h5>
                    </span>
                </span>
                <span id="fourth<%=temp.getId()%>" class="collapse">
                    <span class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <h5 id="parentPhoneNumber">
                            <b class="col-lg-6 col-md-6 col-sm-6 col-xs-6">Parent Phone :</b>
                            <i class="col-lg-6 col-md-6 col-sm-6 col-xs-6"><%=temp.getParentPhoneNumber() %></i>
                        </h5>
                    </span>
                    <span class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <h5 id="pinCode">
                            <b class="col-lg-6 col-md-6 col-sm-6 col-xs-6">Pin Code :</b>
                            <i class="col-lg-6 col-md-6 col-sm-6 col-xs-6"><%=temp.getPinCode() %></i>
                        </h5>
                    </span>
                    <span class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <h5 id="address">
                            <b class="col-lg-12 col-md-12 col-sm-12 col-xs-12">Address :-</b>
                            <span class="col-lg-12 col-md-12 col-sm-12 col-xs-12"><br></span>
                            <i class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                            <textarea disabled rows="2"><%=temp.getAddress() %></textarea>
                            </i>
                        </h5>
                    </span>
                </span>
                <span class="col-lg-2 col-md-2 col-sm-2 col-xs-2"></span>
                <span class="col-lg-8 col-md-8 col-sm-8 col-xs-8">
                        <center>
                        <ul class="pagination pagination-md">
                                <li class="first<%=temp.getId() %> active"><a data-toggle="pill" href="#">1</a></li>
                                <li class="second<%=temp.getId() %>"><a data-toggle="pill" href="#">2</a></li>
                                <li class="third<%=temp.getId() %>"><a data-toggle="pill" href="#">3</a></li>
                                <li class="fourth<%=temp.getId() %>"><a data-toggle="pill" href="#">4</a></li>
                        </ul>
                        </center>
                </span>
                <span class="col-lg-2 col-md-2 col-sm-2 col-xs-2"></span>
                <span class="col-lg-6 col-md-6 col-sm-6 col-xs-6">
                    <center>
                    <a href="${pageContext.request.contextPath}/student/panelUpdate?id=<%=temp.getId() %>&command=updateStudent">
                        <button class="btn btn-primary">
                        <span class="glyphicon glyphicon-edit"></span>
                            Edit
                        </button>
                    </a>
                    </center>
                </span>
                <span class="col-lg-6 col-md-6 col-sm-6 col-xs-6">
                    <center>
                        <a href="${pageContext.request.contextPath}/student/panelDelete?id=<%=temp.getId() %>&command=deleteStudent">
                            <button class="btn btn-danger">
                            <span class="glyphicon glyphicon-trash"></span>
                                Delete
                            </button>
                        </a>
                    </center>
                </span>
            </div>
            </div>
            <%} %>
        </div>
    </div>
</body>

</html>