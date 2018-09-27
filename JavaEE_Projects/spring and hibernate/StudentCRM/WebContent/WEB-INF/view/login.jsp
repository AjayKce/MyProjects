<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
    <!DOCTYPE html>
    <html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <title>login-form</title>
        <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
        <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
        <link href="${pageContext.request.contextPath}/resources/stylesheet/login.css" rel="stylesheet">
        <link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/images/logo.png" type="image/x-icon">
        <style>
            .error {
                color: red;
            }
            .success {
                color: blue;
                font-family:cursive;
                font-weight:bolder;
            }
        </style>
    </head>

    <body>
        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-8 col-md-8 col-xs-0 col-sm-0">
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
                                    <li><a href="/StudentCRM"><span class="glyphicon glyphicon-user"></span> Sign-Up</a></li>
                                </ul>
                            </div>
                        </div>
                    </nav>
                    <p align="center">
                        <img class="img-responsive" width="50%" src="${pageContext.request.contextPath}/resources/images/log.png">
                        <p align="center" style="color:blue">
                                <% if(request.getAttribute("successLogout")!=null){out.println(request.getAttribute("successLogout"));}%>
                        </p>
                    </p>
                </div>
                <div class="col-lg-4 col-md-4 col-xs-0 col-sm-0">
                    <h3 align="center" class="LoginHeader">Log-In</h3>
                    <p align="center" class="success">
                        <% if(request.getAttribute("success")!=null){out.println(request.getAttribute("success"));}%>
                    </p>
                    <p class="error" align="center">
                        <% if(request.getAttribute("authenticationError")!=null){out.println(request.getAttribute("authenticationError"));}%>
                    </p><br>
                    <form method="post" class="loginForm" action="checkLogin" class="form col-lg-12 col-md-12 col-xs-12 col-sm-12">
                        <span class="col-lg-12 col-md-12 col-xs-12 col-sm-12"><br></span>
                        <span class="col-lg-12 col-md-12 col-xs-12 col-sm-12">
                            <span>
                                <span>
                                    <label for="username">username : </lable>
                                </span>
                                <span>
                                <div class="input-group">
    								<span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
                                	<input type="text" name="username" id="username" class="form-control" placeholder="enter username" required/>
                                </div>
                                </span>
                            </span>
                            <span class="col-lg-12 col-md-12 col-xs-0 col-sm-0"><br></span>
                            <span>
                                <span>
                                    <label for="password">password :</label>
                                </span>
                                <span>
                                <div class="input-group">
    								<span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
                                <input type="password" name="password" id="password" class="form-control" placeholder="enter password"
                                        required/>
                                        </div>
                                 </span>
                            </span>
                            <span class="col-lg-12 col-md-12 col-xs-12 col-sm-12"><br></span>
                            <span class="col-lg-12 col-md-12 col-xs-12 col-sm-12">
                        	<a style="color:#233BE1;" href="${pageContext.request.contextPath}/showForgetPasswordForm"><b>Forget Password</b></a>
                        	</span>
                        </span>
                        <span class="col-lg-12 col-md-12 col-xs-12 col-sm-12"><br></span>
                        <p align="center"><input class="btn btn-success" type="submit" value="Log in"></p>
                        <br>
                    </form>
                </div>
            </div>
        </div>
    </body>

    </html>