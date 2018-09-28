<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page import="javax.servlet.http.*,com.student.crm.entity.*" %>
    <!DOCTYPE html>
    <html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <title>Home page</title>
        <link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/images/logo.png" type="image/x-icon">
        <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
        <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
        <link href="${pageContext.request.contextPath}/resources/stylesheet/home.css" rel="stylesheet">
        <style>
			.error {
				color: red;
			}
		</style>
    </head>

    <body>
        <% User owner = (User)request.getAttribute("owner"); %>
                <nav class="navbar navbar-inverse">
                    <div class="container-fluid">
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
                                <li class="active">
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
                                <li>
                                    <a href="${pageContext.request.contextPath}/student/home">
                                        <span class="glyphicon glyphicon-user"></span>
                                        Hello, <%=owner.getUsername() %>
                                    </a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </nav>
                <div class="container">
                    <div class="row">
                    	<div class="col-lg-3 col-md-3 col-sm-12 col-xs-12">
                        </div>
                        <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12 userDetails">
                        	<form:form cssClass="form" modelAttribute="login" method="post" action="processReset">
                        	<form:hidden path="id" />
                        	<form:hidden path="firstName"/>
                        	<form:hidden path="lastName"/>
                        	<form:hidden path="email"/>
                        	<form:hidden path="dateOfBirth"/>
                        	<form:hidden path="username"/>
                        	<form:hidden path="validate"/>
                        	<form:hidden path="forgetPassword"/>
                            <table class="col-lg-12 col-md-12 col-sm-12 col-xs-12 table">
                                <tr>
                                    <td colspan="2">
                                        <p align="center">
                                        	<img id="userImg" style="width:200px;" class="img-responsive" src="${pageContext.request.contextPath}/resources/images/userPic.png" />
                                        </p>
                                        <p align="center" style="color:red;">
                                            <% if(request.getAttribute("passError")!=null){out.println(request.getAttribute("passError"));}%>
                                        </p>
                                    </td>
                                </tr>
                            </table>
                            <span class="col-lg-2 col-md-2 col-sm-12 col-xs-12"></span>
                            <span class="col-lg-8 col-md-8 col-sm-12 col-xs-12">
                            <label for="currentPassword">Enter Current Password : </label><br>
								<span class="input-group">
									<span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
									<input type="password" id="currentPassword" name="currentPassword" class="form-control" placeholder="enter current password" required/>
								</span>
                            <label for="password">Enter New Password :</label>
                            	<form:errors path="password" cssClass="error" />
								<span class="input-group">
									<span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
									<form:password path="password" cssClass="form-control" placeholder="enter new password" required="required"/>
								</span>
                            <label for="reEnterPassword">Re-Enter Password : </label><br>
								<form:errors path="password" cssClass="error" />
								<span class="input-group">
									<span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
									<input type="password" id="reEnterPassword" name="rePassword" class="form-control" placeholder="re-enter password" required/>
								</span>
							<span class="col-lg-12 col-md-12 col-sm-12 col-xs-12"><br></span>
							<span class="col-lg-2 col-md-2 col-sm-2 col-xs-2"></span>
							<span class="col-lg-8 col-md-8 col-sm-8 col-xs-8">
								<input style="width:100%" type="submit" class="btn btn-sm btn-success" value="Reset" />
							</span>
							<span class="col-lg-2 col-md-2 col-sm-2 col-xs-2"></span>
							<span class="col-lg-12 col-md-12 col-sm-12 col-xs-12"><br></span>
                            </span>
                            <span class="col-lg-2 col-md-2 col-sm-12 col-xs-12"></span>
                            </form:form>
                        </div>
                        <div class="col-lg-3 col-md-3 col-sm-12 col-xs-12">
                        </div>
                    </div>
                </div>
    </body>

    </html>