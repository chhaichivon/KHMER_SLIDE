<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<!-- including style from include/admin/css-include.jsp -->
<jsp:include page="../include/admin/css-include.jsp"></jsp:include>
<style>
	[ng\:cloak], [ng-cloak], .ng-cloak {
  display: none !important;
}
</style>
<%-- <%@ include file="../include/css-include.jsp" %> --%>
</head>
<body data-sidebar-color="sidebar-light" class="sidebar-light"
	ng-app="categoryList" ng-controller="categoryListCtrl">
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
						<h4 class="mt-0 mb-5">តារាងមីនុយ</h4>
						<br>
						<ol class="breadcrumb mb-0">
							<li><a href="index">Khmer Slide</a></li>
							<li><a id="dropdownMenu2" href="#" data-toggle="dropdown"
								role="button">មីនុយ</a>
								<ul aria-labelledby="dropdownMenu2"
									class="dropdown-menu fs-12 animated fadeInDown">
									<li><a data-toggle="modal" data-target=".modalAdd"><i
											class="ti-plus mr-5"></i> បញ្ចួលថ្មី</a></li>
									<li><a data-toggle="modal" data-target=".modalEdit"><i
											class="ti-pencil mr-5"></i> កំណែប្រែថ្មី</a></li>
								</ul></li>
							<li class="active">តារាង</li>
						</ol>
					</div>
				</div>
			</div>
			<div class="page-content container-fluid">
				<div class="row">
					<div class="col-md-12">
						<div class="widget">
							<div class="widget-heading">
								<button type="button" class="btn btn-outline btn-success"
									data-toggle="modal" data-target=".modalAdd">
									<i class="ti-plus"></i> បញ្ចូលថ្មី
								</button>
								<h3 class="widget-title text-center">តារាងមីនុយ</h3>
							</div>
							<div class="widget-body">
								<table id="cat-list-table" style="width: 100%"
									class="table table-hover dt-responsive nowrap"
									datatable="ng" dt-options="dtOptions">
									<thead>
										<tr>
											<th style="width: 5%">លេខរៀង</th>
											<th style="width: 30%">ឈ្មោះមីនុយ</th>
											<th style="width: 5%">ស្ថិតក្រោមមីនុយ</th>
											<th style="width: 12%">បញ្ចុលដោយ</th>
											<th style="width: 10%">ស្ថានភាព</th>
											<th style="width: 35%">&nbsp;&nbsp;&nbsp;&nbsp;សកម្មភាព&nbsp;&nbsp;&nbsp;&nbsp;</th>
											<th style="width: 5%">ពត៌មានបន្ថែម</th>
										</tr>
									</thead>
									<tbody>
										<tr ng-repeat="c in category | orderBy:'CAT_NAME'">
											<td ng-cloak>{{ $index + 1}}</td>
											<td class="ng-cloak">
												<div class="media">
													<div class="media-body">
														<h5 class="media-heading" ng-bind="c.CAT_NAME"></h5>
														<p class="text-muted mb-0" ng-cloak>បញ្ចូលថ្ងៃទី:
															{{c.CREATED_DATE}}</p>
													</div>
												</div>
											</td>
											<td ng-cloak>{{c.PARENT.CAT_NAME}}</td>
											<td ng-cloak>{{c.USER.USER_NAME}}</td>
											<td class="text-center"
												ng-class="(c.STATUS == 1) ? 'text-success':'text-danger'"><i
												ng-class="(c.STATUS == 1) ? 'ti-check' : 'ti-close'"></i></td>
											<td>
												<div role="toolbar" aria-label="Toolbar with button groups"
													class="btn-toolbar">
													<div role="group" aria-label="First group"
														class="btn-group">
														<button type="button" class="btn btn-outline btn-warning"
															data-toggle="modal" data-target=".modalEdit" ng-click="update(c.CAT_ID)">
															<i class="ti-pencil"></i>
														</button>
														<button type="button" class="btn btn-outline btn-danger" ng-click="remove(c.CAT_ID)">
															<i class="ti-trash"></i>
														</button>
													</div>
												</div>
											</td>
											<td ng-cloak>{{c.DESCRIPTION}}</td>
										</tr>
									</tbody>
								</table>
								<!-- Add Modal -->
								<jsp:include
									page="../include/admin/modal/category/category-add-include.jsp"></jsp:include>
								<!-- Edit Modal -->
								<jsp:include
									page="../include/admin/modal/category/category-edit-include.jsp"></jsp:include>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

		<!-- Right Sidebar start-->
		<jsp:include page="../include/admin/right-side-bar.jsp"></jsp:include>
		<!-- Right Sidebar end-->
	</div>

	<!-- including js from include/admin/js-include.jsp -->
	<jsp:include page="../include/admin/js-include.jsp"></jsp:include>




</body>
</html>