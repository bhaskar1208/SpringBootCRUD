<%
try{
	if(session.getAttribute("email")==null){
		response.sendRedirect("index");
	}
}
catch(Exception E){
	out.println(E);
}
%>