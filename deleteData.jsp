<%@page import="java.sql.*" %>
<%@include file="datasource.jsp" %>  
<%
    String id = request.getParameter("id");
	Statement s = con.createStatement();
	boolean b = s.execute("DELETE FROM STUDENTS WHERE ID = " + id);
	
	if(!b)
	    out.println("Deleted Student ID "+id);	
	else
	    out.println("Error!");
%>

