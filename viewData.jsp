<%@page import="java.sql.*, javax.json.*" %>
<%@include file="datasource.jsp" %>  
<%    
    Statement s = null;
    ResultSet rs = null;
    JsonObject data = null;
    s = con.createStatement();
    // s.execute("DELETE FROM STUDENTS");
    rs = s.executeQuery("SELECT * FROM STUDENTS WHERE ADMISSION_NO=" + 
         request.getParameter("ad_no"));
    while (rs.next()) {
        data = Json.createObjectBuilder()
                .add("data", Json.createArrayBuilder()
                        .add(Json.createObjectBuilder()
                                .add("ad_no", rs.getInt(5))
                                .add("class", rs.getString(4))
                                .add("name", rs.getString(2))
                                .add("fname", rs.getString(6))
                                .add("address", rs.getString(3))
                                .add("r_no", rs.getInt(11))
                                .add("tr", rs.getString(8))
                                .add("b_date", rs.getString(12))
                                .add("a_num", rs.getString(13))
                                .add("v_no", rs.getString(9))))
                .build();
        out.println(data);
    }
%>