<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<!-- including style from include/user/css-include.jsp -->
<jsp:include page="../include/user/css-include.jsp"></jsp:include>
<%-- <%@ include file="../include/css-include.jsp" %> --%>
<style>
	#profile, #info{
		cursor: pointer;
	}
</style>
</head>
<body data-sidebar-color="sidebar-light" class="sidebar-light"
	data-ng-app="CombineWithIndex">
	<!-- Header start-->
	<header>
		<!-- including header from include/user/header.jsp -->
		<jsp:include page="../include/user/header.jsp"></jsp:include>
	</header>
	<!-- Header end-->
	<div class="main-container">
		<!-- Main Sidebar start-->
		<aside data-mcs-theme="minimal-dark"
			style="background-image: url(${pageContext.request.contextPath}/resources/static/img/backgrounds/11.jpg)"
			class="main-sidebar mCustomScrollbar">
			<!-- including Main Sidebar from include/user/main-sidebar-include.jsp -->
			<jsp:include page="../include/user/main-sidebar-include.jsp"></jsp:include>
		</aside>
		<!-- Main Sidebar end-->
		<div class="page-container white">
			<div class="page-header clearfix">
				<div class="row">
					<div class="col-sm-12">
						<h4 class="mt-0 mb-5">សូមស្វាគមន៍ការមកកាន់គេហទំព័រ KhmerSLIDE</h4>
						<!-- <p class="text-muted mb-0">Responsive Web App Kit</p> -->
					</div>
				</div>
			</div>
			<div class="page-content container-fluid"
				data-ng-controller="indexCtrl">
				<div class="row" class="clearfix">
					<div class="pricing-table pricing-3">
						<div class="row row-0">

							<div class="col-md-3 pricing-item" ng-repeat="D in document">
								<a href="/view/?doc={{ D.DOC_ID }}&cat={{ D.CATEGORY.CAT_ID }}"
									title="{{D.DOC_TITLE}}">
									<div class="item cat1">
										<div class="shop-item-list entry">
											<div class="">
												<img src="{{ urls }}{{ D.THUMBNAIL }}" alt=""
													class="media-object">
												<div class="magnifier"></div>
											</div>
											<div class="shop-item-title clearfix">
												<h4 class="text-center" id="subStr">
													<a
														href="/view/?doc={{ D.DOC_ID }}&cat={{ D.CATEGORY.CAT_ID }}"
														title="{{D.DOC_TITLE}}">{{ D.DOC_TITLE}}</a>
												</h4>
												<div class="shopmeta">
													<span class="pull-left">{{D.VIEWED}} views</span>
													<div class="pull-right">
														<span class="pull-left"><i
															class="fa fa-thumbs-o-up text-primary"></i>{{D.LIKED}}
															Likes</span>
													</div>
													<!-- end rating -->
												</div>
												<!-- end shop-meta -->
											</div>
											<!-- end shop-item-title -->
											<div class="visible-buttons">
												<a
													href="/view/?doc={{ D.DOC_ID }}&cat={{ D.CATEGORY.CAT_ID }}"
													title="{{D.DOC_TITLE}}"><span class="ti-eye"></span></a> <a
													href="#"><span class="ti-settings"></span></a>
											</div>
											<!-- end buttons -->
										</div>
										<!-- end relative -->
									</div> <!-- end col -->
								</a>
							</div>

							<div class="row">
								<div class="col-sm-12 text-center">
									<button type="submit" name="btnLoadMore"
										class="btn btn-outline btn-rounded btn-success" ng-init="number=8" ng-click="list(number)" id="limit">
										<i class="ti-reload"></i> ទាញបន្ថែម
									</button>
								</div>
							</div>
						</div>
					</div>
					<!-- Right Sidebar start-->
					<jsp:include page="../include/user/right-side-bar.jsp"></jsp:include>
					<!-- Right Sidebar end-->
						<!-- Change Profile Picture Modal -->
					<jsp:include
						page="../include/user/modal/profile/change-profile-picture-include.jsp"></jsp:include>
					<!-- Change User Information Modal -->
					<jsp:include
						page="../include/user/modal/profile/change-information.jsp"></jsp:include>

				</div>
				<!-- including js from include/user/js-include.jsp -->
				<jsp:include page="../include/user/js-include.jsp"></jsp:include>
</body>
</html>