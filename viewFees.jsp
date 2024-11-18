<%@page import="java.sql.*, javax.json.*" %>
<%@include file="datasource.jsp" %>  
<%    
    ResultSet rs = null;
    JsonObject jo = null;
    Statement s = null;
    StringBuilder sb = null;
    
    sb = new StringBuilder();
    s = con.createStatement();
    rs = s.executeQuery("SELECT * FROM FEES WHERE ADMISSION_NO=" + request.getParameter("ad_no"));
    
    while (rs.next()) {
        jo = Json.createObjectBuilder()
                .add("date", rs.getString(7))
                .add("o_charges", rs.getInt(5))
                .add("tr_charges", rs.getInt(4))
                .add("ad_no", rs.getInt(2))
                .add("rem", rs.getString(6))
                .add("fees", rs.getInt(3))
		.add("r_no", rs.getInt(8))
                .build();
        sb.append(jo.toString() + ",");
    }
    String data = "{ \"data\" : [ " + sb.toString().substring(0, sb.toString().length() - 1) + " ]}";
    out.println(data);
    
    rs.close();
    /*
    rs = s.executeQuery("SELECT NAME, S_CLASS, ADDRESS FROM STUDENTS WHERE ADMISSION_NO=" + request.getParameter("ad_no"));
    
    while (rs.next()) {
        jo = Json.createObjectBuilder()
                .add("name", rs.getString(1))
                .add("class", rs.getString(2))
                .add("address", rs.getString(3))
                .build();
        sb.append(jo.toString() + ",");
    }
    String s_data = "{ \"student_data\" : [ " + sb.toString().substring(0, sb.toString().length() - 1) + " ]}";
    out.println(s_data);
    */
%>