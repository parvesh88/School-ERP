var app = angular.module('app', []);
app.controller('ctrl', function ($scope, $http) {
    $scope.saveData = function () {
        $http.post("/saveData.jsp?ad_no=" + $scope.ad_no + "&s_class=" + $scope.s_class + "&sname=" + $scope.sname + "&fname=" + $scope.fname + "&address=" + $scope.address + "&r_no=" + $scope.r_no + "&tr=" + $scope.tr + "&v_no=" + $scope.v_no + "&b_date=" + $scope.b_date + "&a_num=" + $scope.a_num).then(function (response) {
            console.log("save data");
            $scope.status = response.data;
        });
    };
    $scope.viewData = function (id) {
        $http.post("/viewData.jsp?ad_no=" + $scope.ad_no_view).then(function (response) {
            console.log("view data " + $scope.ad_no_view);
            $scope.data = response.data.data;
        });
    };
    $scope.editData = function (id) {
        $http.post("/editData.jsp?id=" + id).then(function (response) {
            console.log("edit data");
            console.log(id);
            $scope.edit_status = response.data;
        });
    };
    $scope.deleteData = function (num) {
        $http.post("/deleteData.jsp?ad_no=" + num).then(function (response) {
            console.log("delete data");
            $scope.delete_status = response.data;
        });
    };
    $scope.collectFees = function () {
        $http.post("/collectFees.jsp?ad_no=" + $scope.ad_no + "&date=" + $scope.date + "&fees=" + $scope.fees + "&tr_charges=" + $scope.tr_charges + "&o_charges=" + $scope.o_charges + "&remarks=" + $scope.remarks).then(function (response) {
            console.log("Collect Fees");
            $scope.fees_collection_status = response.data;
        });
    };
    $scope.viewFees = function (id) {
        $http.post("/viewFees.jsp?ad_no=" + $scope.ad_no).then(function (response) {
            console.log("view fees" + $scope.ad_no);
            $scope.data = response.data.data;
        });
    };
    $scope.viewFeesByDate = function (id) {
        $http.post("/viewFees.jsp?date=" + $scope.date).then(function (response) {
            console.log("view fees" + $scope.date);
            $scope.data = response.data.data;
        });
    };
    $scope.check = function (val) {
        $scope.hide = val == 'true' ? true : false;
    };
    $scope.getTotalAmount = function(){
        var total = 0;
            for(var i = 0; i < $scope.student.r_no.length; i++){
                total += $scope.student.fees + $scope.student.tr_charges + $scope.student.o_charges ;
            }
         return total;
     };
});

