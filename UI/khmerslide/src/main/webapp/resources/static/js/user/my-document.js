var app = angular.module('myDocument', ["datatables"]);

//=============================Session================================================
//create controller
app.controller('sessoinCtrl', function($scope, $filter, $http, $sce) {
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
	app.controller('myDocumentCtrl', function ($scope, $http, $filter, DTOptionsBuilder, $sce) {
		

		
		$scope.document = '';
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

		$scope.list = function(id){
			$http({
			url: '/rest/document/by-user-id/' + id + '',
			method: 'GET'
		}).then(function(repsonse){
			//console.log(repsonse);
			$scope.document=repsonse.data.DATA;
		}, function(){
		});
		}

		$scope.list(userId);
		

//		=================================Edit Document Function=================================
		// <=================================Upload Document Thumbnail=================================>
		$('#input-10').change(function(){
			var formData = new FormData();
			formData.append('img', $("#input-10")[0].files[0]);
			 $.ajaxSetup({
				 	globle: false,
//					url : "http://192.168.178.152:9999/api/docs/add-ducument/thumbnail",
				 	url : "http://localhost:9999/api/docs/add-ducument/thumbnail",
					type : "POST",
					enctype : 'multipart/form-data',
		            beforeSend: function (xhr) {
		 				xhr
							.setRequestHeader(
									'Authorization',
									'Basic a3NsOmtzbGFwaQ==');
		            },
		        });
			
			$.ajax({
				data : formData,
				cache : false,
				crossDomain : true,
				processData : false, // tell jQuery not to process the data
				contentType : false, // tell jQuery not to set contentType
				success : function(data) {
					//console.log(data);
	            window.setTimeout(function(){ } ,3000);
					$scope.image = data.IMAGE;
				},
				error : function(data) {
					//console.log(data);
				}
			});
			
		});
		// End Upload Document Thumbnail
		
		// get value from the change of category menu select with option 2 values then split it
		$scope.categories = function(catId) {
			//console.log(catId);
			$scope.catID = catId
		}
		// end split

		// get value from the change of status
		$scope.status = function(s) {
			$scope.Status = s;
		}
		$scope.update = function(id) {
			
			$scope.list(userId);
			$http({
				url : '/rest/document/' + id + '',
				method : 'GET'
			}).then(function(response) {
				$scope.document = response.data.DATA[0];
				$scope.DOC_ID = $scope.document.DOC_ID;
				$scope.txtTitle = $scope.document.DOC_TITLE;
//				$scope.ddlStatus = $scope.document.STATUS;
//				$scope.ddlCategories = $scope.document.CATEGORY.CAT_ID;
				$scope.txtSource = $scope.document.SOURCE;
			}, function() {
				
			});
		}
		
		$scope.close = function(){
			window.location.href = "/user/my-document";
		}


		$scope.submit = function() {
			$http({
				url : '/rest/document/',
				data : {
					  "doc_id": $scope.DOC_ID,
					  "doc_title": $scope.txtTitle,
					  "description": $scope.txtDescription,
					  "status": $scope.Status,
					  "cat_id": $scope.catID,
					  "thumbnail": $scope.image,
					  "source": $scope.txtSource
					},
				method : 'PUT'
			}).then(function(response) {
				//console.log(response);
				//$scope.list(userId);
				swal({
		              title: "កំណែប្រែទិន្នន័យ",
		              text:  "ទិន្នន័យត្រូវបានកែប្រែបានសម្រាច់",
		              type: "success",
		              timer: 3000,
		              showConfirmButton: false
		          });
				window.setTimeout(function(){ } ,3000);
				//
				window.location.href = "/user/my-document";
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
		
		//=================================Delete Document Function==================================
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
						url : '/rest/document/delete',
						data : {
							  "doc_id": id,
							  "status": 3
							},
						method : 'PUT'
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
//					swal("បោះបង់", "ទិន្នន័យរបស់អ្នកមានសុវត្ថិភាពដូចដើម :)",
//							"error");
				}
			})
		}
		
		
		// ================= View Doc ==========================
		$scope.viewDocId = function(id) {
			
			
				var imgUrl = window.location.origin + "/resources/static/img/loader.gif";
			    swal({
			    	title: "ឯកសារកំពុងត្រូវបានទាញយក​ !",
	            text:  "សូមមេត្តាធ្វើការរងចាំ!",
	            showConfirmButton: false,
	            imageUrl: imgUrl
			    });
	   
			$http({
				globle: false,
				url : '/rest/document/' + id + '',
				method : 'GET',
					
			}).then(function(response) {
				    
	            swal({
	                    title: "ទិន្នន័យត្រូវបានទាញយកបានសម្រេច!",
	                    text:  "សូមអរគុណ",
	                    type: "success",
	                    timer: 3000,
	                    showLoaderOnConfirm: true,
	                    showConfirmButton: false
	                });
	            window.setTimeout(function(){ } ,3000);
	            
				
				//console.log(response);
				$scope.documentX = response.data.DATA[0];
				$scope.txtTitle = $scope.documentX.DOC_TITLE;
				$scope.docUrlX = $scope.documentX.URL;
				$scope.docTypeX = $scope.documentX.TYPE;
				if($scope.docTypeX==1){
					$scope.urlsX = $sce.trustAsResourceUrl("https://docs.google.com/presentation/d/"+ $scope.docUrlX +"/embed?start=true&loop=true&delayms=30000");
				}else if($scope.docTypeX==2){
					$scope.urlsX = $sce.trustAsResourceUrl("https://drive.google.com/file/d/"+ $scope.docUrlX +"/preview");
				}else if($scope.docTypeX==3){
					$scope.urlsX = $sce.trustAsResourceUrl("https://docs.google.com/document/d/"+ $scope.docUrlX +"/preview");
				}
			//	alert($scope.urlsX);
			}, function() {

			});
			
		}	
		
		$scope.close = function(){
			$scope.list();
		}
});
	
	
	angular.module("CombineWithMyDocument", [ "myDocument", "categoryList", "saveList" ]);