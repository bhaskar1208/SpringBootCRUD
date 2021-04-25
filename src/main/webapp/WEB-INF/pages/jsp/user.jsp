<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="java.util.List" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Web Application using Spring Boot</title>
<%@ include file="head.jsp" %> 
</head>
<body>
<div class="container-fluid">
		<!--  Header File -->
		<%@ include file="header.jsp" %> 
		
		<div class="row">
			<div class="col-md-12">
				<h2>Users List</h2>
			</div>
			<div class="col-md-8 col-md-offset-2">
			<table class="table table-striped table-hover table-bordered">
	            <thead class="thead-dark">
	                <tr class="bg-primary">
	                    <th>User ID</th>
	                    <th>Name</th>
	                    <th>Email</th>
	                    <th>Address</th>
	                    <th colspan="2" align="center"><i class="fa fa-wrench" aria-hidden="true"></i></th>
	                </tr>
	            </thead>
	            <tbody>
            	
           
           		</tbody>
        	</table>
		</div>
	</div>
</body>
<script>
	$(document).ready(function(){
		$("#usersPage").addClass("active");
	});
</script>
<script src="js/allusers.js"></script>

</html>