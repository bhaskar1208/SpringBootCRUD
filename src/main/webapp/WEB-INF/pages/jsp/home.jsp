<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Web Application using Spring Boot</title>
<%@ include file="Auth.jsp" %> 
<%@ include file="head.jsp" %> 
</head>
<body>
<div class="container-fluid">
	<%@ include file="header.jsp" %> 
	<div class="row">
	<!-- <div class="col-md-12">
		<h2>User Management System</h2>
		<ul>
			<li>Add New User</li>
			<li>Show All Users</li>
			<li>Search For Single User</li>
			<li>Delete Users</li>
		</ul>
	</div> -->
	</div>
	<div class="row">
		<div class="col-md-12">
				
		</div>
		<div class="col-md-12">
			<div class="panel panel-info">
				<div class="panel-heading">
				Your Details
				</div>
				<div class="panel-body">
					<p class="text-success h3"><%=session.getAttribute("name") %></p>
					<p class="text-primary h4"><%=session.getAttribute("address") %></p>
					<p class="text-primary h4"><%=session.getAttribute("email") %></p>
		</div>
				</div>
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