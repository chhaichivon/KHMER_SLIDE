var app = angular.module('homePage', [ 'ui.bootstrap' ]);

// =========================Session========================================
app.controller('sessoinCtrl', function($rootScope, $scope, $filter, $http, $sce) {
	$scope.user = '';
//	 $scope.urls = $sce.trustAsResourceUrl("http://192.168.178.152:9999");
	$scope.urls = $sce.trustAsResourceUrl("http://localhost:9999");
	$scope.photo = "/resources/static/img/users/default-user-image.png";
	$rootScope.role = 0;
	
	// ================================= User By ID Function=================================

	$scope.User = function(id) {
		$http({
			url : '/rest/user/' + id + '',
			method : 'GET'
		}).then(function(response) {
			// console.log(response);
			$scope.user = response.data.DATA[0];
			$scope.USER_ID = $scope.user.USER_ID;
			$scope.txtName = $scope.user.USER_NAME;
			$scope.photo = $scope.user.PHOTO;
			$rootScope.role = $scope.user.ROLE.ROLE_ID;
			isUserLoaded = true;
		}, function() {

		});
	}

	if (logId != "") {
		$scope.User(logId);

	}

	// =================================Comment Document Function=================================
	// var urlCat = $location.absUrl();
	var doc = getUrlVars()["doc"];
	$scope.doc = doc;
	$scope.date = $filter('date')(new Date(), 'dd-MMM-yyyy');
	$scope.insertComment = function() {
		$http({
			// url : 'http://192.168.178.152:9999/api/docs/add-ducument',
			url : "/rest/comment",
			data : {
				"cmt_text" : $scope.txtComment,
				"cmt_date" : $scope.date,
				"status" : 1,
				"user_id" : logId,
				"doc_id" : $scope.doc,
				"description" : $scope.txtComment
			},
			method : 'POST',
		}).then(function(response) {
			// console.log(response.data);
			$scope.txtComment = '';
			$scope.commentId(doc);

		}, function() {

		});
	}
	var comment = $("#txtComment").val();
	if (logId != "" && comment != "" && doc === 'undefined') {
		$scope.insertComment();

	} else if (comment != "" && doc === 'undefined') {
		$scope.insertComment();
	}
});

// ========================== function get param from url==========================================
function getUrlVars() {
	var vars = [], hash;
	var hashes = window.location.href.slice(
			window.location.href.indexOf('?') + 1).split('&');
	for (var i = 0; i < hashes.length; i++) {
		hash = hashes[i].split('=');
		vars.push(hash[0]);
		vars[hash[0]] = hash[1];
	}
	return vars;
}

var pageInitialized = false;
//var pageInitializedSaveList = false;

