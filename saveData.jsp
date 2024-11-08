<%@page import="java.sql.*" %>
<%@include file="datasource.jsp" %>  
<%
    String ad_no = request.getParameter("ad_no");
    String s_class = request.getParameter("s_class");
	String sname = request.getParameter("sname");
	String address = request.getParameter("address");
	Statement s = con.createStatement();
	ResultSet rs = s.executeQuery("SELECT NAME FROM STUDENTS WHERE ADMISSION_NO=" + ad_no);
	while(rs.next()){
	        if(rs.getString(1) != null){
	                out.println("Recheck Admission Number!");
	                con.close();
	                return;
	        }
	}
	     
	PreparedStatement ps = con.prepareStatement("INSERT INTO STUDENTS(ADMISSION_NO, S_CLASS, NAME, ADDRESS) VALUES(?, ?, ?, ?)");
	ps.setInt(1, Integer.parseInt(ad_no));
	ps.setString(2, s_class);
	ps.setString(3, sname);
	ps.setString(4, address);
	int i = 0;
	if(!ad_no.equals("")  || !s_class.equals("") || !sname.equals("") || !address.equals("")){
	      try{
	              i = ps.executeUpdate();
	      }catch(SQLException sqle){
	      }
	}
	ps.close();
	con.close();
	if(i>0)
	    out.println("Data Saved");	
	else
	    out.println("Error!");
%>

