var app = angular.module('documentList', ["datatables"]);
// create controller
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


app.controller('documentListCtrl', function($scope, $filter, $http,
		DTOptionsBuilder, $sce, $location) {
	
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
				//console.log(data);
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
		var formData = new FormData();
		formData.append('img', $("#input-10")[0].files[0]);
		 $.ajaxSetup({
			 	globle: false,
//				url : "http://192.168.178.152:9999/api/docs/add-ducument/thumbnail",
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

	$scope.txtUploadBy = adminId;
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
			//console.log(response.data);
			$scope.txtTitle = '';
			$scope.txtSource = '';
			$scope.Type = '';
			$scope.ddlCategories = '';
			$scope.txtDescription = '';
			$scope.list();

		}, function() {

		});
	}
	
	
	//=================================Edit Document Function=================================
	var url = $location.absUrl();
	$scope.update = function() {
		// Get Path Variable from URL
		var docId = url.substr(url.lastIndexOf("/") + 1);
		$http({
			url : '/rest/document/' + docId + '',
			method : 'GET'
		}).then(function(response) {
			$scope.document = response.data.DATA[0];
			$scope.DOC_ID = $scope.document.DOC_ID;
			$scope.txtTitle = $scope.document.DOC_TITLE;
//			$scope.ddlStatus = $scope.document.STATUS;
//			$scope.ddlCategories = $scope.document.CATEGORY.CAT_ID;
			$scope.txtSource = $scope.document.SOURCE;
			
		}, function() {
			
		});
	}

	//$scope.update(docId);

	$scope.submit = function() {
		
		$http({
			url : '/rest/document/',
			data : {
				  "doc_id": $scope.DOC_ID,
				  "doc_title": $scope.txtTitle,
				  "description": $scope.txtDescription,
				  "status": $scope.Status,
				  "cat_id": $scope.id,
				  "thumbnail": $scope.image,
				  "source": $scope.txtSource
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
			window.location.href = "/admin/doc-list";
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



//
//
//
////=================================Count Document Function==================================
//
//app.controller('documentCount', function($scope, $http){
//	
//	var docTotalA = 0;	
//	$scope.docTotalFA = function(){	
//		
//		$http({
//			method : 'GET',
//			url : '/rest/document/get-totaldoc-type/' + 0
//		}).then(function(response){			
//			$scope.docTotal = response.data.DATA;
//			
//			if (isNaN($scope.docTotal)){
//				$scope.docTotalA = 0;
//			}else {
//				$scope.docTotalA = $scope.docTotal;	
//				docTotalA = $scope.docTotalA
//				//Refresh();
//			}
//			$scope.docTotalFS();
//		//	alert("OK >> 1 >> " + docTotalA);
//		});
//		
//	}
//	$scope.docTotalFS = function(){
//		$http({
//			method : 'GET',
//			url : '/rest/document/get-totaldoc-type/' + 1
//		}).then(function(response){
//			$scope.docTotal = response.data.DATA;
//			if (isNaN($scope.docTotal)){
//				$scope.docTotalS = 0;
//				$scope.docTotalPS = 0;
//			}else {
//				$scope.docTotalS = $scope.docTotal;
//				var time =  (($scope.docTotalS / docTotalA) * 100) + ' ';
//				$scope.docTotalPS = parseInt(time);
//			}	
//			$scope.docTotalFP();
//		});
//	}
//	$scope.docTotalFP = function(){
//		$http({
//			method : 'GET',
//			url : '/rest/document/get-totaldoc-type/' + 2
//		}).then(function(response){
//			$scope.docTotal = response.data.DATA;
//			if (isNaN($scope.docTotal)){
//				$scope.docTotalP = 0;
//				$scope.docTotalPP
//			}else {
//				$scope.docTotalP = $scope.docTotal;
//				var time =  (($scope.docTotalP / docTotalA) * 100) + ' ';
//				$scope.docTotalPP = parseInt(time);
//	
//			}	
//			$scope.docTotalFW();
//		});
//	}
//	$scope.docTotalFW = function(){
//		$http({
//			method : 'GET',
//			url : '/rest/document/get-totaldoc-type/' + 3
//		}).then(function(response){
//			$scope.docTotal = response.data.DATA;
//			if (isNaN($scope.docTotal)){
//				$scope.docTotalW = 0;
//				$scope.docTotalPW = 0;
//			}else {
//				$scope.docTotalW = $scope.docTotal;
//				var time =  (($scope.docTotalW / docTotalA) * 100) + ' ';
//				$scope.docTotalPW = parseInt(time);					
//			}		
//		});
//	}
//	
//	$scope.docTotalFA();
//});
////angular.module("CombineModule", [ "documentList", "categoryList" ]);
//
//
////======================== View Doc in Part ==========================
//
//app.controller('viewDoc', function($scope, $filter, $http, $sce){
//	
//	$scope.viewDocId = function(id) {
//		$http({
//			url : '/rest/document/' + id + '',
//			method : 'GET'
//		}).then(function(response) {
//		//	console.log(response);
////			$scope.document = response.data.DATA[0];
////			$scope.txtTitle = $scope.document.DOC_TITLE;
//			$scope.docUrlX = $scope.document.URL;
//			$scope.docTypeX = $scope.document.TYPE;
////			$scope.date = $scope.document.UPLOADED_DATE;
////			$scope.view = $scope.document.VIEWED;
////			$scope.like = $scope.document.LIKED;
////			$scope.share = $scope.document.SHARED;
////			$scope.description = $scope.document.DESCRIPTION;
////			
////			$scope.uploadBy = $scope.document.USER.USER_NAME;
////			$scope.uploaderPhoto = $scope.document.USER.PHOTO;
////			$scope.cat = $scope.document.CATEGORY.CAT_ID;
//			
//			if($scope.docType==1){
//				$scope.urlsX = $sce.trustAsResourceUrl("https://docs.google.com/presentation/d/"+ $scope.docUrlX +"/embed?start=true&loop=true&delayms=30000");
//			}else if($scope.docType==2){
//				$scope.urlsX = $sce.trustAsResourceUrl("https://drive.google.com/file/d/"+ $scope.docUrlX +"/preview");
//			}else if($scope.docType==3){
//				$scope.urlsX = $sce.trustAsResourceUrl("https://docs.google.com/document/d/"+ $scope.docUrlX +"/preview");
//			}
//			
//			if(!isUpdate)
//				$scope.submit();
//			
////			category =$scope.cat;
////			alert(category);
//			
////			$scope.ddlStatus = $scope.user.STATUS + '';
////			$scope.ddlGender = $scope.user.GENDER;
////			$scope.txtPassword = $scope.user.PASSWORD;
////			$scope.ddlRole = $scope.user.ROLE.ROLE_ID + '';
//			
//		}, function() {
//
//		});
//	}	
//});




//=================================Count user Function==================================
app.controller('documentCount',function ($scope, $http){
	
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
	var month = ['Jan','Feb','Mar','Apr','May','Jun','Jul','Aug','Sep','Oct','Nov','Dec'];
	var dateTY =  dateYesyterday.getDate() + '-' +  month[dateYesyterday.getMonth()] + '-' +  dateYesyterday.getFullYear();
	var dateTD =  dateToday.getDate() + '-' +  month[dateToday.getMonth()] + '-' +  dateToday.getFullYear();
	
	$scope.getAllDoc = function(){		
		$http({
			url: '/rest/document',
			method: 'GET'
		}).then(function(response){
			//alert(">> OK ");
			$scope.DocAll = response.data.DATA;
			var iter = $scope.DocAll.length;
			for (var i = 0; i < iter; i++){
				if($scope.DocAll[i].TYPE == 1){
					$scope.DocS ++;
					if($scope.DocAll[i].UPLOADED_DATE == dateTY){
						$scope.DocTY_S ++;				
					};
					if($scope.DocAll[i].UPLOADED_DATE == dateTD){
						$scope.DocTD_S ++;				
					};
				};
				if($scope.DocAll[i].TYPE == 2){
					$scope.DocP ++;
					if($scope.DocAll[i].UPLOADED_DATE == dateTY){
						$scope.DocTY_P ++;				
					};
					if($scope.DocAll[i].UPLOADED_DATE == dateTD){
						$scope.DocTD_P ++;				
					};
				};
				if($scope.DocAll[i].TYPE == 3){
					$scope.DocW ++;
					if($scope.DocAll[i].UPLOADED_DATE == dateTY){
						$scope.DocTY_W ++;				
					};
					if($scope.DocAll[i].UPLOADED_DATE == dateTD){
						$scope.DocTD_W ++;				
					};
				};
				$scope.DocA = $scope.DocS + $scope.DocP + $scope.DocW;
				$scope.DocTD_A = $scope.DocTD_S + $scope.DocTD_P + $scope.DocTD_W;
				$scope.DocTY_A = $scope.DocTY_S + $scope.DocTY_P + $scope.DocTY_W;
			}
		
			$scope.DocPP = parseInt((($scope.DocP / iter) * 100 + ''));
			$scope.DocPS = parseInt((($scope.DocS / iter) * 100 + ''));
			$scope.DocPW = parseInt((($scope.DocW / iter) * 100 + ''));
			$scope.DocPA = parseInt((($scope.DocA / iter) * 100 + ''));
		});
		
	}	
});

angular.module("CombineModule", [ "documentList", "categoryList" ]);