// create controller
app
		.controller(
				'viewCtrl',
				function($rootScope, $scope, $http, $filter, $location, $sce) {
					
					$scope.document = '';
					$scope.cat = '';
				
					 //$scope.thumb =$sce.trustAsResourceUrl("http://192.168.178.152:9999");
					 $scope.thumb =$sce.trustAsResourceUrl("http://localhost:9999");
					// =====Get User ID==============
						var doc_id = $('#doc-id').val();

					// =================================Add View History Function=================================
					$scope.date = $filter('date')(new Date(), 'dd-MMM-yyyy');
					$scope.viewHistory = function() {
						$http({
							url : '/rest/view-history',
							data : {
								"added_date" : $scope.date,
								"user_id" : logId,
								"doc_id" : doc_id,
								"description" : $scope.date,
							},
							method : 'POST'
						}).then(function() {
							isViewed = true;
						}, function() {

						});
					}
					
					function init() {
						if (pageInitialized)
							return;
						pageInitialized = true;
						
						 if(logId != null){
							 $scope.viewHistory();
						 }
					};
					
					init();
					
					
					
					// =================================Add Document to Save List Function=================================
					$scope.date = $filter('date')(new Date(), 'dd-MMM-yyyy');
					$scope.saveDoc = function(id) {
						$http({
							url : '/rest/save-list/save-doc',
							data : {
								  "status": 1,
								  "sl_id": id,
								  "doc_id": doc_id
								},
							method : 'POST'
						}).then(function() {
							swal("រក្សាទុកបានសម្រេច!");
						}, function() {

						});
					}
					
					
					// ================================= Get Save List By User ID Function=================================
					$scope.savelist = '';
					$scope.saveList = function(id){
						$http({
						url: '/rest/save-list/by-user-id/' + id + '',
						method: 'GET'
					}).then(function(repsonse){
						//console.log(repsonse);
						$scope.savelist=repsonse.data.DATA;
					}, function(){
					});
					}

					if (logId != "") {
						$scope.saveList(logId);

					}

					
					// =================================Create and Add Document to Save List Function=================================
					$scope.date = $filter('date')(new Date(), 'dd-MMM-yyyy');
					
					$('#btnSave').click(function(){
						$scope.createSaveList();
					});
					
					$scope.createSaveList = function() {
						$http({
							url : '/rest/save-list',
							data : {
								  "sl_name": $scope.txtSaveListName,
								  "saved_date": $scope.date,
								  "status": 1,
								  "user_id": logId,
								  "doc_id": doc_id,
								  "description": $scope.txtSaveListName
								},
							method : 'POST'
						}).then(function(response) {
							//console.log(response);
							swal("ជោគជ័យក្នុុងការបង្កើត!");
							// window.location.reload();
							$scope.saveList(logId);
							 window.setTimeout(function(){ } ,1000);
						}, function() {

						});
					}
					
					
					
					// =================================Update Number Like of Document Function=================================
					//var isUpdate = false;
					if(logId !=""){
					$scope.updateLike = function() {
						var like = parseInt($scope.document.LIKED) + 1;
						$http({
							url : '/rest/document/update-document/like',
							data : {
								"doc_id" : doc_id,
								"liked" : like
							},
							method : 'PUT'
						}).then(function(response) {
							$scope.docId(doc_id);
							 window.setTimeout(function(){ } ,1000);
							//isUpdate = true;
							// $scope.docId(doc_id);

						}, function() {
						});
					}
					
						//$scope.updateLike();
					}
					
					
					
					// =================================Update Number View of Document Function=================================
					var isUpdate = false;

					$scope.submit = function() {
						var view = parseInt($scope.document.VIEWED) + 1;
						$http({
							url : '/rest/document/update-document/view',
							data : {
								"doc_id" : doc_id,
								"viewed" : view
							},
							method : 'PUT'
						}).then(function(response) {
							isUpdate = true;
							// $scope.docId(doc_id);

						}, function() {
						});
					}

					// =================================View Document Function=================================
					$scope.docId = function(id) {
						$http({
							url : '/rest/document/' + id + '',
							method : 'GET'
						})
								.then(
										function(response) {
											// console.log(response);
											$scope.document = response.data.DATA[0];
											$scope.txtTitle = $scope.document.DOC_TITLE;
											$scope.docUrl = $scope.document.URL;
											$scope.docType = $scope.document.TYPE;
											$scope.date = $scope.document.UPLOADED_DATE;
											$scope.view = $scope.document.VIEWED;
											$scope.like = $scope.document.LIKED;
											$scope.share = $scope.document.SHARED;
											$scope.description = $scope.document.DESCRIPTION;

											$scope.uploadBy = $scope.document.USER.USER_NAME;
											$scope.uploaderPhoto = $scope.document.USER.PHOTO;
											$scope.cat = $scope.document.CATEGORY.CAT_ID;

											if ($scope.docType == 1) {
												$scope.urls = $sce
														.trustAsResourceUrl("https://docs.google.com/presentation/d/"
																+ $scope.docUrl
																+ "/preview?start=true&loop=true&delayms=30000");
											} else if ($scope.docType == 2) {
												$scope.urls = $sce
														.trustAsResourceUrl("https://drive.google.com/file/d/"
																+ $scope.docUrl
																+ "/preview");
											} else if ($scope.docType == 3) {
												$scope.urls = $sce
														.trustAsResourceUrl("https://docs.google.com/document/d/"
																+ $scope.docUrl
																+ "/preview");
											}
											if (!isUpdate) {
												$scope.submit();
											}

										}, function() {

										});
					}

					// Get Path Variable from URL
					// var url = $location.absUrl();
					var doc = getUrlVars()["doc"];
					// $scope.docId(doc);
					$scope.docId(doc_id);

					// $scope.test = "https://docs.google.com/presentation/d/"+
					// $scope.docUrl
					// +"/embed?start=true&loop=true&delayms=30000";

					// =================================Recommend Document Function=================================
					var cat = getUrlVars()["cat"];
					var num = 0;
					// var category = $scope.cat;
					$scope.recom = '';
					$scope.recommend = function(num) {
						$("#loader").show();
						$scope.number = num + 5;
						// alert(limit);
						$http({
							url : '/rest/document/recomment/' + cat + '?limit=' + $scope.number +'',
							method : 'GET',
						}).then(function(response) {
							// console.log(response);
							$("#loader").hide();
							$scope.recom = response.data.DATA;

						}, function() {

						});
					}
					// Get Path Variable from URL
					// var urlCat = $location.absUrl();
					
					$scope.recommend(num);
					$("#limit").click(function(){
						$("#limit").hide();
					});

				});

