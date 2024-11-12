<%@page import="java.sql.*, javax.json.*" %>
<%@include file="datasource.jsp" %>  
<%
    Statement s = null;
	ResultSet rs = null;
	PreparedStatement ps = null;
	
	int ad_no, fees, t_charges, o_charges;
	String date, remarks;
	
	ad_no = Integer.parseInt(request.getParameter("ad_no"));
	date = request.getParameter("date");
	fees = Integer.parseInt(request.getParameter("fees"));
	t_charges = Integer.parseInt(request.getParameter("t_charges"));
	o_charges = Integer.parseInt(request.getParameter("o_charges"));
	remarks = request.getParameter("remarks");
	
    s = con.createStatement();
    // s.execute("ALTER TABLE ADD COLUMN(R_DATE DATE)");
	ps = con.prepareStatement("INSERT INTO FEES(ADMISSION_NO, R_DATE, FEES, T_CHARGES, O_CHARGES, REMARKS) VALUES(?, ?, ?, ?, ?, ?)");
	ps.setInt(1, ad_no);
	ps.setDate(2, java.sql.Date.valueOf(date));
	ps.setInt(3, fees);
	ps.setInt(4, t_charges);
	ps.setInt(5, o_charges);
	ps.setString(6, remarks);
	
	out.println("OK");
	int i = 0;
	if(true){
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