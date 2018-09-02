<%@ page import="com.wipro.weather.bean.WeatherBean" %>
<html>
<head>
	<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css"> 
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>  
	<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
</head>
<body>
<br><br>
<div class="table-responsive">  
	<table class="table table-striped table-bordered">
	<%
		WeatherBean view = (WeatherBean)request.getAttribute("view");
		if(view.getReportId()!=null){
		%>
		<thead>
			<th>Report ID</th>
			<th>Location</th>
			<th>Date</th>
			<th>Temperature</th>
			<th>Humidity</th>
			<th>Wind</th>
			<th>Forecast</th>
		</thead>
		<tr>
			<td><%=view.getReportId() %></td>
			<td><%=view.getLocation() %></td>
			<td><%=view.getDate() %></td>
			<td><%=view.getTemperature() %></td>
			<td><%=view.getHumidity() %></td>
			<td><%=view.getWind() %></td>
			<td><%=view.getForecast() %></td>
		</tr>
		<%}
		else{
		%>
		<h1 align="center" style="color:red">No matching records exists! Please try again!</h1>
		<%} %>
	</table>
	</div>
	<h2 align="center"><a href="menu.html">Home</a></h2>
</body>
</html>