// create controller
app.controller('documentByCatCtrl', function($scope, $http, $filter, $location,
		$sce) {
	$scope.document = '';
//	 $scope.thumb = $sce.trustAsResourceUrl("http://192.168.178.152:9999");
	$scope.thumb = $sce.trustAsResourceUrl("http://localhost:9999");
	var docType = $("#type").val();

	// =================================Get Document By Filter Function=================================
	var cat = '';
	var num = 0;
	$scope.catId = function(num) {
		$("#loader").show();
		$scope.number = num + 8;
		$http({
			url : '/rest/document/by-cat-id/' + cat + '?limit=' + $scope.number + '',
			method : 'GET'
		}).then(function(response) {
			$("#loader").hide();
			// console.log(response);
			$scope.document = response.data.DATA;
			$scope.count = response.data.COUNT;
			if(($scope.document.length) >= $scope.number){
				
				$("#limit").show();
			}else{
				$("#limit").hide();
			}

		}, function() {

		});
	}
	
	$scope.catAndType = function(num) {
		$("#loader").show();
		$scope.number = num + 8;
		$http({
			url : '/rest/document/by-cat-type/' + cat +'/' + docType + '?limit=' + $scope.number + '',
			method : 'GET'
		}).then(function(response) {
			$("#loader").hide();
			// console.log(response);
			$scope.document = response.data.DATA;
			$scope.count = response.data.COUNT;
			if(($scope.document.length) >= $scope.number){
				
				$("#limit").show();
			}else{
				$("#limit").hide();
			}

		}, function() {

		});
	}

	// Get Path Variable from URL
	if(docType == ""){
		if($("#cat-id").val() !="" && $("#sub-id").val() !=""){
			var cat = $("#sub-id").val()
			$scope.catId(num);
		}else if($("#cat-id").val() !=""){
			var cat = $("#cat-id").val()
			$scope.catId(num);
		}
	}else if(docType != ""){
		if($("#cat-id").val() !="" && $("#sub-id").val() !=""){
			var cat = $("#sub-id").val()
			$scope.catAndType(num);
		}else if($("#cat-id").val() !=""){
			var cat = $("#cat-id").val()
			$scope.catAndType(num);
		}
	}
	

	// =================================Get Document By Searching Over CATEGORY ID Function=================================
	$scope.search = function(keyword) {
		$http({
			url : '/rest/document/search/' + keyword + '',
			method : 'GET'
		}).then(function(response) {
			// console.log(response);
			$scope.document = response.data.DATA;
			//$scope.count = response.data.COUNT;

		}, function() {

		});
	}
	
	$scope.search($('#keyword').val());
	
	
	
});

