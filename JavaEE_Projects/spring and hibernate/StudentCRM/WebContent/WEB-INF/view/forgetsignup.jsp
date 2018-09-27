<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
	<!DOCTYPE html>
	<html lang="en">

	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<meta http-equiv="X-UA-Compatible" content="ie=edge">
		<title>Reset password</title>
		<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
		<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
		<link href="${pageContext.request.contextPath}/resources/stylesheet/signup.css" rel="stylesheet">
		<link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/images/logo.png" type="image/x-icon">
		<style>
			.error {
				color: red;
			}
		</style>
		<script>
		$(document).ready(function(){ 
        $(".read").attr("readonly","readonly"); 
		});
</script>
	</head>

	<body>
		<div class="container-fluid">
			<div class="row">
				<div class="col-lg-8 col-md-8 col-xs-12 col-sm-12">
					<nav class="navbar navbar-inverse">
						<div class="container-fluid">
							<div class="navbar-header">
								<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
									  <span class="icon-bar"></span>
									  <span class="icon-bar"></span>
									  <span class="icon-bar"></span>
									</button>
								<a class="navbar-brand" href="#">CRM</a>
							</div>
							<div class="collapse navbar-collapse" id="myNavbar">
								<ul class="nav navbar-nav">
									<li class="active"><a href="#">Home</a></li>
								</ul>
								<ul class="nav navbar-nav navbar-right">
									<li><a href="login"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
								</ul>
							</div>
						</div>
					</nav>
					<p align="center">
						<img class="img-responsive" width="50%" style="" src="${pageContext.request.contextPath}/resources/images/sign.png">
					</p>
				</div>
				<div class="col-lg-4 col-md-4 col-xs-12 col-sm-12">
					<h3 align="center" class="signUpHeader">Sign-up</h3>
					<p class="error" align="center">
						<% if(request.getAttribute("passError")!=null){out.println(request.getAttribute("passError"));}%>
					</p>
					<form:form method="post" cssClass="form signUpForm" action="setPasswordStudent" modelAttribute="login">
						<br>
						<form:hidden path="id"/>
						<span>
							<span class="col-lg-12 col-md-12 col-xs-12 col-sm-12">
								<span class="col-lg-6 col-md-6 col-xs-12 col-sm-12">
									<label for="firstName">First name : </label><br>
									<form:errors path="firstName" cssClass="error" />
									<span class="input-group">
										<span class="input-group-addon"><i class="glyphicon glyphicon-tag"></i></span>
									<form:input path="firstName" cssClass="form-control form-control-sm read" placeholder="enter first name" />
									</span>
								</span>
								<span class="col-lg-6 col-md-6 col-xs-12 col-sm-12">
									<label for="lastName">Last name : </label><br>
									<form:errors path="lastName" cssClass="error" />
									<span class="input-group">
										<span class="input-group-addon"><i class="glyphicon glyphicon-tag"></i></span>
									<form:input path="lastName" cssClass="form-control read" placeholder="enter last name" />
									</span>
								</span>
							</span>
							<span class="col-lg-12 col-md-12 col-xs-12 col-sm-12">
								<span class="col-lg-12 col-md-12 col-xs-12 col-sm-12">
									<label for="email">Email : </label>
									<form:errors path="email" cssClass="error" />
									<span class="input-group">
										<span class="input-group-addon"><i class="glyphicon glyphicon-envelope"></i></span>
									<form:input path="email" cssClass="form-control read" placeholder="enter email" />
									</span>
								</span>
							</span>
							<span class="col-lg-12 col-md-12 col-xs-12 col-sm-12">
									<span class="col-lg-12 col-md-12 col-xs-12 col-sm-12">
											<label for="dateOfBirth">D.O.B : </label>
											<form:errors path="dateOfBirth" cssClass="error" />
											<span class="input-group " >
												<span class="input-group-addon"><i class="glyphicon glyphicon-calendar"></i></span>
											<form:input path="dateOfBirth" cssClass="form-control read" placeholder="enter date of birth" />
											</span>
										</span>
							</span>
							<span class="col-lg-12 col-md-12 col-xs-12 col-sm-12">
								<span class="col-lg-12 col-md-12 col-xs-12 col-sm-12">
									<label for="username">Username : </label>
									<form:errors path="username" cssClass="error" />
									<span class="input-group">
										<span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
									<form:input path="username" cssClass="form-control read" placeholder="enter username" />
									</span>
								</span>
							</span>
							<span class="col-lg-12 col-md-12 col-xs-12 col-sm-12">
								<span class="col-lg-6 col-md-6 col-xs-12 col-sm-12">
									<label for="password">Password : </label><br>
									<form:errors path="password" cssClass="error" />
									<span class="input-group">
										<span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
									<form:password path="password" cssClass="form-control" placeholder="enter password" />
									</span>
								</span>
								<span class="col-lg-6 col-md-6 col-xs-12 col-sm-12">
									<label for="reEnterPassword">Re-Enter Password : </label><br>
									<form:errors path="password" cssClass="error" />
									<span class="input-group">
										<span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
									<input type="password" id="reEnterPassword" name="rePassWord" class="form-control" placeholder="re-enter password" />
									</span>
								</span>
							</span>
						</span>
						<span class="col-lg-12 col-md-12 col-xs-12 col-sm-12"><br></span>
						<p align="center"><input class="btn btn-info btn-md" type="submit" value="Register"></p>
						<br>
					</form:form>
				</div>
			</div>
		</div>
		<script type="text/javascript">
			document.getElementById("dateOfBirth").type = "date";
		</script>
	</body>

	</html>