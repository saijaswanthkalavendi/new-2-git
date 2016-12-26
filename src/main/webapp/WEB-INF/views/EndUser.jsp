<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<title>Welcome to GamingZone</title>
</head>
<body>
<head>
<style>
 <style>
  .carousel-inner > .item > img,
  .carousel-inner > .item > a > img {
      width: 70%;
      margin: auto;
  }
  </style>
</style>
</head>
<body>
<center>
<h1>Welcome to GamingZone</h1>
</center>
<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="#">GamingZone</a>
    </div>
    <ul class="nav navbar-nav">
      <li class="active"><a href="#">Home</a></li>
      <li><a href="viewproducts">View Products</a></li>
    </ul>
    <ul class="nav navbar-nav navbar-right">
    <li><h1><a href="EndUser">Welcome... <%=session.getAttribute("loggedInUser")%></a></h1></li>
      <li><a href="${pageContext.request.contextPath}/logoutsucess"><span class="glyphicon glyphicon-log-out"></span> Logout</a></li>
    </ul>
  </div>
</nav>
	<div class="container"></div>
		<br>
		<center>
		<div id="myCarousel" class="carousel slide" data-ride="carousel">
			<!-- Indicators -->
                                             
			<ol class="carousel-indicators">
				<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
				<li data-target="#myCarousel" data-slide-to="1"></li>
				<li data-target="#myCarousel" data-slide-to="2"></li>
				<li data-target="#myCarousel" data-slide-to="3"></li>
			</ol>
			<!-- Wrapper for slides -->
			<div class="carousel-inner" role="listbox">

				<div class="item active">
			
        <img src="<c:url value="/resources/images/acerlaptop.jpg"/>" alt="acerlaptop" width="400" height="200">
      </div>

      <div class="item">
        <img src="<c:url value="/resources/images/asuslaptop.jpg"/>" alt="asuslaptop" width="400" height="200">
      </div>
    
      <div class="item">
        <img src="<c:url value="/resources/images/hplaptop.jpg"/>" alt="hplaptop" width="400" height="200"> 
      </div>
      
      <div class="item">
        <img src="<c:url value="/resources/images/lenovolaptop.jpg"/>" alt="lenovolaptop" width="400" height="200"> 
      </div>
			<!-- Left and right controls -->
			<a class="left carousel-control" href="#myCarousel" role="button"
				data-slide="prev"> <span
				class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
				<span class="sr-only">Previous</span>
			</a> <a class="right carousel-control" href="#myCarousel" role="button"
				data-slide="next"> <span
				class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
				<span class="sr-only">Next</span>
			</a>
		</div>
	</div>
</center>
	<div class="container-fluid bg-3 text-center">
		<h3>Featured Games</h3>
		<br>
		<div class="row">
			<div class="col-sm-3">
				<p>ResidentEvil</p>
				<img src="<c:url value="/resources/images/acerlaptop1.jpg"/>"
					class="img-responsive" style="width: 100%" alt="acerlaptop1">
			</div>
			<div class="col-sm-3">
				<p>MassEffect</p>
				<img src="<c:url value="/resources/images/applelaptop1.jpg"/>"
					class="img-responsive" style="width: 100%" alt="applelaptop1">
			</div>
			
			<div class="col-sm-3">
				<p>Prince of Presia</p>
				<img src="<c:url value="/resources/images/Delllaptop1.jpg"/>"
					class="img-responsive" style="width: 100%" alt="Delllaptop1">
			</div>
			<div class="col-sm-3">
				<p>ForHonor</p>
				<img src="<c:url value="/resources/images/asuslaptop1.jpg"/>"
					class="img-responsive" style="width: 100%" alt="asuslaptop1">
			</div>
		</div>
	</div>
	<br>
	<br>

	<footer class="container-fluid text-center">
	<nav class="navbar navbar-inverse">
	<div class="navbar-header" >
	<div style="color:#FFFFFF" >
	    
		<div align="right">
		<p align="left">�GamingZone-All Rights Reserved <br> 2016
	    <a  href="eamil">GamingZone@gmail.com</a></p> 
	    </div>
	</div>
    </div>		
    </nav>
	</footer>

</body>
</html>