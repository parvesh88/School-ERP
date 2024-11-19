<%@page import="java.sql.*" %>
<%@include file="datasource.jsp" %>  
<%    
    String ad_no, s_class, sname, fname, address, r_no, tr, v_no, b_date, a_num;
    Statement s = null;
    ResultSet rs = null;
    PreparedStatement ps = null;
    int i = 0;

    ad_no = request.getParameter("ad_no");
    s_class = request.getParameter("s_class");
    sname = request.getParameter("sname");
    fname = request.getParameter("fname");
    address = request.getParameter("address");
    r_no = request.getParameter("r_no");
    tr = request.getParameter("tr");
    v_no = request.getParameter("v_no");
    b_date = request.getParameter("b_date");
    a_num = request.getParameter("a_num");
    
    if (v_no == null || v_no.equals("")) {
        v_no = "NA";
    }

    s = con.createStatement();
    rs = s.executeQuery("SELECT NAME FROM STUDENTS WHERE ADMISSION_NO=" + ad_no);
    while (rs.next()) {
        if (rs.getString(1) != null) {
            out.println("Admission Number already entered !");
            con.close();
            return;
        }
    }

    // s.execute("ALTER TABLE STUDENTS ADD COLUMN(B_DATE VARCHAR(16), A_NUM VARCHAR(24))");
    ps = con.prepareStatement("INSERT INTO STUDENTS(ADMISSION_NO, S_CLASS, NAME, FNAME, ADDRESS, ROLL_NO, TRANSPORT, V_NO, B_DATE, A_NUM) VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?)");
    ps.setInt(1, Integer.parseInt(ad_no));
    ps.setString(2, s_class);
    ps.setString(3, sname);
    ps.setString(4, fname);
    ps.setString(5, address);
    ps.setInt(6, Integer.parseInt(r_no));
    ps.setBoolean(7, Boolean.parseBoolean(tr));
    ps.setString(8, v_no);
    ps.setString(9, b_date);
    ps.setString(10, a_num);

    i = ps.executeUpdate();
    
    ps.close();
    con.close();
    
    if (i > 0) {
        out.println("Data Saved");
    } else {
        out.println("Error!");
    }

%>

