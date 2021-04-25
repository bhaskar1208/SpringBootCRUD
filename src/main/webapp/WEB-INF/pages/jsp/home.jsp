<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Web Application using Spring Boot</title>
<%@ include file="head.jsp" %> 
</head>
<body>
<div class="container-fluid">
	<%@ include file="header.jsp" %> 
	<div class="row">
	<div class="col-md-12">
		<h2>User Management System Using Spring Boot,Hibernate and MySQL </h2>
		<ul>
			<li>Add New User</li>
			<li>Show All Users</li>
			<li>Search For Single User</li>
			<li>Delete Users</li>
		</ul>
	</div>
	</div>
</div>
</body>
<script>
	$(document).ready(function(){
		$("#home").addClass("active");
	});
	
</script>
</html>