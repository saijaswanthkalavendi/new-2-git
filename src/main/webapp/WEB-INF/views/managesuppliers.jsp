<%@taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@taglib prefix="x" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<html xmlns="http://www.w3.org/1999/xhtml"
	xmlns:th="http://www.thymeleaf.org"
	xmlns:sec="http://www.thymeleaf.org/thymeleaf-extras-springsecurity3">
<html>
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
	
<title>Manage Suppliers</title>
</head>
<body>

	<nav class="navbar navbar-inverse">
		<div class="container-fluid">
			<div class="navbar-header">
				<a class="navbar-brand" href="Admin">Admin Home</a>
			</div>
			<ul class="nav navbar-nav">
				<li class="active"><a href="manageproducts">Manage Products</a></li>

				<li><a href="ManageUsers">Manage Users</a></li>
			</ul>
			<ul class="nav navbar-nav navbar-right">
				<li><a href="${pageContext.request.contextPath}/logoutsucess"><span
						class="glyphicon glyphicon-log-out"></span> Logout</a></li>
			</ul>
		</div>
	</nav>
	<h2>Manage Suppliers</h2>
	<div class="container">
		<div ng-app="myApp" ng-controller="customersCtrl">
			<input type="text" class="form-control"
				ng-model="searchBy.suppliername" />
			<table class="table table-striped table-hover">
				<tr>
					<th>Id</th>
					<th>Supplier Id</th>
					<th>Supplier Name</th>
					<th>Supplier Location</th>
					<th>Action</th>
				</tr>
				<tr ng-repeat="z in names | filter:searchBy">
					<td>{{z.id}}</td>
					<td>{{z.supplierid}}</td>
					<td>{{z.suppliername}}</td>
					<td>{{z.supplierlocation}}</td>
					<td><a
						href="${pageContext.servletContext.contextPath}/viewsupplier?id={{z.id}}"
						class="btn btn-info"><span>View</span></a> 
						 <sec:authorize access="hasRole('ROLE_ADMIN')">
						 <a
						href="${pageContext.servletContext.contextPath}/editsupplier?id={{z.id}}"
						class="btn btn-primary"><span>Edit</span></a> <a
						href="${pageContext.servletContext.contextPath}/deletesupplier?id={{z.id}}"
						class="btn btn-danger"><span>Delete</span></a></sec:authorize>
				</tr>
			</table>
			<a href="addsupplier" class="btn btn-info">Add Supplier</a>

		</div>

		<script>
			var app = angular.module('myApp', []);
			app.controller('customersCtrl', function($scope, $http) {
				$http.get("listsup").then(function(response) {
					$scope.names = response.data;
				});
			});
		</script>
	</div>


	<footer class="container-fluid text-center">
		<nav class="navbar navbar-inverse">
			<div class="navbar-header">
				<div style="color: #FFFFFF">

					<div align="right">
						<p align="left">
							©GamingZone-All Rights Reserved <br> 2016 <a href="eamil">GamingZone@gmail.com</a>
						</p>
					</div>
				</div>
			</div>
		</nav>
	</footer>

</body>
</html>