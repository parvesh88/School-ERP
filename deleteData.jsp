<%@page import="java.sql.*" %>
<%@include file="datasource.jsp" %>  
<%    
    String ad_no = null;
    Statement s = null;

    s = con.createStatement();
    ad_no = request.getParameter("ad_no");
    s.execute("DELETE FROM STUDENTS WHERE ADMISSION_NO = " + ad_no);
    s.close();
    con.close();

    out.println("Deleted Student Admission No. " + ad_no);
%>

