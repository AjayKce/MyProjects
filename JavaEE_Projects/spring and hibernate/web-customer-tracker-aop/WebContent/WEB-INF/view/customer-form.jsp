<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
	<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css"> 
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>  
	<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
	<style>
		.error{
		color:red;
		}
	</style>
</head>
<body>
<div class="container-fluid">
	<h1 align="center" class="jumbotron col-lg-12 col-md-12 col-sm-12 col-xs-12" >CUSTOMER CRM</h1>
	<div class="col-lg-4 col-md-4 col-sm-4 col-xs-4"></div>
	<div class="col-lg-4 col-md-4 col-sm-4 col-xs-4">
		<a href="list">
			<button class="btn btn-success btn-lg col-lg-12 col-md-12 col-sm-12 col-xs-12" align="right">
				View Customers
			</button>
		</a>
	</div>
	<div class="col-lg-4 col-md-4 col-sm-4 col-xs-4"></div>
	<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12"></div>
	<div class="col-lg-4 col-md-4 col-sm-4 col-xs-4"></div>
	<div class="col-lg-4 col-md-4 col-sm-4 col-xs-4">
		<br>
		<form:form method="POST" action="saveCustomer" modelAttribute="customer">
			<form:hidden path="id"/>
			<label for="firstName">First Name : </label>
			<form:errors path="firstName" cssClass="error"/>
			<form:input path="firstName" cssClass="form-control" placeholder="Enter First Name"/>
			<br>
			<label for="lastName">Last Name : </label>
			<form:errors path="lastName" cssClass="error"/>
			<form:input path="lastName" cssClass="form-control" placeholder="Enter Last Name"/>
			<br>
			<label for="email">Email : </label>
			<form:errors path="email"  cssClass="error"/>
			<form:input path="email" cssClass="form-control" placeholder="Enter Email"/>
			<br>
			<input class="btn btn-success" type="submit" value="ADD">
		</form:form>
	</div>
	<div class="col-lg-4 col-md-4 col-sm-4 col-xs-4"></div>
</div>
</body>
</html>