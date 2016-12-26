<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
	<script
	src="http://ajax.googleapis.com/ajax/libs/angularjs/1.4.8/angular.min.js"></script>
<title>Add a Supplier</title>
</head>
<body>
	<nav class="navbar navbar-inverse">
	<div class="container-fluid">
		<div class="navbar-header">
			<a class="navbar-brand" href="Admin">Admin Home</a>
		</div>
		<ul class="nav navbar-nav">
			<li class="active"><a href="ManageProducts">Manage Products</a></li>
			<li><a href="ManageCategory">Manage Categories</a></li>
			<li><a href="managesuppliers">Manage Suppliers</a></li>
			<li><a href="ManageUsers">Manage Users</a></li>
		</ul>
		<ul class="nav navbar-nav navbar-right">
			<li><a href="index"><span
					class="glyphicon glyphicon-log-out"></span> Logout</a></li>
		</ul>
	</div>
	</nav>
	<h2>Add a Supplier</h2>
	<div class="container" ng-app="imgApp" ng-controller="imgCtrl">
		<c:url var="addsupplier" value="addSupplier"></c:url>
		<form:form commandName="Supplier" method="post" action="storesupplier">
			<table class="table table-bordered">
				<tr>
					<td><form:label path="supplierid">Supplier Id:</form:label></td>
					<td><form:input path="supplierid" /> <font color="red"><form:errors
								path="supplierid"></form:errors></font></td>
				</tr>
				<tr>
					<td><form:label path="suppliername">Supplier Name :</form:label></td>
					<td><form:input path="suppliername" /> <font color="red"><form:errors
								path="suppliername"></form:errors></font></td>
				</tr>
				<tr>
					<td><form:label path="supplierlocation">Supplier Location:</form:label></td>
					<td><form:input path="supplierlocation" /> <font color="red"><form:errors
								path="supplierlocation"></form:errors></font></td>
				</tr>
				<tr>
					<td><form:label path="categoryid">Category Id :</form:label></td>
					<td><form:input path="categoryid" /> <font color="red"><form:errors
								path="categoryid"></form:errors></font></td>
				</tr>
				<tr>
					<td><form:label path="categoryname">Category Name :</form:label></td>
					<td><form:input path="categoryname" /> <font color="red"><form:errors
								path="categoryname"></form:errors></font></td>
				</tr>
				<tr>
					<td><form:label path="productid">Product Id :</form:label></td>
					<td><form:input path="productid" /> <font color="red"><form:errors
								path="productid"></form:errors></font></td>
				</tr>
				<tr>
					<td><form:label path="productname">Product Name :</form:label></td>
					<td><form:input path="productname" /> <font color="red"><form:errors
								path="productname"></form:errors></font></td>
				</tr>
				<td><input type="submit" value="Add Supplier"
					class="btn-success" /></td>
			</table>
		</form:form>
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
	</nav> </footer>

</body>
</html>