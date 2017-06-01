var app = angular.module('categoryList', ["datatables"]);
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
	app.controller('categoryListCtrl', function ($scope, $http, $filter, DTOptionsBuilder) {
		$scope.category = [];
		



			$scope.list = function(){
				$http({
				url: '/rest/category',
				method: 'GET'
			}).then(function(repsonse){
				// console.log(repsonse);
				$scope.category=repsonse.data.DATA;
				
				
			}, function(){

			});
			}
			

			$scope.list();
			
//		 	=================================DataTables configurable options for Table Category=================================
		    $scope.dtOptions = DTOptionsBuilder.newOptions()
//		    	.withOption('data', $scope.category) 
		    .withPaginationType('full_numbers')
        //.withDisplayLength(2)
        //  .withOption('serverSide', true)
            .withOption('hasBootstrap', true)
      //      .withOption('processing', true)
            .withDisplayLength(10)
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
			
//			=================================Add Category Function=================================
			// get value from the change of category menu select with option 2 values then split it
			$scope.categ = function(catId) {
				$scope.catID = catId.split(",");
				$scope.id = $scope.catID[0];
				$scope.folder = $scope.catID[1];
			}
			// end split
			$scope.txtCreateBy = adminId;
			$scope.status = 1;
			$scope.date = $filter('date')(new Date(), 'dd-MMM-yyyy');
			$scope.insert = function() {
				$http({
					url : '/rest/category',
					data :{
						  "parent_id": $scope.id,
						  "cat_name": $scope.txtCatName,
						  "status": $scope.status,
						  "user_id": $scope.txtCreateBy,
						  "description": $scope.txtDescription,
						  "icon": $scope.ddlIcon,
						  "folder_google_drive": $scope.folder,
						  "created_date": $scope.date
					},
					method : 'POST'
				}).then(function() {
						swal({
			                title: "បញ្ចូលទិន្នន័យ!",
			                text:  "ទិន្នន័យត្រូវបានបញ្ចូលបានសម្រាច់",
			                type: "success",
			                timer: 3000,
			                showConfirmButton: false
			            });
			        window.setTimeout(function(){ } ,3000);
					window.location.href = "/admin/category";
					// console.log(respsonse.data);
//					$scope.txtName = '';
//					$scope.ddlGender = '';
//					$scope.txtEmail = '';
//					$scope.txtPassword = '';
//					$scope.txtConfirmPassword = '';
					$scope.list();
				}, function() {

				});
			}
			
//			=================================Edit Category Function=================================
			$scope.update = function(id) {
				$http({
					url : '/rest/category/' + id + '',
					method : 'GET'
				}).then(function(response) {
					$scope.category = response.data.DATA[0];
					$scope.CAT_ID = $scope.category.CAT_ID;
					$scope.txtCatName = $scope.category.CAT_NAME;
//					$scope.ddlStatus = $scope.user.STATUS + '';
					$scope.ddlIcon = $scope.category.ICON;
					$scope.txtDescription = $scope.category.DESCRIPTION;
					
				}, function() {
					
				});
			}


			$scope.submit = function() {
				$http({
					url : '/rest/category/',
					data : {
							  "parent_id": $scope.ddlCategory,
							  "cat_id": $scope.CAT_ID,
							  "cat_name": $scope.txtCatName ,
							  "status": $scope.ddlStatus,
							  "description": $scope.txtDescription,
							  "icon": $scope.ddlIcon
					},
					method : 'PUT'
				}).then(function(response) {
					//console.log(response);
					swal({
			              title: "កំណែប្រែទិន្នន័យ",
			              text:  "ទិន្នន័យត្រូវបានកែប្រែបានសម្រាច់",
			              type: "success",
			              timer: 3000,
			              showConfirmButton: false
			          });
					window.setTimeout(function(){ } ,3000);
					window.location.href = "/admin/category";
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
			
			//=================================Delete Category Function==================================
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
							url : '/rest/category/delete/' + id +'',
							method : 'DELETE'
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
//						swal("បោះបង់", "ទិន្នន័យរបស់អ្នកមានសុវត្ថិភាពដូចដើម :)",
//								"error");
					}
				})
			}
			
});
	