// ==============================create category controller of Home Page===========================================
app.controller('categoryCtrl', function($scope, $http, $filter) {
	$scope.category = '';

	// =================================List of Category=================================
	$scope.list = function() {
		$http({
			url : '/rest/category/get-main-category/',
			method : 'GET'
		}).then(function(repsonse) {
			// console.log(repsonse);
			$scope.category = repsonse.data.DATA;
			$scope.categoryLength = [];
			for (var i = 0; i < $scope.category.length / 2; i++) {
				$scope.categoryLength.push(i);
			}
		}, function() {

		});
	}

	$scope.list();

}).directive(
		"owlCarousel",
		function() {
			return {
				restrict : 'E',
				transclude : false,
				link : function(scope) {
					scope.initCarousel = function(element) {
						// provide any default options you want
						var defaultOptions = {
							// loop:true,
							// autoplay: true,
							// autoplayTimeout:1000,
							responsive : {
								0 : {
									items : 1,
								},
								450 : {
									items : 1,
								},
								767 : {
									items : 2,
								},
								991 : {
									items : 3,
								},
								1199 : {
									items : 3,
								}
							}
						};
						var customOptions = scope.$eval($(element).attr(
								'data-options'));
						// combine the two options objects
						for ( var key in customOptions) {
							defaultOptions[key] = customOptions[key];
						}
						// init carousel
						$(element).owlCarousel(defaultOptions);
					};
				}
			};
		}).directive('owlCarouselItem', [ function() {
	return {
		restrict : 'A',
		transclude : false,
		link : function(scope, element) {
			// wait for the last item in the ng-repeat then call init
			if (scope.$last) {
				scope.initCarousel(element.parent());
			}
		}
	};
} ]);

// ==============================create category controller of Category Page===========================================
app.controller('catCtrl', function($scope, $http, $filter) {
	$scope.category = '';

	// =================================Get Main Category By ID=================================
	$scope.catID = function(id) {
		$http({
			url : '/rest/category/' + id + '',
			method : 'GET'
		}).then(function(repsonse) {
			// console.log(repsonse);
			$scope.category = repsonse.data.DATA[0];
			$scope.txtMainCategory = $scope.category.CAT_NAME;
			$scope.MCategoryId = $scope.category.CAT_ID;

		}, function() {

		});
	}

	// =================================Get Sub Category By ID=================================
	$scope.subCatID = function(id) {
		$http({
			url : '/rest/category/' + id + '',
			method : 'GET'
		}).then(function(repsonse) {
			// console.log(repsonse);
			$scope.subCat = repsonse.data.DATA[0];
			$scope.txtSubCategory = $scope.subCat.CAT_NAME;

		}, function() {

		});
	}
	// <=================================Check if Sub Category is Undefined By ID=================================>
	var sub = getUrlVars()["sub"];
	if (sub === undefined) {
		$scope.txtSubCategory = '';
		$("#sub").hide();
	} else {
		$scope.subCatID(sub);
	}

	// if()

	// =================================Get Sub Category By Parent ID=================================
	$scope.subCategory = '';
	$scope.subID = function(id) {
		$http({
			url : '/rest/category/category-by-parent-id/' + id + '',
			method : 'GET'
		}).then(function(repsonse) {
			// console.log(repsonse);
			$scope.subCategory = repsonse.data.DATA;
			// $scope.txtSubCategory = $scope.subCategory.CAT_NAME;

		}, function() {

		});
	}

	var cat = getUrlVars()["cat"];
	$scope.catID(cat);
	$scope.subID(cat);

});

