<html>
<%@page import="java.sql.*" %>
<head>
<link rel="stylesheet" href="w3.css">
</head>
<script src="angular.min.js" ></script>
<body>
<%@include file="datasource.jsp" %>  
<%
	Statement s = con.createStatement();
	ResultSet rs = s.executeQuery("SELECT * FROM STUDENTS");
%>
<div ng-app="app" ng-controller="ctrl" class="w3-container w3-container-fluid" >
<p class="w3-red w3-center">{{delete_status}}</p>
</br>
<table class='w3-table w3-striped' >
<tr class="w3-black w3-text-white" ><td style='width:15%' >Admission No.</td><td style='width:25%'>Student Name</td><td>Address</td><td style='width:10%' ></td><td style='width:10%' ></td></tr>
<%
	while(rs.next())
		out.println("<tr><td>"+rs.getInt(1) + "</td><td>" + rs.getString(2) + "</td><td>" + rs.getString(3) + "</td><td><button class='w3-btn w3-blue' ng-click='editData("+rs.getInt(1)+")' >Edit</button></td><td><button class='w3-btn w3-red' ng-click='deleteData("+rs.getInt(1)+")' >Delete</button></td></tr>");
%>
</table>
</div>
</body>
<script>
    var app = angular.module('app', []);
	app.controller('ctrl', function($scope, $http){
		$scope.editData = function(id){
		        $http.post("/editData.jsp?id="+id).then(function(response){
			    console.log("edit data");
			    console.log(id);
			    $scope.edit_status = response.data;	
			    });
		    }
		$scope.deleteData = function(id){
		        $http.post("/deleteData.jsp?id="+id).then(function(response){
			    console.log("delete data student id " + id);
			    $scope.delete_status = response.data;	
			    });
		    }
		});
</script>