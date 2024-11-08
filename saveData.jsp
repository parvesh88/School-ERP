<%@page import="java.sql.*" %>
<%@include file="datasource.jsp" %>  
<%
	String sname = request.getParameter("sname");
	String address = request.getParameter("address");
	PreparedStatement ps = con.prepareStatement("INSERT INTO STUDENTS(NAME, ADDRESS) VALUES(?, ?)");
	ps.setString(1, sname);
	ps.setString(2, address);
	int i = 0;
	if(!sname.equals("") || !address.equals(""))
	      i = ps.executeUpdate();
	if(i>0)
	    out.println("Data Saved");	
	else
	    out.println("Error!");
%>

