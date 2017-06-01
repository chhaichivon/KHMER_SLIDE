var app = angular.module('saveList', ["datatables"]);

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
	//create controller
	app.controller('saveListCtrl', function ($scope, $http, DTOptionsBuilder, $sce) {
		$scope.savelist = '';
//		$scope.urls = $sce.trustAsResourceUrl("http://192.168.178.152:9999");
		$scope.urls = $sce.trustAsResourceUrl("http://localhost:9999");
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
	    
	    
//	===========================Get Save List By User ID============================
			$scope.list = function(id){
				$http({
				url: '/rest/save-list/by-user-id/' + id + '',
				method: 'GET'
			}).then(function(repsonse){
			//	console.log(repsonse);
				$scope.savelist=repsonse.data.DATA;
			}, function(){
			});
			}
	
			$scope.list(userId);
			

			
//			===========================Get DOC List By Save List ID============================
			$scope.document=[];
			$scope.docList = function(id){
				$http({
				url: '/rest/save-list/by-save-list-id/' + id + '',
				method: 'GET'
			}).then(function(repsonse){
				//console.log(repsonse);
				$scope.document=repsonse.data.DATA;
			}, function(){
			});
			}
			var slId = $("#sl-id").val();
			if(slId != 'undefined'){
				$scope.docList(slId);
			}
			
			
			
			
			
			//=================================Delete Save List Function==================================
			$scope.remove = function(id) {
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
							url : '/rest/save-list/delete-savelist/'+ id +'',
//							data : {
//								  "doc_id": id,
//								  "status": 3
//								},
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
						window.location.href = "/user/index";
					} else {
//						swal("បោះបង់", "ទិន្នន័យរបស់អ្នកមានសុវត្ថិភាពដូចដើម :)",
//								"error");
					}
				})
			}
			
			
			//=================================Delete Save Doc Function==================================
			$scope.delSaveDoc = function(id) {
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
							url : '/rest/save-list/delete-savedoc/'+ id +'',
//							data : {
//								  "doc_id": id,
//								  "status": 3
//								},
							method : 'DELETE'
						}).then(function(repsonse) {

							$scope.docList(slId);
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
					//	window.location.href = "/user/index";
					} else {
//						swal("បោះបង់", "ទិន្នន័យរបស់អ្នកមានសុវត្ថិភាពដូចដើម :)",
//								"error");
					}
				})
			}
});
	
