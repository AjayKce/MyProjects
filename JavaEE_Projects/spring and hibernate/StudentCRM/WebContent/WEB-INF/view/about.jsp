<!DOCTYPE html>
<html lang="en">
<head>
  <!-- Theme Made By www.w3schools.com - No Copyright -->
  <title>About Us</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/css?family=Lato" rel="stylesheet" type="text/css">
  <link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/images/logo.png" type="image/x-icon">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <style>
  body {
      font: 400 15px Lato, sans-serif;
      line-height: 1.8;
      color: #818181;
  }
  h2 {
      font-size: 24px;
      text-transform: uppercase;
      color: #303030;
      font-weight: 600;
      margin-bottom: 30px;
  }
  h4 {
      font-size: 19px;
      line-height: 1.375em;
      color: #303030;
      font-weight: 400;
      margin-bottom: 30px;
  }  
  .jumbotron {
      background-color: #f4511e;
      color: #fff;
      padding: 100px 25px;
      font-family: Montserrat, sans-serif;
  }
  .container-fluid {
      padding: 60px 50px;
  }
  .bg-grey {
      background-color: #f6f6f6;
  }
  .logo-small {
      color: #f4511e;
      font-size: 50px;
  }
  .logo {
      color: #f4511e;
      font-size: 200px;
  }
  .thumbnail {
      padding: 0 0 15px 0;
      border: none;
      border-radius: 0;
  }
  .thumbnail img {
      width: 100%;
      height: 100%;
      margin-bottom: 10px;
  }
  .carousel-control.right, .carousel-control.left {
      background-image: none;
      color: #f4511e;
  }
  .carousel-indicators li {
      border-color: #f4511e;
  }
  .carousel-indicators li.active {
      background-color: #f4511e;
  }
  .item h4 {
      font-size: 19px;
      line-height: 1.375em;
      font-weight: 400;
      font-style: italic;
      margin: 70px 0;
  }
  .item span {
      font-style: normal;
  }
  .panel {
      border: 1px solid #f4511e; 
      border-radius:0 !important;
      transition: box-shadow 0.5s;
  }
  .panel:hover {
      box-shadow: 5px 0px 40px rgba(0,0,0, .2);
  }
  .panel-footer .btn:hover {
      border: 1px solid #f4511e;
      background-color: #fff !important;
      color: #f4511e;
  }
  .panel-heading {
      color: #fff !important;
      background-color: #f4511e !important;
      padding: 25px;
      border-bottom: 1px solid transparent;
      border-top-left-radius: 0px;
      border-top-right-radius: 0px;
      border-bottom-left-radius: 0px;
      border-bottom-right-radius: 0px;
  }
  .panel-footer {
      background-color: white !important;
  }
  .panel-footer h3 {
      font-size: 32px;
  }
  .panel-footer h4 {
      color: #aaa;
      font-size: 14px;
  }
  .panel-footer .btn {
      margin: 15px 0;
      background-color: #f4511e;
      color: #fff;
  }
  .navbar li a, .navbar .navbar-brand {
      color: #fff !important;
  }
  footer .glyphicon {
      font-size: 20px;
      margin-bottom: 20px;
      color: #f4511e;
  }
  .slideanim {visibility:hidden;}
  .slide {
      animation-name: slide;
      -webkit-animation-name: slide;
      animation-duration: 1s;
      -webkit-animation-duration: 1s;
      visibility: visible;
  }
  @keyframes slide {
    0% {
      opacity: 0;
      transform: translateY(70%);
    } 
    100% {
      opacity: 1;
      transform: translateY(0%);
    }
  }
  @-webkit-keyframes slide {
    0% {
      opacity: 0;
      -webkit-transform: translateY(70%);
    } 
    100% {
      opacity: 1;
      -webkit-transform: translateY(0%);
    }
  }
  @media screen and (max-width: 768px) {
    .col-sm-4 {
      text-align: center;
      margin: 25px 0;
    }
    .btn-lg {
        width: 100%;
        margin-bottom: 35px;
    }
  }
  @media screen and (max-width: 480px) {
    .logo {
        font-size: 150px;
    }
  }
  
  .active{
  backgroud-color:red;
  }
  </style>
  <% String success=(String)request.getAttribute("success");
	if(success!=null){
		%>
		<script type="text/javascript">
		alert("You have send SuccessFully");
	</script>
		<%
	}
