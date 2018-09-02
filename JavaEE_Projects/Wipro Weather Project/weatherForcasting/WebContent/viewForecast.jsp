<html>
<head>
	<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css"> 
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>  
	<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
	<style type="text/css">
	label{
	color:white;
	font-weight:bolder;
	text-shadow:1px 1px black,-1px 1px black,1px -1px black,-1px -1px black;
	}
	input:focus{
	font-weight:bolder;
	}
	
	}
	</style> 
</head>
<body>
	<div class="col-lg-4 col-md-4 col-sm-4 col-xs-12"></div>
	<div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
		<br><br>
		<form action="MainServlet" method="post" class="form">
			<label for="location">Location : </label>
			<input class="form-control" type="text" name="slocation" id="location" placeholder="Enter Location" required><br>
			<label for="date">Date : </label>
			<input class="form-control" type="date" name="sdate" id="date" required>
			<input type="hidden" name="command" value="VIEW"/><br/>
			<center><input class="btn btn-info" type="submit" value="ADD"></center>
		</form>
	</div>
	<div class="col-lg-4 col-md-4 col-sm-4 col-xs-12"></div>
</body>
</html>