<%@taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@taglib prefix="x" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<html xmlns="http://www.w3.org/1999/xhtml"
	xmlns:th="http://www.thymeleaf.org"
	xmlns:sec="http://www.thymeleaf.org/thymeleaf-extras-springsecurity3">


<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="http://ajax.googleapis.com/ajax/libs/angularjs/1.4.8/angular.min.js"></script>
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<title>Manage Products</title>
</head>
<body>
	<sec:authorize access="hasRole('ROLE_ADMIN')">
		<nav class="navbar navbar-inverse">
			<div class="container-fluid">
				<div class="navbar-header">
					<sec:authorize access="hasRole('ROLE_ADMIN')">
						<a class="navbar-brand" href="Admin">Admin Home</a>
					</sec:authorize>
				</div>
			</div>
			<ul class="nav navbar-nav">
				<li><a href="managesuppliers">Manage Suppliers</a></li>
				<li><a href="ManageUsers">Manage Users</a></li>
			</ul>
			<ul class="nav navbar-nav navbar-right">
				<li><a href="${pageContext.request.contextPath}/logoutsucess"><span
						class="glyphicon glyphicon-log-out"></span> Logout</a></li>
			</ul>
			</nav>
	</sec:authorize>
	<sec:authorize access="hasRole('ROLE_USER')">
		<nav class="navbar navbar-inverse">
			<div class="container-fluid">
				<div class="navbar-header">
					</div></div>
			<ul class="nav navbar-nav">
				<li><a>Welcome... <%=session.getAttribute("loggedInUser")%></a></li>
				
			</ul>
			<ul class="nav navbar-nav navbar-right">
				<li><a href="${pageContext.request.contextPath}/logoutsucess"><span
						class="glyphicon glyphicon-log-out"></span> Logout</a></li>
			</ul>
			</nav>
	</sec:authorize>
	
	<h2>Manage Products</h2>
	<div class="container">
		<div ng-app="myApp" ng-controller="customersCtrl">
			<table class="table table-striped table-hover">
				<tr>
					<th>Product Id</th>
					<th>Product Name</th>
					<th>Product Price</th>
					<th>Product Description</th>
					<th>Action</th>
				</tr>
				<tr ng-repeat="x in names | filter:searchBy">
					<td>{{x.Id}}</td>
					<td>{{x.Name}}</td>
					<td>{{x.Price}}</td>
					<td>{{x.Description}}</td>
					<td><a
						href="${pageContext.servletContext.contextPath}/viewproduct?id={{x.Id}}"><span>View</span></a>
						<sec:authorize access="hasRole('ROLE_ADMIN')">
							<a
								href="${pageContext.servletContext.contextPath}/editproduct?id={{x.Id}}"><span>Edit</span></a>
							<a
								href="${pageContext.servletContext.contextPath}/delete?id={{x.Id}}"><span>Delete</span></a>
						</sec:authorize></td>
				</tr>
			</table>
			<sec:authorize access="hasRole('ROLE_ADMIN')">
				<a href="addproduct" class="btn btn-info">Add Product</a>
			</sec:authorize>


		</div>

		<script>
			var app = angular.module('myApp', []);
			app.controller('customersCtrl', function($scope, $http) {
				$http.get("list").then(function(response) {
					$scope.names = response.data;
				});
			});
		</script>
	</div>
	<footer class="container-fluid text-center">
		<p>©GamingZone-All Rights Reserved</p>
		<P>2016</P>
	</footer>

</body>
</html>