%>
</head>
<body id="myPage" data-spy="scroll" data-target=".navbar" data-offset="60">
<nav class="navbar navbar-inverse navbar-fixed-top">
  <div class="container">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>                        
      </button>
      <a class="navbar-brand" href="#myPage">STUMAN</a>
    </div>
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav navbar-right">
        <li><a href="#about">ABOUT</a></li>
        <li><a href="#services">SERVICES</a></li>
        <li><a href="#portfolio">PORTFOLIO</a></li>
        <li><a href="#contact">CONTACT</a></li>
        <li><a href="login">LOGIN</a></li>
        <li><a href="signup">SIGNUP</a></li>
      </ul>
    </div>
  </div>
</nav>

<!-- Container (About Section) -->
<div id="about" class="container-fluid">
  <div class="row">
    <div class="col-sm-8">
      <h2>About STUMAN</h2><br>
      <h4>
      	STUMAN is a shortform for student's manager in which every user can store student detail's. This web app helps in filtering the students based on department, year, semester etc. This web app stores every details such as firstname, lastname , email etc and account details which is optional.
      </h4><br>
      <p>STUMAN is a students CRM app devoloped by AJAY.V from KARPAGAM COLLEGE OF ENGINEERING located at COIMBATORE, TAMILNADU , INDIA - 641032 . The main focus of this app is to reduce the difficulties faced by the user to store student details and helps in hospitality in which every user can get the details of the student for a respective blood. We also provide exporting details such as export to word ,
      export to excel . We also provides filtered export in which every user can get the documents of particular students based on the filter.</p>
    </div>
    <div class="col-sm-4">
      <span><img src="${pageContext.request.contextPath}/resources/images/logo.png" class="img-responsive"></span>
    </div>
  </div>
</div>

<div class="container-fluid bg-grey">
  <div class="row">
    <div class="col-sm-4">
      <span class="logo slideanim"> <img src="${pageContext.request.contextPath}/resources/images/logo.png" alt="Avatar" class="img-responsive"></span>
    </div>
    <div class="col-sm-8">
      <h4><strong>MISSION:</strong> Our mission is to safeguard the patient in the hospital for the purpose immediate blood donors and to walk away the difficulties of maintaining students details in academy.</h4><br>
      <p><strong>VISION:</strong> Our vision is to make new web apps based on this app inorder to focus in colleges as well as schools, railway , bustand ,airway , IIT, NIT and for the purpose of E-Commerce</p>
    </div>
  </div>
</div>

<!-- Container (Services Section) -->
<div id="services" class="container-fluid text-center">
  <h2>SERVICES</h2>
  <h4>What we offer</h4>
  <br>
  <div class="row slideanim">
    <div class="col-sm-4">
      <span class="glyphicon glyphicon-off logo-small"></span>
      <h4>POWER</h4>
      <p>power to maintain details</p>
    </div>
    <div class="col-sm-4">
      <span class="glyphicon glyphicon-heart logo-small"></span>
      <h4>LOVE</h4>
      <p>Get love from patients</p>
    </div>
    <div class="col-sm-4">
      <span class="glyphicon glyphicon-leaf logo-small"></span>
      <h4>JOB DONE</h4>
      <p>Making things go in a better way</p>
    </div>
  </div>
  <br><br>
  <div class="row slideanim">
    <div class="col-sm-4">
      <span class="glyphicon glyphicon-lock logo-small"></span>
      <h4>SECURE</h4>
      <p>Every details are secure and accurate</p>
    </div>
    <div class="col-sm-4">
      <span class="glyphicon glyphicon-certificate logo-small"></span>
      <h4>ASSURANCE</h4>
      <p>Confident makes everyone perfect</p>
    </div>
    <div class="col-sm-4">
      <span class="glyphicon glyphicon-wrench logo-small"></span>
      <h4 style="color:#303030;">HARD WORK</h4>
      <p>Simplify the difficulty</p>
    </div>
  </div>
