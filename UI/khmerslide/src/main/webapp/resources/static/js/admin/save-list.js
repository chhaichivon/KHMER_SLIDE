var app = angular.module('saveList',["datatables"]);
//create controller
app.controller('sessoinCtrl', function($scope, $filter, $http, $sce) {
	$scope.user = '';
//	$scope.urls = $sce.trustAsResourceUrl("http://192.168.178.152:9999");
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
	app.controller('saveListCtrl', function ($scope, $http, DTOptionsBuilder) {
		$scope.savelist = '';
		
		// DataTables configurable options
	    $scope.dtOptions = DTOptionsBuilder.newOptions()
	        .withLanguage({
	        	lengthChange : !1,
				pageLength : 5,
				colReorder : !0,
				lengthMenu : "បង្ហាញ _MENU_ ស្ថិតិក្នុងមួយទំព័រ",
				paginate : {
					"previous" : "ថយក្រោយ",
					"next" : "បន្ទាប់",
					"first" : "ដំបូង",
					"last" : "ចុងក្រោយ"
				},
				info : "បង្ហាញទំព័រទី _PAGE_ នៃ _PAGES_ ដែលជាទំព័រសរុប",
				search : "",
				searchPlaceholder : "ស្វែងរក..."
	        });

//	==============================Get Save List============================	
			$scope.list = function(){
				
					$http({
						method: 'GET',
						url: '/rest/save-list/get-savelist'
						
					}).then(function(repsonse){
						/*console.log(savelist);*/
						$scope.savelist=repsonse.data.DATA;
						console.log($scope.savelist);
					}, function(){
						$scope.savelist = response.statusText;
					});
			}
			$scope.list();
			
//	================================Delete Save List===================================		
			$scope.deleteSaveList = function(SL_ID){
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
					method: 'DELETE',
					url: '/rest/save-list/delete-savelist/'+ SL_ID
				}).then(function(repsonse) {

					$scope.list();
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
//				swal("បោះបង់", "ទិន្នន័យរបស់អ្នកមានសុវត្ថិភាពដូចដើម :)",
//						"error");
			}
		})
	}
});