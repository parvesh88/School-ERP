var app = angular.module('app', []);
	app.controller('ctrl', function($scope, $http){
		$scope.saveData = function (){
		        var ad_no = document.getElementById("ad_no").value;
		        var s_class = document.getElementById("s_class").value;
			    var sname = document.getElementById("sname").value;
	            var address = document.getElementById("address").value;
		        $http.post("/saveData.jsp?ad_no="+ad_no+"&s_class="+s_class+"&sname="+sname+"&address="+address).then(function(response){
			    console.log("save data");
			    $scope.status = response.data;	
			    });
		    };
		$scope.editData = function(id){
		        $http.post("/editData.jsp?id="+id).then(function(response){
			    console.log("edit data");
			    console.log(id);
			    $scope.edit_status = response.data;	
			    });
		    };
		$scope.deleteData = function(id){
		        $http.post("/deleteData.jsp?id="+id).then(function(response){
			    console.log("delete data student id " + id);
			    $scope.delete_status = response.data;	
			    });
		    };
		});