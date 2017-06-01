var app = angular.module('userList', [ "datatables" ]);
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

// create controller
app.controller('userListCtrl', function($scope, $filter, $http,
		DTOptionsBuilder, $location, $sce) {
	$scope.user = '';
//	$scope.urls = $sce.trustAsResourceUrl("http://192.168.178.152:9999");
	$scope.urls = $sce.trustAsResourceUrl("http://localhost:9999");
	$scope.submitForm = function() {

		// check to make sure the form is completely valid
		if ($scope.insertForm.$valid) {
			swal({
              title: "បញ្ចូលទិន្នន័យ",
              text:  "ទិន្នន័យត្រូវបានបញ្ចូលបានសម្រាច់",
              type: "success",
              timer: 3000,
              showConfirmButton: false
          });
      window.setTimeout(function(){ } ,3000);
			// $scope.insert();
		}

	};

// 	=================================DataTables configurable options for Table User=================================
	$scope.dtOptions = DTOptionsBuilder.newOptions().withLanguage({
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

	$scope.list = function() {
		$http({
			url : '/rest/user',
			method : 'GET'
		}).then(function(repsonse) {
			// console.log(repsonse);
			$scope.user = repsonse.data.DATA;
		}, function() {

		});
	}

	$scope.list();

//	=================================Add User Function=================================
	$scope.role = function(roleId) {
		$scope.usertype = roleId;
	}
	$scope.status = 1;
	$scope.photo = "/resources/static/img/users/default-user-image.png";
	$scope.date = $filter('date')(new Date(), 'dd-MMM-yyyy');
	$scope.insert = function() {
		$http({
			url : '/rest/user',
			data : {
				"user_name" : $scope.txtName,
				"gender" : $scope.ddlGender,
				"email" : $scope.txtEmail,
				"password" : $scope.txtPassword,
				"photo" : $scope.photo,
				"registered_date" : $scope.date,
				"status" : $scope.status,
				"role_id" : $scope.usertype
			},
			method : 'POST'
		}).then(function() {
			// console.log(respsonse.data);
			$scope.txtName = '';
			$scope.ddlGender = '';
			$scope.txtEmail = '';
			$scope.txtPassword = '';
			$scope.txtConfirmPassword = '';
			$scope.list();
		}, function() {
			swal({
				  title: "បរាជ័យ",
				  text: "សូមអភ័យទិន្នន័យដែលលោកអ្នកព្យាយាមបញ្ចូលគឺមិនបានជោគជ័យទេ, សូមទំនាក់ទំនងទៅកាន់ក្រុមវិស្វករជំនាញ",
				  type: "warning",
				  timer: 3000,
				  showCancelButton: false,
				  closeOnConfirm: false
				});
				window.setTimeout(function(){ } ,3000);
		});
	}

	
//	=================================Edit User Function=================================
	$scope.update = function(id) {
		$http({
			url : '/rest/user/' + id + '',
			method : 'GET'
		}).then(function(response) {
			$scope.user = response.data.DATA[0];
			$scope.USER_ID = $scope.user.USER_ID;
			$scope.txtName = $scope.user.USER_NAME;
			$scope.ddlStatus = $scope.user.STATUS + '';
			$scope.ddlGender = $scope.user.GENDER;
			$scope.txtPassword = $scope.user.PASSWORD;
			$scope.ddlRole = $scope.user.ROLE.ROLE_ID + '';
			
		}, function() {
			
		});
	}
	// Get Path Variable from URL
	var url = $location.absUrl();
	var userId = url.substr(url.lastIndexOf("/") + 1);
	$scope.update(userId);

	$scope.submit = function() {
		$http({
			url : '/rest/user/',
			data : {
				"user_id" : $scope.USER_ID,
				"user_name" : $scope.txtName,
				"gender" : $scope.ddlGender,
				"password" : $scope.txtPassword,
				"status" : $scope.ddlStatus,
				"role_id" : $scope.usertype
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
			window.location.href = "/admin/user-list";
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

	
//	=================================Delete user Function==================================
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
					url : '/rest/user/status',
					data : {
						user_id : id,
						status : 3,
					// AGE: $scope.upAge
					},
					method : 'PUT'
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
	
	
	// ============================ View User Detail ========================
	$scope.viewUser = function(id) {
		$http({
			url : '/rest/user/' + id + '',
			method : 'GET'
		}).then(function(response) {
			//console.log(response);
			//alert(id + " >> INSERT");
			$scope.GET_USR_ID = response.data.DATA[0];
			$scope.userName = $scope.GET_USR_ID.USER_NAME;
			$scope.userGender = $scope.GET_USR_ID.GENDER;
			$scope.userPhoto = $scope.GET_USR_ID.PHOTO;
			$scope.userRole = $scope.GET_USR_ID.ROLE.ROLE_ID;
			$scope.userEmail = $scope.GET_USR_ID.EMAIL;
			$scope.userRegDate = $scope.GET_USR_ID.REGISTERED_DATE;
			$scope.userDescript = $scope.GET_USR_ID.DESCRIPTION;
			$scope.userStatus = $scope.GET_USR_ID.STATUS;
			//alert("?" + $scope.userStatus);
		}, function() {
			
		});
	}
	
});



//=================================Count user Function==================================
app.controller('userCount',function ($scope, $http){
	
	var UserByGnderM;
	var UserByGnderF;
	var UserByRole;
	$scope.countUserByGenderM = function(){		
		$http({
			url: '/rest/user/gender/ប្រុស'
		}).then(function(response){
			$scope.UserByGnderM = response.data.DATA.length;
			UserByGnderM = $scope.UserByGnderM;
			$scope.countUserByGenderF();
		});
		
	}
	
	$scope.countUserByGenderF = function(){		
		$http({
			url: '/rest/user/gender/ស្រី'
		}).then(function(response){
			$scope.UserByGnderF = response.data.DATA.length;
			UserByGnderF = $scope.UserByGnderF;
			$scope.getPercent();
		});
		
	}
	
	$scope.countUserByRole = function(){		
		$http({
			url: '/rest/user/role/ROLE_ADMIN'
		}).then(function(response){
			$scope.UserByRole = response.data.DATA.length;
			UserByRole = $scope.UserByRole;
			$scope.countUserByGenderM();
		});
		
	}
	
	$scope.getPercent = function(){
		var totalUser = UserByGnderM + UserByGnderF;
		if(totalUser > 0){
			var M = ($scope.UserByGnderM / totalUser) * 100 + ''; 
			var F = ($scope.UserByGnderF / totalUser) * 100 + '';
			var A = ($scope.UserByGnderF / totalUser) * 100 + '';
			$scope.PercentMale = parseInt(M);
			$scope.PercentFemale = parseInt(F);
			$scope.PercentAdmin = parseInt(A);
//			alert($scope.PercentMale);
		}else{
			$scope.PercentMale = 0;
			$scope.PercentFemale = 0;
			$scope.PercentAdmin =0;
		}
	}
	$scope.countUserByRole();	
});

//=================================Count user Function==================================
app.controller('userCount',function ($scope, $http){
	
	$scope.UserByGnderM = 0;
	$scope.UserByGnderF = 0;
	$scope.UserByRoleAdmin = 0;
	
	$scope.MaleDateYesterday = 0;
	$scope.FemaleDateYesterday = 0;
	$scope.AdminDateYesterday = 0;
	
	$scope.MaleDateToday = 0;
	$scope.FemaleDateToday = 0;
	$scope.AdminDateToday = 0;
	
	$scope.TotalUserDateToday = 0;
	$scope.TotalUserDateYesterday = 0;
	
	var dateToday = new Date();
	var dateYesyterday = new Date();
	
	dateYesyterday.setDate(dateYesyterday.getDate() - 1);
	var month = ['Jan','Feb','Mar','Apr','May','Jun','Jul','Aug','Sep','Oct','Nov','Dec'];
	var dateTY =  dateYesyterday.getDate() + '-' +  month[dateYesyterday.getMonth()] + '-' +  dateYesyterday.getFullYear();
	var dateTD =  dateToday.getDate() + '-' +  month[dateToday.getMonth()] + '-' +  dateToday.getFullYear();
	
	$scope.getAllUser = function(){		
		$http({
			url: '/rest/user/'
		}).then(function(response){
			$scope.UserAll = response.data.DATA;
			var iter = $scope.UserAll.length;
			for (var i = 0; i < iter; i++){
				if($scope.UserAll[i].GENDER == 'ប្រុស'){
					$scope.UserByGnderM ++;
					if($scope.UserAll[i].REGISTERED_DATE == dateTY){
						$scope.MaleDateYesterday ++;				
					};
					if($scope.UserAll[i].REGISTERED_DATE == dateTD){
						$scope.MaleDateToday ++;				
					};
				};
				if($scope.UserAll[i].GENDER == 'ស្រី'){
					$scope.UserByGnderF ++;	
					if($scope.UserAll[i].REGISTERED_DATE == dateTY){
						$scope.FemaleDateYesterday ++;				
					};
					if($scope.UserAll[i].REGISTERED_DATE == dateTD){
						$scope.FemaleDateToday ++;				
					};
				};
				if($scope.UserAll[i].ROLE.ROLE_NAME == 'ROLE_ADMIN'){
					$scope.UserByRoleAdmin ++;	
					if($scope.UserAll[i].REGISTERED_DATE == dateTY){
						$scope.AdminDateYesterday ++;				
					};
					if($scope.UserAll[i].REGISTERED_DATE == dateTD){
						$scope.AdminDateToday ++;				
					};
				};
				
				$scope.TotalUserDateToday = $scope.MaleDateToday +  $scope.FemaleDateToday;
				$scope.TotalUserDateYesterday = $scope.MaleDateYesterday + $scope.FemaleDateYesterday;
			}
		
			$scope.PercentMale = parseInt((($scope.UserByGnderM / iter) * 100 + ''));
			$scope.PercentFemale = parseInt((($scope.UserByGnderF / iter) * 100 + ''));
			$scope.PercentAdmin = parseInt((($scope.UserByRoleAdmin / iter) * 100 + ''));
		});
		
	}	
});






