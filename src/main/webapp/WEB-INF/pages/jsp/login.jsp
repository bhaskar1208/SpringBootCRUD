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
<div class="container">
		<!--  Header File -->
		<div class="row" style="margin-top:100px; margin:1px solid black;">
			<%
			if(request.getAttribute("successmsg")!=null){
				%>
				<div class="col-md-4 col-md-offset-4 table-responsive">
					<div class="alert alert-success alert-dismissable fade-in">
						<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
						<strong><%=request.getAttribute("successmsg") %></strong><br> Please use the new password for login.
					</div>
				</div>
				<%
			}
			if(request.getAttribute("errmsg")!=null){
				%>
				<div class="col-md-4 col-md-offset-4 table-responsive">
					<div class="alert alert-danger alert-dismissable fade-in">
						<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
						<strong><%=request.getAttribute("errmsg") %></strong> 
					</div>
				</div>
				<%
			}
			%>
			
			<div class="col-md-4 col-md-offset-4 table-responsive" style="background-color: lightgreen;">
			<h2>User Management System</h2>
			<form action="loginAction" method="post">
					<div class="row">
						<div class="col-md-12">
							<label for="email">Email</label>
						</div>
					</div>
					<div class="row">
						<div class="col-md-12">
							<input type="email" class="form-control" name="email" id="email" placeholder="Enter username" required>
						</div>
					</div>
					<div class="row" style="margin-top:20px;">
						<div class="col-md-12">
							<label for="password">Password</label>
						</div>
					</div>
					<div class="row">
						<div class="col-md-12">
							<input type="password" class="form-control" name="password" id="password" placeholder="Enter password" required>
							<span><i id="eye" onclick="showHidePassword();" class="fa fa-eye-slash"></i></span>
						</div>
					</div>
 			
 					<div class="row">
						<div class="col-md-12">
							Not Registered ? Click <a href="reg">here</a>
						</div>
					</div>
 					<div class="row">
						<div class="col-md-12">
							Change Password ? Click <a href="" data-toggle="modal" data-target="#passwordChangeModel">here</a>
						</div>
					</div>
					
					<div class="row" style="margin-top:30px;">
						<div class="col-md-12">
							<center><input type="submit" name="Login" class="btn  btn-primary p-2 float-right" value="SUBMIT"></center>
						</div>
					</div>	
			</form>
			<%if(request.getAttribute("msg")!=null){ %>
			<div class="row" style="margin-top:50px;">
						<div class="col-md-12">
							<div class="alert alert-danger alert-dismissable">
							<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
								<%=request.getAttribute("msg") %>
							</div>
						</div>
			</div>	
			<%} %>
			<br>
			<%@ include file="footer.jsp" %> 
			</div>
			<%@ include file="changePasswordModel.jsp" %> 
		</div>
	</div>
</body>
<script>
	$(document).ready(function(){
		$("#loginPage").addClass("active");
	});
</script>
<script src="js/utils.js"></script>
</html>