<%@ page import="javax.servlet.http.*,com.student.crm.entity.*" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>student-form</title>
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
    <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link href="${pageContext.request.contextPath}/resources/stylesheet/addStudentForm.css" rel="stylesheet">
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/images/logo.png" type="image/x-icon">
    <style>
        .error {
            color: red;
        }
       select{
  			text-indent: 6%;
		}
    </style>
</head>

<body>
        <% User owner = (User)request.getAttribute("owner"); %>
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
                            <li class="active">
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
    <div class="container-fluid addStudentOuter" >
        <div class="row">
            <div class="col-lg-4 col-md-4 col-xs-12 col-sm-12">
                <p align="center">
                    <img class="img-responsive studentAddImg"  width="70%" src="${pageContext.request.contextPath}/resources/images/addStudent.png">
                </p>
                <p class="error" align="center">
                        <% if(request.getAttribute("emailError")!=null){out.println(request.getAttribute("emailError"));}%>
                        <% if(request.getAttribute("rollError")!=null){out.println(request.getAttribute("rollError"));}%>
                        <% if(request.getAttribute("phoneError")!=null){out.println(request.getAttribute("phoneError"));}%>
                </p>
            </div>
            <div class="col-lg-8 col-md-8 col-xs-12 col-sm-12">
                <form:form method="POST" cssClass="form studentFormInput" action="addStudent" modelAttribute="student">
                    <form:hidden path="id"/>
                    <form:hidden path="userId" />
                    <span>
                        <span class="col-lg-12 col-md-12 col-xs-12 col-sm-12">
                            <span class="col-lg-4 col-md-4 col-xs-12 col-sm-12">
                                <label for="firstName">First name(<i class="fa fa-asterisk" style="font-size:10px;color:red"></i>) : </label>
                                <form:errors path="firstName" cssClass="error" />
                                <span class="input-group">
                                    <span class="input-group-addon"><i class="glyphicon glyphicon-tag"></i></span>
                                <form:input path="firstName" cssClass="form-control form-control-sm" placeholder="enter first name" />
                                </span>
                            </span>
                            <span class="col-lg-4 col-md-4 col-xs-12 col-sm-12">
                                <label for="lastName">Last name(<i class="fa fa-asterisk" style="font-size:10px;color:red"></i>) : </label>
                                <form:errors path="lastName" cssClass="error" />
                                <span class="input-group">
                                    <span class="input-group-addon"><i class="glyphicon glyphicon-tag"></i></span>
                                <form:input path="lastName" cssClass="form-control" placeholder="enter last name" />
                                </span>
                            </span>
                            <span class="col-lg-4 col-md-4 col-xs-12 col-sm-12">
                                    <label for="rollNo">Roll number(<i class="fa fa-asterisk" style="font-size:10px;color:red"></i>) : </label>
                                    <form:errors path="rollNo" cssClass="error" />
                                    <span class="input-group">
                                        <span class="input-group-addon"><i class="glyphicon glyphicon-tag"></i></span>
                                    <form:input path="rollNo" cssClass="form-control" placeholder="enter roll number" />
                                    </span>
                            </span>
                            <span class="col-lg-4 col-md-4 col-xs-12 col-sm-12">
                                    <label for="gender">Gender(<i class="fa fa-asterisk" style="font-size:10px;color:red"></i>) : </label>
                                    <form:errors path="gender" cssClass="error" />
                                    <span class="input-group">
                                        <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
                                    <form:select path="gender" cssClass="form-control">
                                    	 <form:option value="" label="------------------------"/>
                                         <form:option value="male" label="male"/>
                                         <form:option value="female" label="female"/>
                                    </form:select>
                                    </span>
                            </span>
                            <span class="col-lg-4 col-md-4 col-xs-12 col-sm-12">
                                    <label for="gender">Blood Group(<i class="fa fa-asterisk" style="font-size:10px;color:red"></i>) : </label>
                                    <form:errors path="bloodGroup" cssClass="error" />
                                    <span class="input-group">
                                        <span class="input-group-addon"><i class="glyphicon glyphicon-tint"></i></span>
                                    <form:select path="bloodGroup" cssClass="form-control">
                                    	 <form:option value="" label="------------------------"/>
                                         <form:option value="O+" label="O+"/>
                                         <form:option value="O-" label="O-"/>
                                         <form:option value="A+" label="A+"/>
                                         <form:option value="A-" label="A-"/>
                                         <form:option value="B+" label="B+"/>
                                         <form:option value="B-" label="B-"/>
                                         <form:option value="AB+" label="AB+"/>
                                         <form:option value="AB-" label="AB-"/>
                                    </form:select>
                                    </span>
                            </span>
                            <span class="col-lg-4 col-md-4 col-xs-12 col-sm-12">
                                    <label for="dateOfBirth">D.O.B(<i class="fa fa-asterisk" style="font-size:10px;color:red"></i>) : </label>
                                    <form:errors path="dateOfBirth" cssClass="error" />
                                    <span class="input-group">
                                        <span class="input-group-addon"><i class="glyphicon glyphicon-calendar"></i></span>
                                    <form:input path="dateOfBirth" cssClass="form-control" placeholder="enter D.O.B" />
                                    </span>
                            </span>
                            <span class="col-lg-4 col-md-4 col-xs-12 col-sm-12">
                                    <label for="gender">Department(<i class="fa fa-asterisk" style="font-size:10px;color:red"></i>) : </label>
                                    <form:errors path="department" cssClass="error" />
                                    <span class="input-group">
                                        <span class="input-group-addon"><i class="glyphicon glyphicon-education"></i></span>
                                    <form:select path="department" cssClass="form-control">
                                    	 <form:option value="" label="------------------------"/>
                                         <form:option value="CSE" label="CSE"/>
                                         <form:option value="IT" label="IT"/>
                                         <form:option value="EEE" label="EEE"/>
                                         <form:option value="ECE" label="ECE"/>
                                         <form:option value="EIE" label="EIE"/>
                                         <form:option value="ETE" label="ETE"/>
                                         <form:option value="CIVIL" label="CIVIL"/>
                                         <form:option value="MECHANICAL" label="MECHANICAL"/>
                                         <form:option value="AUTOMOBILE" label="AUTOMOBILE"/>
                                    </form:select>
                                    </span>
                            </span>
                            <span class="col-lg-4 col-md-4 col-xs-12 col-sm-12">
                                    <label for="gender">Current Year(<i class="fa fa-asterisk" style="font-size:10px;color:red"></i>) : </label>
                                    <form:errors path="currentYear" cssClass="error" />
                                    <span class="input-group">
                                        <span class="input-group-addon"><i class="glyphicon glyphicon-education"></i></span>
                                    <form:select path="currentYear" cssClass="form-control">
                                    	 <form:option value="" label="------------------------"/>
                                         <form:option value="I" label="I"/>
                                         <form:option value="II" label="II"/>
                                         <form:option value="III" label="III"/>
                                         <form:option value="IV" label="IV"/>
                                    </form:select>
                                    </span>
                            </span>
                            <span class="col-lg-4 col-md-4 col-xs-12 col-sm-12">
                                    <label for="gender">Current Semester(<i class="fa fa-asterisk" style="font-size:10px;color:red"></i>) : </label>
                                    <form:errors path="currentSemester" cssClass="error" />
                                    <span class="input-group">
                                        <span class="input-group-addon"><i class="glyphicon glyphicon-education"></i></span>
                                    <form:select path="currentSemester" cssClass="form-control">
                                    	 <form:option value="------------------------" label="------------------------"/>
                                         <form:option value="I" label="I"/>
                                         <form:option value="II" label="II"/>
                                         <form:option value="III" label="III"/>
                                         <form:option value="IV" label="IV"/>
                                         <form:option value="V" label="V"/>
                                         <form:option value="VI" label="VI"/>
                                         <form:option value="VII" label="VII"/>
                                         <form:option value="VIII" label="VIII"/>
                                    </form:select>
                                    </span>
                            </span>
                            <span class="col-lg-6 col-md-6 col-xs-12 col-sm-12">
                                    <label for="email">Email(<i class="fa fa-asterisk" style="font-size:10px;color:red"></i>) : </label>
                                    <form:errors path="email" cssClass="error" />
                                    <span class="input-group">
                                        <span class="input-group-addon"><i class="glyphicon glyphicon-send"></i></span>
                                    <form:input path="email" cssClass="form-control" placeholder="enter email" />
                                    </span>
                            </span>
                            <span class="col-lg-6 col-md-6 col-xs-12 col-sm-12">
                                    <label for="phoneNumber">Phone Number(<i class="fa fa-asterisk" style="font-size:10px;color:red"></i>) : </label>
                                    <form:errors path="phoneNumber" cssClass="error" />
                                    <span class="input-group">
                                        <span class="input-group-addon"><i class="glyphicon glyphicon-earphone"></i></span>
                                    <form:input path="phoneNumber" cssClass="form-control" placeholder="enter phone number" />
                                    </span>
                            </span>
                            <span class="col-lg-4 col-md-4 col-xs-12 col-sm-12">
                                    <label for="panCard">Pan Card number : </label>
                                    <form:errors path="panCard" cssClass="error" />
                                    <span class="input-group">
                                        <span class="input-group-addon"><i class="glyphicon glyphicon-adjust"></i></span>
                                    <form:input path="panCard" cssClass="form-control" placeholder="enter pancard number" />
                                    </span>
                            </span>
                            <span class="col-lg-4 col-md-4 col-xs-12 col-sm-12">
                                    <label for="accountNumber">Account number : </label>
                                    <form:errors path="accountNumber" cssClass="error" />
                                    <span class="input-group">
                                        <span class="input-group-addon"><i class="glyphicon glyphicon-adjust"></i></span>
                                    <form:input path="accountNumber" cssClass="form-control" placeholder="enter account number" />
                                    </span>
                            </span>
                            <span class="col-lg-4 col-md-4 col-xs-12 col-sm-12">
                                    <label for="ifsc">IFSC Code : </label>
                                    <form:errors path="ifsc" cssClass="error" />
                                    <span class="input-group">
                                        <span class="input-group-addon"><i class="glyphicon glyphicon-adjust"></i></span>
                                    <form:input path="ifsc" cssClass="form-control" placeholder="enter IFSC code" />
                                    </span>
                            </span>
                            <span class="col-lg-6 col-md-6 col-xs-12 col-sm-12">
                                    <label for="aadhar">Aadhar Number : </label>
                                    <form:errors path="aadhar" cssClass="error" />
                                    <span class="input-group">
                                        <span class="input-group-addon"><i class="glyphicon glyphicon-adjust"></i></span>
                                    <form:input path="aadhar" cssClass="form-control" placeholder="enter aadhar number" />
                                    </span>
                            </span>
                            <span class="col-lg-6 col-md-6 col-xs-12 col-sm-12">
                                    <label for="voteId">Vote Id : </label>
                                    <form:errors path="voteId" cssClass="error" />
                                    <span class="input-group">
                                        <span class="input-group-addon"><i class="glyphicon glyphicon-adjust"></i></span>
                                    <form:input path="voteId" cssClass="form-control" placeholder="enter vote id" />
                                    </span>
                            </span>
                            <span class="col-lg-3 col-md-3 col-xs-12 col-sm-12">
                                    <label for="parentName">Parent Name(<i class="fa fa-asterisk" style="font-size:10px;color:red"></i>) : </label>
                                    <form:errors path="parentName" cssClass="error" />
                                    <span class="input-group">
                                        <span class="input-group-addon"><i class="glyphicon glyphicon-adjust"></i></span>
                                    <form:input path="parentName" cssClass="form-control" placeholder="enter parent name" />
                                    </span>
                            </span>
                            <span class="col-lg-3 col-md-3 col-xs-12 col-sm-12">
                                    <label for="parentGender">Gender(<i class="fa fa-asterisk" style="font-size:10px;color:red"></i>) : </label>
                                    <form:errors path="parentGender" cssClass="error" />
                                    <span class="input-group">
                                        <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
                                    <form:select path="parentGender" cssClass="form-control">
                                    	 <form:option value="----------" label="----------"/>
                                         <form:option value="male" label="male"/>
                                         <form:option value="female" label="female"/>
                                    </form:select>
                                    </span>
                            </span>
                            <span class="col-lg-3 col-md-3 col-xs-12 col-sm-12">
                                    <label for="parentPhoneNumber">Phone Number(<i class="fa fa-asterisk" style="font-size:10px;color:red"></i>) : </label>
                                    <form:errors path="parentPhoneNumber" cssClass="error" />
                                    <span class="input-group">
                                        <span class="input-group-addon"><i class="glyphicon glyphicon-earphone"></i></span>
                                    <form:input path="parentPhoneNumber" cssClass="form-control" placeholder="enter phone number" />
                                    </span>
                            </span>
                            <span class="col-lg-3 col-md-3 col-xs-12 col-sm-12">
                                    <label for="pinCode">Pin Code(<i class="fa fa-asterisk" style="font-size:10px;color:red"></i>) : </label>
                                    <form:errors path="pinCode" cssClass="error" />
                                    <span class="input-group">
                                        <span class="input-group-addon"><i class="glyphicon glyphicon-pushpin"></i></span>
                                    <form:input path="pinCode" cssClass="form-control" placeholder="enter pin-code" />
                                    </span>
                            </span>
                            <span class="col-lg-12 col-md-12 col-xs-12 col-sm-12">
                                    <label for="address">Address(<i class="fa fa-asterisk" style="font-size:10px;color:red"></i>) : </label>
                                    <form:errors path="address" cssClass="error" />
                                    <span class="input-group">
                                        <span class="input-group-addon"><i class="fa fa-address-card-o"></i></span>
                                    <form:textarea rows="3" path="address" cssClass="form-control" placeholder="enter address" />
                                    </span>
                            </span>
                        </span>
                    </span>
                    <p align="center"><input style="width:30%;color:white" class="btn btn-info btn-md addStudentButton" type="submit" value="Add Student"></p>
                </form:form>
            </div>
        </div>
    </div>
    <script type="text/javascript">
        document.getElementById("dateOfBirth").type = "date";
    </script>
</body>

</html>