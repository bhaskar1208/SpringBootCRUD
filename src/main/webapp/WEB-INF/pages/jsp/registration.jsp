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
		
		<div class="row" style="margin-top:50px;">
			<div class="col-md-8 col-md-offset-2">
				<div class="panel panel-primary">
				    <div class="panel-heading">User Registration System</div>
				  </div>
			</div>
			<br><br>
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
							<th>Name </th>
							<td><input type="text" class="form-control" name="name" id="name" placeholder="Enter name" required></td>
						</tr>
						<tr>
							<th>Email </th>
							<td><input type="email" class="form-control" name="email" id="email" placeholder="Enter valid email" required></td>
						</tr>
						<tr>
							<th>Address </th>
							<td><input type="text" class="form-control" name="address" id="address" placeholder="Enter address" required></td>
						</tr>
						<tr>
							<th>Password </th>
							<td><input type="password" class="form-control" name="password" id="password" placeholder="Enter password" onkeyup="return validate(this.value,'btnRegSubmit')"  required>
							<p id="invalidTxt" class="text-danger"></p>
							</td>
						</tr>
						<tr>
							<td></td>
							<td>
								Show/Hide Password &nbsp;<input type="checkbox" name="regShowHidePasswordBox" id="regShowHidePasswordBox">
							</td>
						</tr>
						
						<tr><td colspan="2" align="center"><input type="submit" name="submit" class="btn  btn-primary p-2 float-right" id="btnRegSubmit" value="SUBMIT"></td></tr>
					</tbody>
				</table>
			</form>
			<center>Click <a href="index">here</a> for Login</center>
			</div>
		</div>
	</div>
</body>
<script>
	$(document).ready(function(){
		$("#regPage").addClass("active");
	});
	
</script>
<script src="js/utils.js"></script>
</html>