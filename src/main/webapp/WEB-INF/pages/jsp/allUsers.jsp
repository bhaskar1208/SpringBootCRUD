<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page language="java" import="java.util.List" %>
<%@page language="java" import="net.sf.json.JSONArray"%>
<%@page language="java" import="org.json.simple.JSONObject"%>
<%@page language="java" import="org.json.simple.parser.JSONParser"%>


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
				                    <th>Password</th>
				                    <th colspan="2" align="center"><i class="fa fa-wrench" aria-hidden="true"></i></th>
				                </tr>
				            </thead>
				            <tbody>
			            	<%
			            		String uid="";
			            		String name="";
			            		String email="";
			            		String address="";
			            		String password="";
			            		List userList = (List) request.getAttribute("listUsers");
			            		JSONArray jArray = new JSONArray();
			            		for(int i=0; i<userList.size(); i++){
			            			jArray.add(userList.get(i));
			            		}	
	
			    				for(int j=0; j<jArray.size(); j++){
			    					JSONParser parser = new JSONParser();  
			    					JSONObject json = (JSONObject) parser.parse(jArray.get(j).toString());
			    				
			    					uid=json.get("id").toString();
			            			name=json.get("name").toString();
			            			email=json.get("email").toString();
			            			address=json.get("address").toString();
			            			password=json.get("password").toString();
		
			            			out.println("<tr>");
			            			out.println("<td>"+uid+"</td>");
			            			out.println("<td>"+name+"</td>");
			            			out.println("<td>"+email+"</td>");
			            			out.println("<td>"+address+"</td>");
			            			out.println("<td>"+password+"</td>");
			            			out.println("<td><i class='fa fa-trash' onclick='javascript:deleteUser("+uid+");'></i></td>");
			            			%>
			            			<td>
			            				<a data-toggle='modal' data-target='#myModal' onclick="javascript:plotToModal('<%=uid%>','<%=name%>','<%=email%>','<%=address%>','<%=password%>');"><i class='fa fa-pencil'></i></a>
			            			</td>
			            			<%
			            			out.println("<tr>");
			    				}
				            	%>
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
			          			<th>Password</th>
			          		</tr>
			          		<tr>
			          			<td><p class="text-danger" id="modelUid"></p></td>
			          			<td><input class="form-control" type="text" name="modelName" id="modelName" style="width:180px;"></td>
			          			<td><input class="form-control" type="text" name="modelEmail" id="modelEmail" style="width:250px;"></td>
			          			<td><textarea class="form-control" id="modelAddress" rows="3" cols="80" name="modelAddress" maxlength="300"></textarea></td>
			          			<td><input class="form-control" id="modelPassword" name="modelPassword" style="width:180px;"></td>
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