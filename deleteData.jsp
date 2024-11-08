<%@page import="java.sql.*" %>
<%@include file="datasource.jsp" %>  
<%
    String id = request.getParameter("id");
	Statement s = con.createStatement();
    s.execute("DELETE FROM STUDENTS WHERE ID = " + id);
	s.close();
	con.close();
    out.println("Deleted Student ID "+id);	
%>

