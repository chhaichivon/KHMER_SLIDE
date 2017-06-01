<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<!-- including style from include/admin/css-include.jsp -->
<jsp:include page="../include/admin/css-include.jsp"></jsp:include>
</head>

<body data-sidebar-color="sidebar-light" class="sidebar-light"  data-ng-app="CombineWithIndex">
	<!-- Header start-->
	<header>
		<!-- including header from include/admin/header.jsp -->
		<jsp:include page="../include/admin/header.jsp"></jsp:include>
	</header>
	<!-- Header end-->
	<div class="main-container">
		<!-- Main Sidebar start-->
		<aside data-mcs-theme="minimal-dark"
			style="background-image: url(${pageContext.request.contextPath}/resources/static/img/backgrounds/11.jpg)"
			class="main-sidebar mCustomScrollbar">
			<!-- including Main Sidebar from include/admin/main-sidebar-include.jsp -->
			<jsp:include page="../include/admin/main-sidebar-include.jsp"></jsp:include>
		</aside>
		<!-- Main Sidebar end-->
		<div class="page-container">
			<div class="page-header clearfix">
				<div class="row">
					<div class="col-sm-12">
						<h4 class="mt-0 mb-5">សូមស្វាគមន៍ការមកកាន់គេហទំព័រ Khmer
							Slide</h4>
						<!-- <p class="text-muted mb-0">Responsive Web App Kit</p> -->
					</div>
				</div>
			</div>
			<div class="page-content container-fluid">
				<div class="row">
					<div class="col-lg-6" ng-controller="userCount" ng-init="getAllUser()">
						<div class="row">
							<div class="col-lg-12">
								<div class="mb-30">
									<div class="media">
										<div class="media-body">
											<h5 class="media-heading">ចំនួនអ្នកប្រើប្រាស់ថ្មីក្នុងថ្ងៃនេះ</h5>
											<div class="fs-30 fw-600 counter">{{UserByGnderM +
					UserByGnderF}} នាក់</div>
										</div>
										<div class="media-right">
											<i class="fs-30 ti-user"></i>
										</div>
									</div>
									<ul class="list-unstyled">
										<li>
											<div class="block clearfix mb-5">
												<span class="pull-left fs-12">ៃថ្ងនេះ</span><span
													class="pull-right label label-outline label-primary">{{
							TotalUserDateToday }}
													នាក់</span>
											</div>
											<div
												class="progress progress-striped progress-striped progress-xs active">
												<div role="progressbar" data-transitiongoal="100"
													class="progress-bar"></div>
											</div>
										</li>
										<li>
											<div class="block clearfix mb-5">
												<span class="pull-left fs-12">ថ្ងៃម្សិលមិញ</span><span
													class="pull-right label label-outline label-success">{{
							TotalUserDateYesterday }}​​
													នាក់</span>
											</div>
											<div class="progress progress-striped progress-xs">
												<div role="progressbar" data-transitiongoal="100"
													class="progress-bar progress-bar-success"></div>
											</div>
										</li>
									</ul>
									<div id="flot-order" style="height: 74px"></div>
								</div>
							</div>
						</div>
					</div>

					<div class="col-lg-6" ng-controller="documentCount" ng-init="getAllDoc()">
						<div class="row">
							<div class="col-lg-12">
								<div class="mb-30">
									<div class="media">
										<div class="media-body">
											<h5 class="media-heading">ចំនួនឯកសារដែលបានបញ្ចូលថ្ងៃនេះ</h5>
											<div class="fs-30 fw-600 counter">{{DocA}} ច្បាប់</div>
										</div>
										<div class="media-right">
											<i class="fs-30 ti-bookmark-alt"></i>
										</div>
									</div>
									<ul class="list-unstyled">
										<li>
											<div class="block clearfix mb-5">
												<span class="pull-left fs-12">ថ្ងៃនេះ</span><span
													class="pull-right label label-outline label-warning">{{DocTD_S}}
													ច្បាប់</span>
											</div>
											<div class="progress progress-striped progress-xs">
												<div role="progressbar" data-transitiongoal="100"
													class="progress-bar progress-bar-warning"></div>
											</div>
										</li>
										<li>
											<div class="block clearfix mb-5">
												<span class="pull-left fs-12">ថ្ងៃម្សិលមិញ</span><span
													class="pull-right label label-outline label-danger">{{DocTY_A}}
													ច្បាប់</span>
											</div>
											<div class="progress progress-striped progress-xs">
												<div role="progressbar" data-transitiongoal="100"
													class="progress-bar progress-bar-danger"></div>
											</div>
										</li>
									</ul>
								</div>
							</div>
						</div>
					</div>
				</div>
				
				<div>
					<!-- including user-board from include/admin/doc-board-include.jsp -->
					<jsp:include page="../include/admin/doc-board-include.jsp"></jsp:include>
					<!--  -->
				</div>

			</div>
		</div>

		<div ng-controller="sessoinCtrler">
			<!-- Change Profile Picture Modal -->
			<jsp:include
				page="../include/admin/modal/profile/change-profile-picture-include.jsp"></jsp:include>
			<!-- Change User Information Modal -->
			<%-- <jsp:include
						page="../include/admin/modal/profile/change-information.jsp"></jsp:include> --%>
		</div>
		<!-- Right Sidebar start-->
		<jsp:include page="../include/admin/right-side-bar.jsp"></jsp:include>
		<!-- Right Sidebar end-->
	</div>
	<!-- including js from include/admin/js-include.jsp -->
	<jsp:include page="../include/admin/dashboard-js-include.jsp"></jsp:include>
<!-- 		<script>
		$(document).ready(function(){
		var today =$("#today").html();
		console.log(today);
		});
	</script> -->
</body>
</html>