</div>

<!-- Container (Portfolio Section) -->
<div id="portfolio" class="container-fluid text-center bg-grey">
  <div class="container text-center">    
  <div class="row">
    <div style="background-color:#dff9fb;" class="col-sm-3 well">
      <div style="background-color:#fff;" class="well">
      	<p><b>My Profile</b></p>
        <img src="${pageContext.request.contextPath}/resources/images/mine.jpg" class="img-responsive img-thumbnail img-circle" alt="Avatar">
      </div>
      <div style="background-color:#fff" class="well">
        <p><b>Interests</b></p>
        <p>
          <span class="label label-default">Web-Designing</span>
          <span class="label label-primary">Asset-Designing</span>
          <span class="label label-success">Chess</span>
          <span class="label label-warning">Animation</span>
          <span class="label label-danger">Friends</span>
        </p>
      </div>
      <div style="background-color:#fff" class="well">
      <p align="center"><b> Download</b></p>
      <p><a href="#">Download APK</a></p>
      </div>
      </div>
    <div  class=" well col-sm-7">
    <div style="background-color:#fff" class="col-sm-12 well">
          <p><b>Skills  </b></p>
        	<p>
          <span class="label label-default">HTML</span>
          <span class="label label-primary">CSS</span>
          <span class="label label-success">BOOTSTRAP</span>
          <span class="label label-info">JAVASCRIPT</span>
          <span class="label label-warning">JQUERY</span>
          <span class="label label-danger">C</span>
          <span class="label label-default">PYTHON</span>
          <span class="label label-primary">JAVA</span>
          <span class="label label-success">JSP</span>
          <span class="label label-info">SERVLET</span>
          <span class="label label-warning">HIBERNATE</span>
          <span class="label label-success">SPRING MVC</span>
        	</p>
        </div>         
      <div class="row">
        <div class="col-sm-3">
          <div style="background-color:#fff" class="well">
           <p>Aswin</p>
           <img src="${pageContext.request.contextPath}/resources/images/aswin.jpg" class="img-rounded img-thumbnail" height="65" width="65" alt="Avatar">
          </div>
        </div>
        <div class="col-sm-9">
          <div style="background-color:#fff" class="well">
            <p>Hey bro in which way this app can be used</p>
          </div>
        </div>
      </div>
      <div class="row">
        <div  class="col-sm-3">
          <div style="background-color:#fff" class="well">
           <p>Ajay</p>
           <img src="${pageContext.request.contextPath}/resources/images/mine.jpg" class="img-rounded img-thumbnail" height="65" width="65" alt="Avatar">
          </div>
        </div>
        <div class="col-sm-9">
          <div style="background-color:#fff" class="well">
            <p>Hey buddy! This app can store Students details and filter the student details based on the given filter. And this app also provides you with word or excel document so that you can process this data for data mining or analysis purpose </p>
          </div>
        </div>
      </div>
      <div class="row">
        <div class="col-sm-3">
          <div style="background-color:#fff" class="well">
           <p>Aswin</p>
           <img src="${pageContext.request.contextPath}/resources/images/aswin.jpg" class="img-rounded img-thumbnail" height="65" width="65" alt="Avatar">
          </div>
        </div>
        <div class="col-sm-9">
          <div style="background-color:#fff" class="well">
            <p>Superb Buddy! I just luv it and it is very easy to use. The main use of this app as i have conveyed is filter the students based on blood group. We have also developed a note taking app Scribe(scribe.gq)</p>
          </div>
        </div>
      </div>
       <div class="row">
        <div class="col-sm-3">
          <div style="background-color:#fff" class="well">
           <p>Ajay</p>
           <img src="${pageContext.request.contextPath}/resources/images/mine.jpg" class="img-rounded img-thumbnail" height="65" width="65" alt="Avatar">
          </div>
        </div>
        <div class="col-sm-9">
          <div style="background-color:#fff" class="well">
            <p>Whoo Hooo! Your Scribe is awesome for note taking . I am pretty sure that this two app can be easy to use for the users being signed up !!! </p>
          </div>
        </div>
      </div>    
    </div>
    <div style="background-color:#dff9fb;" class="col-sm-2 well">
      <div class="thumbnail">
        <img src="${pageContext.request.contextPath}/resources/images/mine.jpg" alt="My Image" class="img-thumbnail" width="400" height="300">
        <p><strong>Ajay</strong></p>
        <a href="https://ajay0288.github.io/" target="_blank">
        	<button style="width:80%" class="btn btn-primary">Visit</button>
        </a>
      </div>      
      <div class="thumbnail">
        <p>Design</p>
        <img src="${pageContext.request.contextPath}/resources/images/logo.png" alt="My Image" class="img-thumbnail" width="400" height="300">
        <p><strong>Spinner</strong></p>
        <a href="https://ajay0288.github.io/ajay/mineload/" target="_blank">
        	<button style="width:80%" class="btn btn-primary">Visit</button>
        </a>
      </div>
    </div>
  </div>