// create controller
app.controller('documentCtrl', function($scope, $http, $filter, $sce) {
	$scope.popularDocument = '';
//	 $scope.thumb = $sce.trustAsResourceUrl("http://192.168.178.152:9999");
	$scope.thumb = $sce.trustAsResourceUrl("http://localhost:9999");

	// =================================List of Popular Document=================================
	$scope.docPopularList = function() {
		$http({
			url : '/rest/document/popular/',
			method : 'GET'
		}).then(function(repsonse) {
			// console.log(repsonse);
			$scope.popularDocument = repsonse.data.DATA;
		}, function() {

		});
	}

	$scope.docPopularList();

}).directive(
		"owlCarouselDoc",
		function() {
			return {
				restrict : 'E',
				transclude : false,
				link : function(scope) {
					scope.initCarousel = function(element) {
						// provide any default options you want
						var defaultOptions = {
							autoplay : true,
							autoplayTimeout : 5000,
							responsive : {
								0 : {
									items : 1,
								},
								450 : {
									items : 1,
								},
								767 : {
									items : 2,
								},
								991 : {
									items : 4,
								},
								1199 : {
									items : 4,
								}
							}
						};
						var customOptions = scope.$eval($(element).attr(
								'data-options'));
						// combine the two options objects
						for ( var key in customOptions) {
							defaultOptions[key] = customOptions[key];
						}
						// init carousel
						$(element).owlCarousel(defaultOptions);
					};
				}
			};
		}).directive('owlCarouselDocument', [ function() {
	return {
		restrict : 'A',
		transclude : false,
		link : function(scope, element) {
			// wait for the last item in the ng-repeat then call init
			if (scope.$last) {
				scope.initCarousel(element.parent());
			}
		}
	};
} ]);

// create controller
app.controller('latestDocumentCtrl', function($scope, $http, $filter, $sce) {
	$scope.latestDocument = '';
//	$scope.thumb = $sce.trustAsResourceUrl("http://192.168.178.152:9999");
	$scope.thumb = $sce.trustAsResourceUrl("http://localhost:9999");

	// =================================List of Latest Document=================================
	$scope.docLatestList = function() {
		$http({
			url : '/rest/document/latest/',
			method : 'GET'
		}).then(function(repsonse) {
			// console.log(repsonse);
			$scope.latestDocument = repsonse.data.DATA;
		}, function() {

		});
	}

	$scope.docLatestList();

}).directive(
		"owlCarouselLatestDoc",
		function() {
			return {
				restrict : 'E',
				transclude : false,
				link : function(scope) {
					scope.initCarousel = function(element) {
						// provide any default options you want
						var defaultOptions = {
							autoplay : true,
							autoplayTimeout : 5000,
							responsive : {
								0 : {
									items : 1,
								},
								450 : {
									items : 1,
								},
								767 : {
									items : 2,
								},
								991 : {
									items : 4,
								},
								1199 : {
									items : 4,
								}
							}
						};
						var customOptions = scope.$eval($(element).attr(
								'data-options'));
						// combine the two options objects
						for ( var key in customOptions) {
							defaultOptions[key] = customOptions[key];
						}
						// init carousel
						$(element).owlCarousel(defaultOptions);
					};
				}
			};
		}).directive('owlCarouselLatestDocument', [ function() {
	return {
		restrict : 'A',
		transclude : false,
		link : function(scope, element) {
			// wait for the last item in the ng-repeat then call init
			if (scope.$last) {
				scope.initCarousel(element.parent());
			}
		}
	};
} ]);

