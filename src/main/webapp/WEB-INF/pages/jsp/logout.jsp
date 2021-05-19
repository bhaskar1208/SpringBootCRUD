<%
try{
	session.invalidate();
	response.sendRedirect("index");
}
catch(Exception E){
	out.println(E);
}
%>