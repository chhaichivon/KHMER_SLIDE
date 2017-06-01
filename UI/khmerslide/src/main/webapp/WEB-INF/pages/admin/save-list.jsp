<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<!-- including style from include/admin/css-include.jsp -->
<jsp:include page="../include/admin/css-include.jsp"></jsp:include>
<%-- <%@ include file="../include/css-include.jsp" %> --%>
</head>
<body data-sidebar-color="sidebar-light" class="sidebar-light" ng-app="saveList" ng-controller="saveListCtrl">
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
						<h4 class="mt-0 mb-5">បញ្ជីររក្សាទុករបស់អ្នកប្រើប្រាស់</h4>
						<br>
						<ol class="breadcrumb mb-0">
							<li><a href="index">Khmer Slide</a></li>
							<li>បញ្ជីររក្សាទុក</li>
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
								<h3 class="widget-title text-center">តារាងបញ្ជីររក្សាទុករបស់អ្នកប្រើប្រាស់</h3>
							</div>
							<div class="widget-body">
								<table id="save-list-table" style="width: 100%"
									class="table table-hover dt-responsive nowrap" datatable="ng" dt-options="dtOptions">
									<thead>
										<tr>
											<th style="width: 16%">លេខរៀង</th>
											<th style="width: 30%">បញ្ជីរឈ្មោះ</th>
											<th style="width: 5%">រក្សាទុកឯកសារ</th>
											<th style="width: 12%">បង្កើតដោយ</th>
											<th style="width: 10%">ស្ថានភាព</th>
											<th style="width: 15%">សកម្មភាព</th>
											<th style="width: 5%">ពត៌មានបន្ថែម</th>
										</tr>
									</thead>
									<tbody>

										<tr ng-repeat="SL in savelist | orderBy:'SL_NAME'">
											<td>{{ $index+1 }}</td>
											<td>
												<div class="media">
													<div class="media-body">
														<h5 class="media-heading">{{SL.SL_NAME}}</h5>
														<p class="text-muted mb-0">បង្កើតថ្ងៃទី: {{SL.SAVED_DATE}}</p>
													</div>
												</div>
											</td>
											<td>{{SL.DOC_ID.DOC_TITLE}}</td>
											<td>{{SL.USER_ID.USER_NAME}}</td>
											<td class="text-center" ng-class="(SL.STATUS == 1) ? 'text-success':'text-danger'"><i ng-class="(SL.STATUS == 1) ? 'ti-check' : 'ti-close'"></i></td>
											<td>
												<div role="toolbar" aria-label="Toolbar with button groups"
													class="btn-toolbar">
													<div role="group" aria-label="First group"
														class="btn-group">
														
														
														<!-- <button type="button" class="btn btn-outline btn-success"
															data-toggle="modal" data-target=".modalView">
															<i class="ti-eye"></i>
														</button> -->
														
														
														
														<!-- button delet -->
														<button type="button"  ng-click="deleteSaveList(SL.SL_ID)" class="btn btn-outline btn-danger">
															<i class="ti-trash"></i>
														</button>
													</div>
												</div>
											</td>
											<td>{{SL.DESCRIPTION}}</td>
										</tr>
									</tbody>
								</table>
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

	<!-- View Modal -->
	<jsp:include page="../include/admin/modal/save-list/save-list-view-include.jsp"></jsp:include>
	
</body>
</html>