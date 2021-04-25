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
				<h2>User Login System</h2>
			</div>
			<div class="col-md-8 col-md-offset-2">
			<form action="loginAction" method="post">
				<table class="table table-hovered table-bordered">
					<thead>
						<tr></tr>
					</thead>
					<tbody>
						<tr>
							<th>Email: </th>
							<td><input type="email" class="form-control" name="email" id="email" required></td>
						</tr>
						<tr>
							<th>Password </th>
							<td><input type="text" class="form-control" name="password" id="password" required></td>
						</tr>
						<tr><td colspan="2" align="center"><input type="submit" name="Login" class="btn  btn-primary p-2 float-right" value="SUBMIT"></td></tr>
					</tbody>
				</table>
			</form>
			</div>
		</div>
	</div>
</body>
<script>
	$(document).ready(function(){
		$("#loginPage").addClass("active");
	});
	
</script>
</html>