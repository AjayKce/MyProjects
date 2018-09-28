<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>signup-form</title>
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
    <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/images/logo.png" type="image/x-icon">
    <style>
        #email{
            padding-left:20%;
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
                                    <li class="active">
                                    	<a href="#"><span class="glyphicon glyphicon-home"></span> Home</a>
                                    </li>
                                </ul>
                                <ul class="nav navbar-nav">
                                    <li>
                                    <a href="#"><span class="glyphicon glyphicon-floppy-disk"></span> About</a>
                                    </li>
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
                <p class="col-lg-12 col-md-12 col-xs-12 col-sm-12" align="center">
                   <img class="img-responsive" width="50%" src="${pageContext.request.contextPath}/resources/images/sign.png">
                </p>
                <span class="col-lg-12 col-md-12 col-xs-12 col-sm-12"><br><br></span>
                <form class="form col-lg-12 col-md-12 col-xs-12 col-sm-12" method="post" action="processForgetPasswordForm">
                <span class="input-group">
                    <span class="input-group-addon"><i class="glyphicon glyphicon-envelope"></i></span>
                    <input type="email" id="email" name="email" class="form-control" placeholder="enter email to reset password" required />
                </span>
                <span class="col-lg-12 col-md-12 col-xs-12 col-sm-12"><br></span>
                <span class="col-lg-4 col-md-4 col-xs-4 col-sm-4"></span>
                <span class="col-lg-4 col-md-4 col-xs-4 col-sm-4">
                	<input style="width:100%;" class="btn btn-success" type="submit" value="send"/>
                </span>
                <span class="col-lg-4 col-md-4 col-xs-4 col-sm-4"></span>
                </form>
            </div>
            <div class="col-lg-4 col-md-4 col-xs-12 col-sm-12"></div>
        </div>
    </div>
</body>

</html>