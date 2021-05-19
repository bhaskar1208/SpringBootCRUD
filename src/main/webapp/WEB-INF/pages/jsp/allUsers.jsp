<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="java.util.List" %>
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
		<!--  Header File -->
		<%@ include file="header.jsp" %> 
		<div class="row">
			<div class="col-md-8 col-md-offset-2">
				<div class="panel panel-success">
					<div class="panel-heading">
						Users List
					</div>
					<div class="panel-body">
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
			            	<%
			            		String uid="";
			            		String name="";
			            		String email="";
			            		String address="";
			            		List userList = (List) request.getAttribute("listUsers");
			            		for(int i=0; i<userList.size(); i++){
			            			uid="";
			            			name="";
			            			email="";
			            			address="";
			            			
			            			String userData[]=userList.get(i).toString().replace("]","").split(",");
			            			
			            			uid=userData[0].split("=")[1];
			            			name=userData[1].split("=")[1];
			            			email=userData[2].split("=")[1];
			            			address=userData[3].split("=")[1];
			            			out.println("<tr>");
			            			out.println("<td>"+uid+"</td>");
			            			out.println("<td>"+name+"</td>");
			            			out.println("<td>"+email+"</td>");
			            			out.println("<td>"+address+"</td>");
			            			out.println("<td><i class='fa fa-trash' onclick='javascript:deleteUser("+uid+");'></i></td>");
			            			%>
			            			<td>
			            				<a data-toggle='modal' data-target='#myModal' onclick="javascript:plotToModal('<%=uid%>','<%=name%>','<%=email%>','<%=address%>');"><i class='fa fa-pencil'></i></a>
			            			</td>
			            			<%
			            			out.println("<tr>");
			            		}
			            	
				            	%>
				            	<!-- Thymeleaf Template -->
				                <%-- 
				                	<tr th:each="user: ${listUsers}">
				                    <td th:text="${user.id}">User ID</td>
				                    <td th:text="${user.name}">Name</td>
				                    <td th:text="${user.email}">Email</td>
				                    <td th:text="${user.address}">Address</td>
				                </tr> 
			                --%>
			           		</tbody>
			        	</table>
					</div>
				</div>
			</div>

			<div class="modal fade" id="myModal" role="dialog" >
			    <div class="modal-dialog model-lg" style="width:1000px;">
			      <!-- Modal content-->
			      <div class="modal-content">
			        <div class="modal-header">
			          <button type="button" class="close" data-dismiss="modal">&times;</button>
			          <h4 class="modal-title">Update User</h4>
			        </div>
			        <div class="modal-body">
			          	<table class="table table-responsive table-bordered table-hover">
			          		<tr>
			          			<th>User ID</th>
			          			<th>Name</th>
			          			<th>Email</th>
			          			<th>Address</th>
			          		</tr>
			          		<tr>
			          			<td><p class="text-danger" id="modelUid"></p></td>
			          			<td><input class="form-control" type="text" name="modelName" id="modelName" style="width:250px;"></td>
			          			<td><input class="form-control" type="text" name="modelEmail" id="modelEmail" style="width:250px;"></td>
			          			<td><textarea class="form-control" id="modelAddress" rows="3" cols="60" name="modelAddress" maxlength="300"></textarea></td>
			          		</tr>
			          	</table>
			          	<center><button class="btn btn-primary" id="updateBtn">Update</button></center>
			        </div>
			        <div class="modal-footer">
			          <button type="button" class="btn btn-default" id="closeModal" data-dismiss="modal">Close</button>
			        </div>
			      </div>
			      
			    </div>
		  	</div>
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