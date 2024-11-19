<%@page import="java.time.*, java.sql.*, javax.json.*" %>
<%@include file="datasource.jsp" %>  
<%!
    public int c(String s) {
        return Integer.parseInt(s);
    }
%>
<%    
    Statement s = null;
    PreparedStatement ps = null;

    int r_no, ad_no, fees, tr_charges, o_charges;
    String date, remarks;

    r_no = (int) (Math.random() * 10000D);
    
    ad_no = c(request.getParameter("ad_no"));
    date = request.getParameter("date");
    fees = c(request.getParameter("fees"));
    tr_charges = c(request.getParameter("tr_charges"));
    o_charges = c(request.getParameter("o_charges"));
    remarks = request.getParameter("remarks");

    ps = con.prepareStatement("INSERT INTO FEES(ADMISSION_NO, R_DATE, FEES, T_CHARGES, O_CHARGES, REMARKS, R_NO) VALUES(?, ?, ?, ?, ?, ?, ?)");
    ps.setInt(1, ad_no);
    ps.setDate(2, java.sql.Date.valueOf(LocalDate.now()));
    ps.setInt(3, fees);
    ps.setInt(4, tr_charges);
    ps.setInt(5, o_charges);
    ps.setString(6, remarks);
    ps.setInt(7, r_no); // will updated shortly

    ps.executeUpdate();

    out.println("Saved");

%>