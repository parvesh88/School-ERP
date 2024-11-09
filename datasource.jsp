<%@page import="java.sql.*" %>
<%
Class.forName("org.h2.Driver");
Connection con = null;
con = DriverManager.getConnection("jdbc:h2:"+application.getRealPath("/")+"/DB/myDB");
%>