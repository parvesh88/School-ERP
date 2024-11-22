<%@page import="java.sql.*, javax.json.*" %>
<%@include file="datasource.jsp" %>  
<%    
    ResultSet rs = null;
    JsonObject jo = null;
    Statement s = null;
    StringBuilder sb = null;
    String v = "", v1 = "";
    
    sb = new StringBuilder();
    s = con.createStatement();
    
    v = request.getParameter("date");
    v1 = request.getParameter("ad_no");
    
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
    
%>