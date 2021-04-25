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
            			out.println("<td><i class='fa fa-trash' onclick='javascript:deleteUser("+uid+");'></i>");
            			out.println("<td><i class='fa fa-pencil'></i>");
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
</body>
<script>
	$(document).ready(function(){
		$("#usersPage").addClass("active");
	});
	function deleteUser(uid){
		//alert(uid);
		$.ajax({  
            type: "GET",  
            url: "deleteUser/"+uid,  
            contentType: "application/json",  
            dataType: "json",  
            success: function (data) {  
               	alert(data);              
            }, 
            failure: function (data) {  
                alert("Failure -> "+data.responseText);  
            },
            error: function (data) {  
                alert("Error ->"+data.responseText);  
            }
        });         
	}
</script>
</html>