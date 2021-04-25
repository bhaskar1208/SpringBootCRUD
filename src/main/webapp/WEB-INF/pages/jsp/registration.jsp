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
		<!--  Header File -->
		<%@ include file="header.jsp" %> 
		
		<div class="row">
			<div class="col-md-12">
				<h2>User Registration System</h2>
			</div>
			<div class="col-md-8 col-md-offset-2">
			<%
				if(request.getAttribute("msg")!=null){
			%>
				<div class="alert alert-success alert-dismissible fade in">
   				 	<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
    				<strong><%=request.getAttribute("msg")%></strong>
  				</div>		
			<%
				}
			%>
			<form action="addUser" method="post">
				<table class="table table-hovered table-bordered">
					<thead>
						<tr></tr>
					</thead>
					<tbody>
						<tr>
							<th>Name: </th>
							<td><input type="text" class="form-control" name="name" id="name" required></td>
						</tr>
						<tr>
							<th>Email: </th>
							<td><input type="email" class="form-control" name="email" id="email" required></td>
						</tr>
						<tr>
							<th>Address: </th>
							<td><input type="text" class="form-control" name="address" id="address" required></td>
						</tr>
						<tr><td colspan="2" align="center"><input type="submit" name="submit" class="btn  btn-primary p-2 float-right" value="SUBMIT"></td></tr>
					</tbody>
				</table>
			</form>
			</div>
		</div>
	</div>
</body>
<script>
	$(document).ready(function(){
		$("#regPage").addClass("active");
	});
	
</script>
</html>