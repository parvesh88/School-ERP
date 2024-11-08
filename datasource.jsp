<%@page import="java.sql.*" %>
<%
Class.forName("org.h2.Driver");
Connection con = DriverManager.getConnection("jdbc:h2:~/myDB");
%>