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
			<div class="col-md-8 col-md-offset-2">
				<div class="panel panel-info">
					<div class="panel-heading">
						Hibernate User
					</div>
					<div class="panel-body">
						<table class="table table-striped table-hover table-bordered">
				            <thead class="thead-dark">
				                <tr class="bg-primary">
				                    <th>User ID</th>
				                    <th>Name</th>
				                    <th>Email</th>
				                    <th>Address</th>
				                    <th>Password</th>
				                    <!-- <th colspan="2" align="center"><i class="fa fa-wrench" aria-hidden="true"></i></th> -->
				                </tr>
				            </thead>
				            <tbody>
			            		<tr>
									<%
									if(request.getAttribute("userid")==null){
										out.println("<td colspan='5' align='center' style='color:red'>No user matched !</td>");
									}
									else
									{
									%>
			            			<td><p id="suser-id"><%=request.getAttribute("userid") %></p></td>
			            			<td><input type="text" id="suser-name" class="form-control" value='<%=request.getAttribute("username") %>' readonly></td>
			            			<td><input type="text" id="suser-email" class="form-control" value='<%=request.getAttribute("useremail") %>' readonly></td>
			            			<td><input type="text" id="suser-address" class="form-control" value='<%=request.getAttribute("useradd") %>' readonly></td>
			            			<td><input type="text" id="suser-address" class="form-control" value='<%=request.getAttribute("userpass") %>' readonly></td>
			            			<%
			            			} 
			            			%>
			            		</tr>
			           		</tbody>
			        	</table>
					</div>
				</div>
        	</div>
		</div>
	</div>
</body>

<script src="js/allusers.js"></script>

</html>