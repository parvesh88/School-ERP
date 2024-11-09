<%@page import="java.sql.*" %>
<%@include file="datasource.jsp" %>  
<%
	Statement s = null;
	ResultSet rs = null;
    s = con.createStatement();
	rs = s.executeQuery("SELECT * FROM STUDENTS WHERE ADMISSION_NO=" + request.getParameter("ad_no"));
	while(rs.next())
		out.println("{\"data\" : [{ \"ad_no\" : "+rs.getInt(5) +  ", \"class\": \"" + rs.getString(4) +"\", \"name\" : \" " + rs.getString(2) + " \", \"address\" : \"" + rs.getString(3) + "\"}]}");
%>