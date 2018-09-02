<html>
<head>
	<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css"> 
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>  
	<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
	<style type="text/css">
	h1{
	color:white;
	font-weight:bolder;
	text-shadow:1px 2px 2px blue,-1px 2px 2px blue,1px -2px 2px blue,-1px -2px 2px blue;
	}
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
	<h1 align="center">Enter weather forecasting details</h1>
	<div class="col-lg-4 col-md-4 col-sm-4 col-xs-12"></div>
	<div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
		<form action="MainServlet" method="get" class="form">
					<label for="location">Location : </label>
					<input class="form-control" type="text" name="location" id="location" placeholder="Enter Location" required><br>
					<label for="date">Date : </label>
					<input class="form-control" type="date" name="date" id="date" required><br>
					<label for="temperature">Temperature : </label>
					<input class="form-control" type="number" name="temperature" id="temperature" placeholder="Enter Temperature" required><br>
					<label for="humidity">Humidity : </label>
					<input class="form-control" type="number" name="humidity" id="humidity" placeholder="Enter Humidity" required><br>
					<label for="wind">Wind : </label>
					<input class="form-control" type="text" name="wind" id="wind" placeholder="Enter Wind Details" required><br>
					<label for="forecast">Forecast : </label></td>
					<input class="form-control" type="text" name="forecast" id="forecast" placeholder="Enter Forecast Details" required><br>
					<input type="hidden" name="command" value="ADD"/>
					<center><input class="btn btn-info" type="submit" value="ADD"></center>
		</form>
	</div>
	<div class="col-lg-4 col-md-4 col-sm-4 col-xs-12"></div>
</body>
</html>