</div>
  </div><br>

<!-- Container (Contact Section) -->
<div id="contact" class="container-fluid bg-grey">
  <h2 class="text-center">CONTACT</h2>
  <div class="row">
    <div class="col-sm-5">
      <p>Contact us and we'll get back to you within 24 hours.</p>
      <p><span class="glyphicon glyphicon-map-marker"></span> Coimbatore, TamilNadu, INDIA</p>
      <p><span class="glyphicon glyphicon-phone"></span> +91 9488977981</p>
      <p><span class="glyphicon glyphicon-envelope"></span> aajay0288@gmail.com</p>
    </div>
    <div class="col-sm-7 slideanim">
    	<form method="post" action="${pageContext.request.contextPath}/contactUs">
      <div class="row">
        <div class="col-sm-6 form-group">
          <input class="form-control" id="name" name="name" placeholder="Name" type="text" required>
        </div>
        <div class="col-sm-6 form-group">
          <input class="form-control" id="email" name="email" placeholder="Email" type="email" required>
        </div>
      </div>
      <textarea class="form-control" id="comments" name="comments" placeholder="Comment" rows="5" required></textarea><br>
      <div class="row">
        <div class="col-sm-12 form-group">
          <button class="btn btn-default pull-right" type="submit">Send</button>
        </div>
      </div>
      </form>
    </div>
  </div>
</div>

<footer class="container-fluid text-center">
  <a href="#myPage" title="To Top">
    <span class="glyphicon glyphicon-chevron-up"></span>
  </a>
  <p>Web App Made By AJAY V</p>
</footer>

<script>
$(document).ready(function(){
  // Add smooth scrolling to all links in navbar + footer link
  $(".navbar a, footer a[href='#myPage']").on('click', function(event) {
    // Make sure this.hash has a value before overriding default behavior
    if (this.hash !== "") {
      // Prevent default anchor click behavior
      event.preventDefault();

      // Store hash
      var hash = this.hash;

      // Using jQuery's animate() method to add smooth page scroll
      // The optional number (900) specifies the number of milliseconds it takes to scroll to the specified area
      $('html, body').animate({
        scrollTop: $(hash).offset().top
      }, 900, function(){
   
        // Add hash (#) to URL when done scrolling (default click behavior)
        window.location.hash = hash;
      });
    } // End if
  });
  
  $(window).scroll(function() {
    $(".slideanim").each(function(){
      var pos = $(this).offset().top;

      var winTop = $(window).scrollTop();
        if (pos < winTop + 600) {
          $(this).addClass("slide");
        }
    });
  });
})
</script>

</body>
</html>
