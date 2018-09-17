<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
	<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css"> 
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>  
	<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
	<style type="text/css">
	 th,td{
	 text-align:center;
	 }
	</style>
</head>
<body>
<div class="container-fluid">
	<h1 align="center" class="jumbotron col-lg-12 col-md-12 col-sm-12 col-xs-12" >CUSTOMER CRM</h1>
	<a class="col-lg-4 col-md-4 col-sm-4 col-xs-4"></a>
	<a href="showFormForAdd">
		<button class="btn btn-success btn-lg col-lg-4 col-md-4 col-sm-4 col-xs-4" align="right">
			Add Customer
		</button>
	</a>
	<a class="col-lg-4 col-md-4 col-sm-4 col-xs-4"></a>
	<table class="table table-stripped table-hover table-responsive"><br>
		<thead><th>First name</th><th>Last name</th><th>Email</th><th colspan="2">Action</th></thead>
		<c:forEach var="temp" items="${customers}">
			<c:url var="updateLink" value="/customer/showFormForUpdate">
				<c:param name="customerId" value="${temp.id}" />
			</c:url>
			<c:url var="deleteLink" value="/customer/deleteCustomer">
				<c:param name="customerId" value="${temp.id}" />
			</c:url>
			<tr>
			   <td>${temp.firstName}</td>
			   <td>${temp.lastName}</td>
			   <td>${temp.email}</td>
			   <td><a href="${updateLink}" class="btn btn-primary">update</a></td>
			   <td><a href="${deleteLink}" class="btn btn-danger">Delete</a></td>
			</tr>
		</c:forEach>
	</table>
</div>

</body>


</html>