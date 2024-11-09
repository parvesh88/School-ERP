var ad_no, s_class, sname, address;
var ad_no_view;
var app = angular.module('app', []);
	app.controller('ctrl', function($scope, $http){
		$scope.saveData = function (){
		        ad_no = document.getElementById("ad_no").value;
		        s_class = document.getElementById("s_class").value;
			    sname = document.getElementById("sname").value;
	            address = document.getElementById("address").value;
		        $http.post("/saveData.jsp?ad_no="+ad_no+"&s_class="+s_class+"&sname="+sname+"&address="+address).then(function(response){
			    console.log("save data");
			    $scope.status = response.data;	
			    });
		    };
		$scope.viewData = function(id){
			    ad_no_view = document.getElementById("ad_no_view").value;
		        $http.post("/viewData.jsp?ad_no="+ad_no_view).then(function(response){
			    console.log("view data " + ad_no_view);
			    $scope.data = response.data.data;	
			    });
		    };
		$scope.editData = function(id){
		        $http.post("/editData.jsp?id="+id).then(function(response){
			    console.log("edit data");
			    console.log(id);
			    $scope.edit_status = response.data;	
			    });
		    };
		$scope.deleteData = function(num){
		        $http.post("/deleteData.jsp?ad_no="+num).then(function(response){
			    console.log("delete data");
			    $scope.delete_status = response.data;
			    });
		    };
		});