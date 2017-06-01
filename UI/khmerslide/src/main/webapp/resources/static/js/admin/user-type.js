	var userType = angular.module('userTypeList', ["datatables"]);
	
	// create controller
	userType.controller('sessoinCtrl', function($scope, $filter, $http, $sce) {
//		$scope.user = '';
//		$scope.urls = $sce.trustAsResourceUrl("http://192.168.178.152:9999");
	$scope.urls = $sce.trustAsResourceUrl("http://localhost:9999");
	//================================= User By ID Function=================================
	$scope.Admin = adminId;

	$scope.User = function(id) {
		$http({
			url : '/rest/user/' + id + '',
			method : 'GET'
		}).then(function(response) {
			//console.log(response);
			$scope.user = response.data.DATA[0];
			$scope.USER_ID = $scope.user.USER_ID;
			$scope.txtName = $scope.user.USER_NAME;
			$scope.photo = $scope.user.PHOTO;
			$scope.role = $scope.user.ROLE.ROLE_ID;
			
		}, function() {
			
		});
	}
	$scope.User(adminId);
	});

	//create controller
	userType.controller('userTypeListCtrl', function ($scope, $http, DTOptionsBuilder) {
		$scope.userType = '';
		
		// DataTables configurable options
	    $scope.dtOptions = DTOptionsBuilder.newOptions()
	        .withOption('bFilter', false)
	        .withOption('paginate', false)
	        .withOption('info', false);

			$scope.list = function(){
				$http({
				url: '/rest/user-type',
				method: 'GET'
			}).then(function(repsonse){
				// console.log(repsonse);
				$scope.userType=repsonse.data.DATA;
			//	alert($scope.userType);
			}, function(){

			});
			}

			$scope.list();
});
	angular.module("User", ["userList", "userTypeList"]);