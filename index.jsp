<html>
<head>
<!-- <meta name="viewport" content="width=device-width,initial-scale=1.0" > -->
<link rel="stylesheet" href="w3.css">
</head>

<script src="angular.min.js" ></script>

<body>
<div class="w3-container w3-container-fluid w3-clearfix" >
</br>
<p class="w3-center w3-black w3-text-white w3-bold w3-large" >STUDENT MANAGEMENT SYSTEM</p>
<div ng-app="app" ng-controller="ctrl"  >
</br>
Admission Number <input id="" style="width:20%" class="w3-input" name="" type="number" required />
</br>
</br>
Class <select name="class" id="class">
  <option value="">NURSERY</option>
  <option value="">L.K.G</option>
  <option value="">U.K.G</option>
  <option value="">1ST</option>
  <option value="">2ND</option>
  <option value="">3RD</option>
  <option value="">4TH</option>
  <option value="">5TH</option>
  <option value="">6TH</option>
  <option value="">7TH</option>
  <option value="">8TH</option>
  <option value="">9TH</option>
  <option value="">10TH</option>
</select>
</br>
</br>
Name <input id="sname" style="width:60%" class="w3-input" name="sname" type="text" required />
</br>
Address <input id="address" style="width:60%" class="w3-input" name="address" type="text" required />
</br>
<button style="width: 10%" class="w3-input w3-blue" ng-click="saveData()" >Submit</button>
<p class="w3-black w3-text-white" style="padding-left: 20px;">{{status}}</p>
</br>
</div>
</br>
<form method="post" action="data.jsp" >
<input style="width: 10%;" class="w3-input w3-blue" type="submit" value="View Data" />
</form>
</div>
</div>
</body>
<script>
    var app = angular.module('app', []);
	app.controller('ctrl', function($scope, $http){
		$scope.saveData = function (){
			    var sname = document.getElementById("sname").value;
	            var address = document.getElementById("address").value;
		        $http.post("/saveData.jsp?sname="+sname+"&address="+address).then(function(response){
			    console.log("save data");
			    $scope.status = response.data;	
			    });
		    }
		});
</script>
</html>
