var app = angular.module('index', []);

//	=============================Session================================================
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
			$scope.txtPassword = $scope.user.PASSWORD;
			$scope.role = $scope.user.ROLE.ROLE_ID;
			
			
		}, function() {
			
		});
	}
	$scope.User(userId);
	
	
	});
	

	
//	===============================List of Document=====================================
	//create controller
	app.controller('indexCtrl', function ($scope, $http, $sce, $filter) {
		
	$scope.document = '';
	var num = 0;
//		$scope.urls = $sce.trustAsResourceUrl("http://192.168.178.152:9999");
		$scope.urls = $sce.trustAsResourceUrl("http://localhost:9999");
			$scope.list = function(num){
				$scope.number = num + 8;
				$http({
				url: '/rest/document/by-user-id/' + userId + '?limit=' + $scope.number + '',
				method: 'GET'
			}).then(function(repsonse){
		//		console.log(repsonse);
				$scope.document=repsonse.data.DATA;
				if(($scope.document.length) >= $scope.number){
					
					$("#limit").show();
				}else{
					$("#limit").hide();
				}
			}, function(){
			});
			}

			$scope.list(num);
			
			
			
			
			
			

			// <=================================Upload User Photo=================================>
			$('#input-10').change(function(){
				var imgUrl = window.location.origin + "/resources/static/img/loader.gif";
				var formData = new FormData();
				formData.append('img', $("#input-10")[0].files[0]);
				 $.ajaxSetup({
					 	globle: false,
//						url : "http://192.168.178.152:9999/api/user/add-profile-picture/photo",
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
			
//			=======================================Update User Profile Picture======================================	
		$scope.submit = function() {
				
				$http({
					url : '/rest/user/change-profile',
					data : {
						  "user_id": userId,
						  "photo": $scope.image
						},
					method : 'PUT'
				}).then(function(response) {
					console.log(response);
					swal({
			              title: "កំណែប្រែទិន្នន័យ",
			              text:  "រូបភាពគណនីរបស់លោកអ្នកត្រូវបានកែប្រែបានសម្រាច់",
			              type: "success",
			              timer: 3000,
			              showConfirmButton: false
			          });
					window.setTimeout(function(){ } ,3000);
					window.location.href = "/user/index";
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
			
			
			
		
//	===========================================Update User Information==========================================
		$scope.User = function(id) {
			$http({
				url : '/rest/user/' + id + '',
				method : 'GET'
			}).then(function(response) {
			//	console.log(response);
				$scope.user = response.data.DATA[0];
				$scope.USER_ID = $scope.user.USER_ID;
				$scope.txtName = $scope.user.USER_NAME;
				$scope.photo = $scope.user.PHOTO;
				$scope.txtPassword = $scope.user.PASSWORD;
				$scope.role = $scope.user.ROLE.ROLE_ID;
				
				
			}, function() {
				
			});
		}
		$scope.User(userId);
		
		
		$scope.update = function() {
			$http({
				url : '/rest/user/',
				data : {
					"user_id" : $scope.USER_ID,
					"user_name" : $scope.txtName,
					"gender" : $scope.ddlGender,
					"password" : $scope.txtPassword,
					"status" : 1,
					"role_id" : 2
				},
				method : 'PUT'
			}).then(function(response) {
				console.log(response);
				swal({
		              title: "កំណែប្រែទិន្នន័យ",
		              text:  "ទិន្នន័យត្រូវបានកែប្រែបានសម្រាច់",
		              type: "success",
		              timer: 3000,
		              showConfirmButton: false
		          });
				window.setTimeout(function(){ } ,3000);
				window.location.href = "/user/index";
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
	
	angular.module("CombineWithIndex", [ "index", "saveList" ]);