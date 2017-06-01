<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<!-- including style from include/user/css-include.jsp -->
<jsp:include page="../include/user/css-include.jsp"></jsp:include>
<%-- <%@ include file="../include/css-include.jsp" %> --%>
<style>
[ng\:cloak], [ng-cloak], .ng-cloak {
	display: none !important;
}
</style>
</head>
<body data-sidebar-color="sidebar-light" class="sidebar-light"
	ng-app="CombineWithMyDocument" class="ng-cloak">
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
		<div class="page-container">
			<div class="page-header clearfix">
				<div class="row">
					<div class="col-sm-12">
						<h4 class="mt-0 mb-5">គ្រប់គ្រងឯកសារ</h4>
						<br>
						<ol class="breadcrumb mb-0">
							<li><a href="index">KhmerSLIDE</a></li>
							<li class="active">ឯកសារ</li>
						</ol>
					</div>
				</div>
			</div>
			<div class="page-content container-fluid">



				<div class="row" ng-controller="myDocumentCtrl">
					<div class="col-md-12">
						<div class="widget">
							<div class="widget-heading">
								<h3 class="widget-title" style="text-align: center;">គ្រប់គ្រងឯកសារ</h3>
							</div>
							<div class="widget-body">
								<table id="doc-list-table" style="width: 100%"
									class="table table-hover dt-responsive nowrap" datatable="ng"
									dt-options="dtOptions">
									<thead>
										<tr>
											<th style="width: 5%"></th>
											<th style="width: 40%"></th>
											<th style="width: 10%"></th>
											<th style="width: 25%"></th>
										</tr>
									</thead>
									<tbody>
										<tr ng-repeat="d in document">
											<td>
												<div role="toolbar" aria-label="Toolbar with button groups"
													class="btn-toolbar">
													<div role="group" aria-label="First group"
														class="btn-group-vertical">
														<button type="button" class="btn btn-outline btn-success"
															data-toggle="modal" data-target=".modalView"
															ng-click="viewDocId( d.DOC_ID )">
															<i class="ti-eye"></i>
														</button>
														<button data-toggle="modal" data-target=".modalEdit"
															ng-click="update(d.DOC_ID)" type="button"
															class="btn btn-outline btn-warning">
															<i class="ti-pencil"></i>
														</button>
														<button type="button" class="btn btn-outline btn-danger"
															ng-click="remove(d.DOC_ID)">
															<i class="ti-trash"></i>
														</button>
													</div>
												</div>
											</td>
											<td>
												<div class="media">
													<div class="media-left">
														<a
															href="/view/?doc={{ d.DOC_ID }}&cat={{ d.CATEGORY.CAT_ID }}"
															title="{{d.DOC_TITLE}}"> <img
															src="{{ urls }}{{ d.THUMBNAIL }}" alt=""
															class="media-object" width="150" height="100"></a> <span
															class="status bg-success"></span>
													</div>
													<div class="media-body">
														<a
															href="/view/?doc={{ d.DOC_ID }}&cat={{ d.CATEGORY.CAT_ID }}"
															title="{{d.DOC_TITLE}}"><h5 class="media-heading">
																{{d.DOC_TITLE}}
																<button class="btn btn-outline btn-rounded bg-danger">
																	<i class="fa fa-file-powerpoint-o text-white">{{d.DOC.DOC_NAME}}</i>
																</button>
															</h5></a>
														<p class="text-muted mb-0">បញ្ចូលថ្ងៃទី:{{d.UPLOADED_DATE}}</p>
													</div>
												</div>
											</td>
											<td>
												<div class="media">
													<div class="media-body text-right">
														<i class="fa fa-globe"></i>
														<p class="text-muted mb-0">{{d.VIEWED}} views</p>
													</div>
												</div>
											</td>
											<td>
												<div class="media">
													<div class="media-body text-right">
														<p class="text-muted mb-0">
															<i class="fa fa-thumbs-up"></i> {{d.LIKED}}
														</p>
														<p class="text-muted mb-0">
															<i class="fa fa-share"></i> {{d.SHARED}}
														</p>
													</div>
												</div>
											</td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
						
										<!-- Edit Modal -->
				<jsp:include
					page="../include/user/modal/document/document-edit-include.jsp"></jsp:include>

						<!-- View Modal -->
						<div class="col-md-3 col-sm-6">
							<div tabindex="-1" role="dialog"
								aria-labelledby="myAnimationModalLabel"
								class="modal animated fadeInLeft modalView">
								<div role="document" class="modal-dialog">
									<div class="modal-content">
										<div class="modal-header">
											<button type="button" data-dismiss="modal" aria-label="Close"
												class="close">
												<span aria-hidden="true">×</span>
											</button>
											<h4 id="myAnimationModalLabel"
												class="modal-title text-primary">បង្ហាញឯកសារ</h4>
										</div>
										<div class="modal-body">
											<div class="row">
												<div class="blog-image">
													<div class='embed-responsive embed-responsive-4by3'>
														<iframe data-ng-src="{{urlsX}}" frameborder="0"
															allowfullscreen="true" mozallowfullscreen="true"
															webkitallowfullscreen="true" allowprint="true"></iframe>
														<!-- 													<iframe src="https://drive.google.com/file/d/0B2WJOSpqcAkyLW1wWFBuNm1FNTA/preview"></iframe> -->
													</div>
												</div>
											</div>
										</div>
										<div class="modal-footer">
											<button type="button" ng-click="close()" data-dismiss="modal"
												class="btn btn-raised btn-danger">
												<i class="fa fa-close text"></i> បោះបង់
											</button>
										</div>
									</div>
								</div>
							</div>
						</div>

						<!-- END MODEL -->

					</div>
				</div>



			</div>
		</div>

		<!-- Right Sidebar start-->
		<jsp:include page="../include/user/right-side-bar.jsp"></jsp:include>
		<!-- Right Sidebar end-->
		<!-- including js from include/user/js-include.jsp -->
		<jsp:include page="../include/user/js-include.jsp"></jsp:include>
	</div>

</body>
</html>