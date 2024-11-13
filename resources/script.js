var ad_no, s_class, sname, fname, address, r_no, tr;
var ad_no_view;
var app = angular.module('app', []);
	app.controller('ctrl', function($scope, $http){
		$scope.saveData = function(){
		        $http.post("/saveData.jsp?ad_no="+$scope.ad_no+"&s_class="+$scope.s_class+"&sname="+$scope.sname+"&fname="+$scope.fname+"&address="+$scope.address+"&r_no="+$scope.r_no+"&tr="+$scope.tr+"&v_no="+$scope.v_no).then(function(response){
			    console.log("save data");
			    $scope.status = response.data;	
			    });
		    };
		$scope.viewData = function(id){
		        $http.post("/viewData.jsp?ad_no="+$scope.ad_no_view).then(function(response){
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
		$scope.collectFees = function(){
		        $http.post("/collectFees.jsp?ad_no="+num).then(function(response){
			    console.log("Collect Fees");
			    $scope.fees_collection_status = response.data;
			    });
		    };
		$scope.check = function(val) {
                $scope.hide = val == 'true' ? true : false;
            };
		});

