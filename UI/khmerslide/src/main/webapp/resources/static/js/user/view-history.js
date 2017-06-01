var app = angular.module('history', []);

//=============================Session================================================
//create controller
app.controller('sessoinCtrl', function($scope, $filter, $http, $sce) {
	$scope.user = '';
//	$scope.urls = $sce.trustAsResourceUrl("http://192.168.178.152:9999");
	$scope.urls = $sce.trustAsResourceUrl("http://localhost:9999");
//================================= User By ID Function=================================

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
$scope.User(userId);
});

		//===============================List of View History=====================================
		//create controller
		app.controller('viewhistoryListCtrl', function ($scope, $http, $sce, $filter) {
			$scope.viewhistory = '';
//			$scope.urls = $sce.trustAsResourceUrl("http://192.168.178.152:9999");
			$scope.urls = $sce.trustAsResourceUrl("http://localhost:9999");
			var num = 0;
			
			$scope.list = function(num){
				$scope.number = num + 4;
				$http({
				url: '/rest/view-history/by-user-id/' + userId + '?limit=' + $scope.number + '',
				method: 'GET'
			}).then(function(repsonse){
				//console.log(repsonse);
				
				$scope.viewhistory=repsonse.data.DATA;
				//$scope.count = repsonse.data.COUNT;
			//	$scope.message = repsonse.data.MESSAGE;
				if(($scope.viewhistory.length) >= $scope.number){
					
					$("#limit").show();
				}else{
					$("#limit").hide();
				}
			}, function(){
			});
			}

			$scope.list(num);
			
			//=================================Delete View history Function==================================
			$scope.remove = function() {
				
				swal({
					title : "ពិតជាចង់ធ្វើការលុបទិន្នន័យនេះមែន?",
					// text : "You will not be able to recover this data!",
					type : "warning",
					showCancelButton : true,
					confirmButtonColor : "#DD6B55",
					confirmButtonText : "បាទ/ចាស, លុប",
					timer: 3000,
					cancelButtonText : "បោះបង់",
					closeOnConfirm : true,
					closeOnCancel : true
				}, function(isConfirm) {

					if (isConfirm) {
						$http({
							url : '/rest/view-history/delete/' + userId +'',
							method : 'DELETE'
						}).then(function(repsonse) {

							$scope.list(userId);
						}), (function() {

						});
						swal({
				              title: "លុប",
				              text:  "ទិន្នន័យបានលុបរួចរាល់",
				              type: "success",
				              timer: 3000,
				              showConfirmButton: false
				          });
						window.setTimeout(function(){ } ,3000);
					} else {
//						swal("បោះបង់", "ទិន្នន័យរបស់អ្នកមានសុវត្ថិភាពដូចដើម :)",
//								"error");
					}
				})
			}
	});
		


		angular.module("CombineWithHistory", [ "history", "saveList" ]);