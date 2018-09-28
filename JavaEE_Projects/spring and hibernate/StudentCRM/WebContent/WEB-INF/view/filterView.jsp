<%@ page import="javax.servlet.http.*,com.student.crm.entity.*,java.util.*" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>filter view</title>
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
    <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link href="${pageContext.request.contextPath}/resources/stylesheet/filterView.css" rel="stylesheet">
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/images/logo.png" type="image/x-icon">
    <style>
       select{
  			text-indent:10%;
		}
    </style>
    <script>
            $(document).ready(function(){
               $("#rollNumber").focus(function(){
                $(".rollDrop").css("display","none");
               });
               $("#gender").focus(function(){
                $(".genderDrop").css("display","none");
               });
               $("#bloodGroup").focus(function(){
                $(".bloodDrop").css("display","none");
               });
               $("#view").focus(function(){
                $(".viewDrop").css("display","none");
               });
            });
    </script>
</head>

<body>
        <% User owner = (User)request.getAttribute("owner"); %>
        <%List<Student> students =(List<Student>)request.getAttribute("students"); %>
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
                            <li class="active">
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
            <span class="col-lg-12 col-md-12 col-xs-0 col-sm-0 break"><br><br><br><br></span>
            <div class="col-lg-4 col-md-4 col-xs-12 col-sm-12">
                <p align="center">
                    <img class="img-responsive studentAddImg"  width="70%" src="${pageContext.request.contextPath}/resources/images/filterStudent.png">
                </p>
            </div>
            <div class="col-lg-8 col-md-8 col-xs-12 col-sm-12">
                <form action="filterUser" method="post" class="form">
                    <span class="col-lg-3 col-md-3 col-xs-0 col-sm-0"></span>
                    <span class="col-lg-6 col-md-6 col-xs-12 col-sm-12 filterOuter">
                    <table class="table col-lg-12 col-md-12 col-xs-12 col-sm-12">
                        <tr>
                            <td colspan="2" class="col-lg-12 col-md-12 col-xs-12 col-sm-12">
                                <label for="rollNumber">Roll Number :</label>
                                <span style="width:100%" class="input-group">
                                <span class="input-group-addon"><i class="glyphicon glyphicon-tag"></i></span>
                                <select class="form-control" id="rollNumber" name="rollNumber">
                                    <option class="rollDrop"></option>
                                    <%for(Student temp:students){ %>
                                    <option value="<%=temp.getRollNo() %>"><%=temp.getRollNo() %></option>
                                    <%} %>
                                </select>
                                </span>
                            </td>
                        </tr>
                        <tr>
                            <td class="col-lg-6 col-md-6 col-xs-6 col-sm-6">
                                <label for="gender">Gender :</label>
                                <span class="input-group">
                                <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
                                <select class="form-control" id="gender" name="gender">
                                    <option class="genderDrop"></option>
                                    <option value="male">male</option>
                                    <option value="female">female</option>
                                </select>
                                </span>
                            </td>
                            <td class="col-lg-6 col-md-6 col-xs-6 col-sm-6">
                                <label for="bloodGroup">Blood Group:</label>
                                <span class="input-group">
                                <span class="input-group-addon"><i class="glyphicon glyphicon-tint"></i></span>
                                <select class="form-control" id="bloodGroup" name="bloodGroup">
                                    <option class="bloodDrop"></option>
                                    <option value="O+">O+</option>
                                    <option value="O-">O-</option>
                                    <option value="A+">A+</option>
                                    <option value="A-">A-</option>
                                    <option value="B+">B+</option>
                                    <option value="B-">B-</option>
                                    <option value="AB+">AB+</option>
                                    <option value="AB-">AB-</option>
                                </select>
                                </span>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2" class="col-lg-12 col-md-12 col-xs-12 col-sm-12">
                                <label for="department">Department :</label>
                                <span style="width:100%" class="input-group">
                                <span class="input-group-addon"><i class="glyphicon glyphicon-education"></i></span>
                                <select class="form-control" id="department" name="department">
                                    <option class="departmentDrop"></option>
                                    <option value="CSE">CSE</option>
                                    <option value="IT">IT</option>
                                    <option value="EEE">EEE</option>
                                    <option value="ECE">ECE</option>
                                    <option value="EIE">EIE</option>
                                    <option value="ETE">ETE</option>
                                    <option value="CIVIL">CIVIL</option>
                                    <option value="MECHANICAL">MECHANICAL</option>
                                    <option value="AUTOMOBILE">AUTOMOBILE</option>
                                </select>
                                </span>
                            </td>
                        </tr>
                        <tr>
                            <td class="col-lg-6 col-md-6 col-xs-6 col-sm-6">
                                <label for="year">Year :</label>
                                <span class="input-group">
                                <span class="input-group-addon"><i class="glyphicon glyphicon-education"></i></span>
                                <select class="form-control" id="year" name="year">
                                    <option class="yearDrop"></option>
                                    <option value="I">I</option>
                                    <option value="II">II</option>
                                    <option value="III">III</option>
                                    <option value="IV">IV</option>
                                </select>
                                </span>
                            </td>
                            <td class="col-lg-6 col-md-6 col-xs-6 col-sm-6">
                                <label for="semester">Semester :</label>
                                <span class="input-group">
                                <span class="input-group-addon"><i class="glyphicon glyphicon-education"></i></span>
                                <select class="form-control" id="semester" name="semester">
                                    <option class="semesterDrop"></option>
                                    <option value="I">I</option>
                                    <option value="II">II</option>
                                    <option value="III">III</option>
                                    <option value="IV">IV</option>
                                    <option value="V">V</option>
                                    <option value="VI">VI</option>
                                    <option value="VII">VII</option>
                                    <option value="VIII">VIII</option>
                                </select>
                                </span>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2" class="col-lg-12 col-md-12 col-xs-12 col-sm-12">
                                <label for="view">View :</label>
                                <span style="width:100%" class="input-group">
                                <span class="input-group-addon"><i class="fa fa-desktop"></i></span>
                                <select class="form-control" id="view" name="view" required>
                                    <option class="viewDrop"></option>
                                    <option value="PANEL">PANEL VIEW</option>
                                    <option value="TABLE">TABLE VIEW</option>
                                </select>
                                </span>
                            </td>
                        </tr>
                    </table>
                    <span class="col-lg-4 col-md-4 col-xs-4 col-sm-4"></span>
                    <span class="col-lg-4 col-md-4 col-xs-4 col-sm-4">
                        <input style="width:100%" type="submit" class="btn btn-success" value="Filter">
                    </span>
                    <span class="col-lg-4 col-md-4 col-xs-4 col-sm-4"></span>
                    <span class="col-lg-12 col-md-12 col-xs-12 col-sm-12"><br></span>
                    </span>
                    <span class="col-lg-3 col-md-3 col-xs-0 col-sm-0"></span>
                </form>
            </div>
        </div>
    </div>
    <script type="text/javascript">
        document.getElementById("dateOfBirth").type = "date";
    </script>
</body>

</html>