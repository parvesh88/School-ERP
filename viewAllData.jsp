<html>
<%@page import="java.sql.*" %>
<head>
<link rel="stylesheet" href="resources/w3.css">
</head>
<script src="resources/angular.min.js" ></script>
<script src="resources/script.js" ></script>
<body>
<%@include file="datasource.jsp" %>  
<%
	Statement s = null;
	ResultSet rs = null;
	
    s = con.createStatement();
    rs = s.executeQuery("SELECT * FROM STUDENTS");
%>
<div ng-app="app" ng-controller="ctrl" class="w3-container w3-container-fluid" >
<p class="w3-red w3-center">{{delete_status}}</p>
</br>
<table class='w3-table w3-striped' >
<tr class="w3-black w3-text-white" ><td style='width:15%' >Admission No.</td><td style='width:10%'>Class</td><td style='width:25%'>Student Name</td><td>Address</td><td style='width:10%' ></td><td style='width:10%' ></td></tr>
<%
	while(rs.next())
		out.println("<tr><td class='w3-center' >"+rs.getInt(5) +  "</td><td>" + rs.getString(4) +"</td><td>" + rs.getString(2) + "</td><td>" + rs.getString(3) + "</td><td><button class='w3-btn w3-blue' ng-click='editData("+rs.getInt(1)+")' >Edit</button></td><td><button class='w3-btn w3-red' ng-click='deleteData("+rs.getInt(1)+")' >Delete</button></td></tr>");
%>
</table>
</div>
</body>
</html>