// create controller
app.controller('commentCtrl',
		function($scope, $http, $filter, $location, $sce) {
			$scope.comment = '';
			$scope.cat = '';
			// $scope.thumb =
//			 $sce.trustAsResourceUrl("http://192.168.178.152:9999");
			$scope.thumb = $sce.trustAsResourceUrl("http://localhost:9999");

			// ========================== function get param from url==========================================
			function getUrlVars() {
				var vars = [], hash;
				var hashes = window.location.href.slice(
						window.location.href.indexOf('?') + 1).split('&');
				for (var i = 0; i < hashes.length; i++) {
					hash = hashes[i].split('=');
					vars.push(hash[0]);
					vars[hash[0]] = hash[1];
				}
				return vars;
			}

			// =================================Get Comment Function=================================
			$scope.commentId = function(id) {
				$http({
					url : '/rest/comment/by-document/' + id + '',
					method : 'GET'
				}).then(function(response) {
					// console.log(response);
					$scope.comment = response.data.DATA;

				}, function() {

				});
			}

			// Get Path Variable from URL
			// var url = $location.absUrl();
			var com = getUrlVars()["doc"];
			;
			$scope.commentId(com);

			// $scope.test = "https://docs.google.com/presentation/d/"+
			// $scope.docUrl +"/embed?start=true&loop=true&delayms=30000";

		});

// ===========================Sign Up for an Account==========================
app.controller('signinctrl', function($scope, $http, $filter) {

	$scope.date = $filter('date')(new Date(), 'dd-MMM-yyyy');
	$scope.BlakPass = false;
	$scope.noMatch = false;
	$scope.match = function() {
		if (typeof $scope.txtPassword === "undefined") {
			$scope.BlakPass = true;

		} else {
			$scope.BlakPass = false;
			if ($scope.txtPassword != $scope.txtConfirmPassword) {
				$scope.noMatch = true;
				// alert("NO Match " + $scope.tt + $scope.noMatch);
			} else {
				$scope.noMatch = false;
				// alert("OK Match " + $scope.tt + $scope.noMatch);
			}
		}
	}

	$scope.signup = function() {
		$http({
			url : '/rest/user',
			method : 'POST',
			data : {
				"user_name" : $scope.txtusername,
				"gender" : $scope.txtGender,
				"email" : $scope.txtemail,
				"password" : $scope.txtPassword,
				"photo" : "/resources/static/img/users/default-user-image.png",
				"registered_date" : $scope.date,
				"status" : 1,
				"role_id" : 2
			}
		}).then(function(repsonse) {
			// alert($scope.txtusername + " " + $scope.txtGender + " " +
			// $scope.txtemail +" "+ $scope.txtPassword + " "+ utc)
			swal({
				title : "អបអរសាទរ !",
				text : "អ្នក បាន ចុះឈ្មោះជោគជ័យក្នុង KhmerSlide",
				type : "success",
				showConfirmButton : false,
				timer : 3000
			}, function() {
				window.location.assign("/login");
			});

		}, function() {

		});
	}
});



//	====================Category=========================================
app.controller('categoryListCtrl', function ($scope, $http, $filter) {
	$scope.category = '';


		$scope.catList = function(){
			$http({
			url: '/rest/category',
			method: 'GET'
		}).then(function(repsonse){
			// console.log(repsonse);
			$scope.category=repsonse.data.DATA;
		}, function(){

		});
		}

		$scope.catList();
});


//create controller
app.controller('documentListCtrl', function($scope, $filter, $http, $sce) {
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
	

	$scope.docList = function() {
		$http({
			url : '/rest/document',
			method : 'GET'
		}).then(function(repsonse) {
			// console.log(repsonse);
			$scope.document = repsonse.data.DATA;
		}, function() {

		});
	}

	$scope.docList();
	
	
	//	=============Search Trigger from Home Page============
	$scope.searchToPage = function (word){
		window.location.href = "/category/?term="+ word +"";
	};
	
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
	//$scope.image = "http://localhost:9999/resources/static/img/thumbnails/book.jpg";
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
			//	console.log(data);
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

	$scope.txtUploadBy = logId;
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
			$scope.docList();
			location.reload();

		}, function() {

		});
	}
});

