<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
	<!DOCTYPE html>
	<html lang="en">

	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<meta http-equiv="X-UA-Compatible" content="ie=edge">
		<title>signup-success-form</title>
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
	</head>

	<body>
		<div class="container-fluid">
			<div class="row">
				<div class="col-lg-12 col-md-12 col-xs-12 col-sm-12">
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
				</div>
				<div class="col-lg-4 col-md-4 col-xs-12 col-sm-12"></div>
				<div class="col-lg-4 col-md-4 col-xs-12 col-sm-12">
					<p align="center">
					<img class="img-responsive" src="${pageContext.request.contextPath}/resources/images/logo.png">
					</p>
					<h3 align="center">You have successfully Registered</h3>
					<span class="col-lg-4 col-md-4 col-xs-4 col-sm-4"></span>
					<span class="col-lg-4 col-md-4 col-xs-4 col-sm-4">
						<a href="https://mail.google.com/mail"><button style="width:100%" class="btn btn-success">Verify</button></a>
					</span>
					<span class="col-lg-4 col-md-4 col-xs-4 col-sm-4"></span>
				</div>
				<div class="col-lg-4 col-md-4 col-xs-12 col-sm-12"></div>
			</div>
		</div>
	</body>

	</html>