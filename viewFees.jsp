<%@page import="java.sql.*, javax.json.*" %>
<%@include file="datasource.jsp" %>  
<%
	
	ResultSet rs = null;
	JsonObject jo = null;
	Statement s = null;
    s = con.createStatement();
    // s.execute("DELETE FROM FEES WHERE ADMISSION_NO=1");
    
	rs = s.executeQuery("SELECT * FROM FEES WHERE ADMISSION_NO=" + request.getParameter("ad_no"));
	StringBuilder sb = new StringBuilder();
	while(rs.next()){
	     jo = Json.createObjectBuilder()
	                                            .add("date", rs.getString(7))
                                                .add("o_charges", rs.getInt(5))
                                                .add("tr_charges", rs.getInt(4))
                                                .add("ad_no", rs.getInt(2))
                                                .add("rem", rs.getString(6))
                                                .add("fees", rs.getInt(3))
                                                .build();
          sb.append(jo.toString()+",");
	}
	String data = "{ \"data\" : [ " + sb.toString().substring(0, sb.toString().length() - 1) + " ]}" ;
    out.println(data);
%>