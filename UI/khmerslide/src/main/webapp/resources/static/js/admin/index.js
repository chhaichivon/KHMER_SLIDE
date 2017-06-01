	var app = angular.module('index', ["datatables"]);
	
	// create controller
	app.controller('sessoinCtrler', function($scope, $filter, $http, $sce) {
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
	
	
	
	

	// <=================================Upload User Photo=================================>
	$('#input-10').change(function(){
		var imgUrl = window.location.origin + "/resources/static/img/loader.gif";
		var formData = new FormData();
		formData.append('img', $("#input-10")[0].files[0]);
		 $.ajaxSetup({
			 	globle: false,
//				url : "http://192.168.178.152:9999/api/user/add-profile-picture/photo",
			 	url : "http://localhost:9999/api/user/add-profile-picture/photo",
				type : "POST",
				enctype : 'multipart/form-data',
	            beforeSend: function (xhr) {
	 				xhr
						.setRequestHeader(
								'Authorization',
								'Basic a3NsOmtzbGFwaQ==');
	            },
	            complete: function () {
	            }
	        });
		
		$.ajax({
			data : formData,
			cache : false,
			crossDomain : true,
			processData : false, // tell jQuery not to process the data
			contentType : false, // tell jQuery not to set contentType
			success : function(data) {
            window.setTimeout(function(){ } ,3000);
				$scope.image = data.IMAGE;
			},
			error : function(data) {
				//console.log(data);
			}
		});
		
	});
	// End Upload Document Thumbnail
	
//	=======================================Update User Profile Picture======================================	
$scope.submit = function() {
		$http({
			url : '/rest/user/change-profile',
			data : {
				  "user_id": adminId,
				  "photo": $scope.image
				},
			method : 'PUT'
		}).then(function(response) {
			//console.log(response);
			swal({
	              title: "កំណែប្រែទិន្នន័យ",
	              text:  "រូបភាពគណនីរបស់លោកអ្នកត្រូវបានកែប្រែបានសម្រាច់",
	              type: "success",
	              timer: 3000,
	              showConfirmButton: false
	          });
			window.setTimeout(function(){ } ,3000);
			//window.location.href = "/admin/index";
		}, function() {
			swal({
				  title: "បរាជ័យ",
				  text: "សូមអភ័យទិន្នន័យដែលលោកអ្នកព្យាយាមធ្វើកំណែប្រែគឺមិនបានជោគជ័យទេ, សូមទំនាក់ទំនងទៅកាន់ក្រុមវិស្វករជំនាញ",
				  type: "warning",
				  timer: 3000,
				  showCancelButton: false,
				  closeOnConfirm: false,
				  showConfirmButton: false
				});
				window.setTimeout(function(){ } ,3000);
		});
	}
	
});

	// =================================Count user
	// Function==================================
	app.controller('documentCount', function($scope, $http) {

		$scope.DocP = 0;
		$scope.DocS = 0;
		$scope.DocW = 0;
		$scope.DocA = 0;

		$scope.DocTD_P = 0;
		$scope.DocTD_S = 0;
		$scope.DocTD_W = 0;
		$scope.DocTD_A = 0;

		$scope.DocTY_P = 0;
		$scope.DocTY_S = 0;
		$scope.DocTY_W = 0;
		$scope.DocTY_A = 0;

		$scope.DocPP = 0;
		$scope.DocPS = 0;
		$scope.DocPW = 0;
		$scope.DocPA = 0;

		var dateToday = new Date();
		var dateYesyterday = new Date();

		dateYesyterday.setDate(dateYesyterday.getDate() - 1);
		var month = [ 'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug',
				'Sep', 'Oct', 'Nov', 'Dec' ];
		var dateTY = dateYesyterday.getDate() + '-'
				+ month[dateYesyterday.getMonth()] + '-'
				+ dateYesyterday.getFullYear();
		var dateTD = dateToday.getDate() + '-' + month[dateToday.getMonth()] + '-'
				+ dateToday.getFullYear();

		$scope.getAllDoc = function() {
			$http({
				url : '/rest/document',
				method : 'GET'
			}).then(
					function(response) {
						// alert(">> OK ");
						$scope.DocAll = response.data.DATA;
						var iter = $scope.DocAll.length;
						for (var i = 0; i < iter; i++) {
							if ($scope.DocAll[i].TYPE == 1) {
								$scope.DocS++;
								if ($scope.DocAll[i].UPLOADED_DATE == dateTY) {
									$scope.DocTY_S++;
								}
								;
								if ($scope.DocAll[i].UPLOADED_DATE == dateTD) {
									$scope.DocTD_S++;
								}
								;
							}
							;
							if ($scope.DocAll[i].TYPE == 2) {
								$scope.DocP++;
								if ($scope.DocAll[i].UPLOADED_DATE == dateTY) {
									$scope.DocTY_P++;
								}
								;
								if ($scope.DocAll[i].UPLOADED_DATE == dateTD) {
									$scope.DocTD_P++;
								}
								;
							}
							;
							if ($scope.DocAll[i].TYPE == 3) {
								$scope.DocW++;
								if ($scope.DocAll[i].UPLOADED_DATE == dateTY) {
									$scope.DocTY_W++;
								}
								;
								if ($scope.DocAll[i].UPLOADED_DATE == dateTD) {
									$scope.DocTD_W++;
								}
								;
							}
							;
							$scope.DocA = $scope.DocS + $scope.DocP + $scope.DocW;
							$scope.DocTD_A = $scope.DocTD_S + $scope.DocTD_P
									+ $scope.DocTD_W;
							$scope.DocTY_A = $scope.DocTY_S + $scope.DocTY_P
									+ $scope.DocTY_W;
						}

						$scope.DocPP = parseInt((($scope.DocP / iter) * 100 + ''));
						$scope.DocPS = parseInt((($scope.DocS / iter) * 100 + ''));
						$scope.DocPW = parseInt((($scope.DocW / iter) * 100 + ''));
						$scope.DocPA = parseInt((($scope.DocA / iter) * 100 + ''));
					});

		}
	});
	
	angular.module("CombineWithIndex", [ "index", "userList" ]);