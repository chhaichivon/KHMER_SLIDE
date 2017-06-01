var app = angular.module('documentList', [ "datatables" ]);

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


// create controller
app.controller('documentListCtrl', function($scope, $filter, $http,
		DTOptionsBuilder, $sce) {
	$scope.document = '';
	$scope.FILE_URL = '';
//	$scope.urls = $sce.trustAsResourceUrl("http://192.168.178.152:9999");
	$scope.urls = $sce.trustAsResourceUrl("http://localhost:9999");
	$scope.submitForm = function() {

		// check to make sure the form is completely valid
		if ($scope.insertForm.$valid) {
			swal({
                title: "បញ្ចូលទិន្នន័យ!",
                text:  "ទិន្នន័យត្រូវបានបញ្ចូលបានសម្រាច់",
                type: "success",
                timer: 3000,
                showConfirmButton: false
            });
        window.setTimeout(function(){ } ,3000);
			location.reload();
			// $scope.insert();
		}

	};
	
	// DataTables configurable options
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
			url : '/rest/document',
			method : 'GET'
		}).then(function(repsonse) {
			// console.log(repsonse);
			$scope.document = repsonse.data.DATA;
		}, function() {

		});
	}

	$scope.list();

	// =================================Add Document Function=================================
	
	// <=================================Upload File=================================>
	$('#input-14').change(function(){
		var imgUrl = window.location.origin + "/resources/static/img/loader.gif";
		var title = $('#txtTitle').val();
		var ddlCategories = $('#ddlCategories').val().split(',')[1];
		var ddlType = $('#ddlType').val();
		var formData = new FormData();
		formData.append('doc', $("#input-14")[0].files[0]);
		formData.append('title', title);
		formData.append('type', ddlType);
		formData.append('category', ddlCategories);
		 $.ajaxSetup({
			 	globle: false,
//				url : "http://192.168.178.152:9999/api/docs/add-ducument/file",
			 	url : "http://localhost:9999/api/docs/add-ducument/file",
				type : "POST",
				enctype : 'multipart/form-data',
	            beforeSend: function (xhr) {
	            	
	     			    swal({
	     			    	title: "ឯកសារកំពុងត្រូវបានបញ្ចូល",
		                    text:  "សូមមេត្តាធ្វើការរងចាំ!",
		                    showConfirmButton: false,
		                    imageUrl: imgUrl
	     			    });
	 				xhr
						.setRequestHeader(
								'Authorization',
								'Basic a3NsOmtzbGFwaQ==');
	            },
	            complete: function () {
	            	swal({
	                    title: "បញ្ចូលបានជោគជ័យ!",
	                    text:  "សូមអរគុណ",
	                    type: "success",
	                    timer: 3000,
	                    showLoaderOnConfirm: true,
	                    showConfirmButton: false
	                });
	            window.setTimeout(function(){ } ,3000);
	            }
	        });
		
		$.ajax({
			data : formData,
			cache : false,
			crossDomain : true,
			processData : false, // tell jQuery not to process the data
			contentType : false, // tell jQuery not to set contentType
			success : function(data) {
			//	console.log(data);
				$scope.FILE_URL = data.FILE_URL;
			},
			error : function(data) {
				//console.log(data);
			}
		});
		
	});
	// End Upload File
	
	// <=================================Upload Document Thumbnail=================================>
	$('#input-10').change(function(){
		var imgUrl = window.location.origin + "/resources/static/img/loader.gif";
		var formData = new FormData();
		formData.append('img', $("#input-10")[0].files[0]);
		 $.ajaxSetup({
			 	globle: false,
//				url : "http://192.168.178.152:9999/api/docs/add-ducument/thumbnail",
			 	url : "http://localhost:9999/api/docs/add-ducument/thumbnail",
				type : "POST",
				enctype : 'multipart/form-data',
	            beforeSend: function (xhr) {
//	            	
//	     			    swal({
//	     			    	title: "រូបភាពកំពុងត្រូវបានបញ្ចូល",
//		                    text:  "សូមមេត្តាធ្វើការរងចាំ!",
//		                    showConfirmButton: false,
//		                    imageUrl: imgUrl
//	     			    });
	 				xhr
						.setRequestHeader(
								'Authorization',
								'Basic a3NsOmtzbGFwaQ==');
	            },
//	            complete: function () {
//	            	swal({
//	                    title: "បញ្ចូលបានជោគជ័យ!",
//	                    text:  "សូមអរគុណ",
//	                    type: "success",
//	                    timer: 3000,
//	                    showLoaderOnConfirm: true,
//	                    showConfirmButton: false
//	                });
//	            }
	        });
		
		$.ajax({
			data : formData,
			cache : false,
			crossDomain : true,
			processData : false, // tell jQuery not to process the data
			contentType : false, // tell jQuery not to set contentType
			success : function(data) {
			//	console.log(data);
//				swal({
//                    title: "បញ្ចូលបានជោគជ័យ!",
//                    text:  "សូមអរគុណ",
//                    type: "success",
//                    timer: 3000,
//                    showLoaderOnConfirm: true,
//                    showConfirmButton: false
//                });
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
		console.log(catId);
		$scope.catID = catId.split(",");
		$scope.id = $scope.catID[0];
		$scope.folder = $scope.catID[1];
	}
	// end split

	// get value from the change of document type
	$scope.docType = function(val) {
		$scope.Type = val;
	}
	// end document type

	// get value from the change of status
	$scope.status = function(s) {
		$scope.Status = s;
	}
	// end document type

	$scope.txtUploadBy = userId;
	$scope.date = $filter('date')(new Date(), 'dd-MMM-yyyy');
	$scope.insertDoc = function() {
		
		$http({
//			 url : 'http://192.168.178.152:9999/api/docs/add-ducument',
			url : "http://localhost:9999/api/docs/add-ducument",
			
			data : {
				"doc_title" : $scope.txtTitle,
				"uploaded_date" : $scope.date,
				"url" : $scope.FILE_URL,
				"description" : $scope.txtDescription,
				"status" : $scope.Status,
				"user_id" : $scope.txtUploadBy,
				"cat_id" : $scope.id,
				"thumbnail" : $scope.image,
				"source" : $scope.txtSource,
				"doc_type_id" : $scope.Type
			},
			method : 'POST',
			headers: {'Authorization' : 'Basic a3NsOmtzbGFwaQ=='}
		}).then(function(response) {
			console.log(response.data);
			$scope.txtTitle = '';
			$scope.txtSource = '';
			$scope.Type = '';
			$scope.ddlCategories = '';
			$scope.txtDescription = '';
			$scope.list();

		}, function() {

		});
	}
	
});

angular.module("CombineWithUpload", [ "documentList", "categoryList", "saveList" ]);