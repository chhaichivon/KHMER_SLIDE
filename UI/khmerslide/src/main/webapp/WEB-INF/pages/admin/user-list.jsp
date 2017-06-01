<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<!-- including style from include/admin/css-include.jsp -->
<jsp:include page="../include/admin/css-include.jsp"></jsp:include>
<%-- <%@ include file="../include/css-include.jsp" %> --%>
</head>

<body data-sidebar-color="sidebar-light" class="sidebar-light"
	ng-app="userList">

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
						<h4 class="mt-0 mb-5">តារាងអ្នកប្រើប្រាស់</h4>
						<br>
						<ol class="breadcrumb mb-0">
							<li><a href="index">Khmer Slide</a></li>
							<li><a id="dropdownMenu2" href="#" data-toggle="dropdown"
								role="button">អ្នកប្រើប្រាស់</a>
								<ul aria-labelledby="dropdownMenu2"
									class="dropdown-menu fs-12 animated fadeInDown">
									<li><a href="add-user"><i class="fa fa-user-plus mr-5"></i>
											បញ្ចួលថ្មី</a></li>
									<!-- <li><a href="edit-user"><i class="ti-pencil mr-5"></i>
											កំណែប្រែថ្មី</a></li> -->
								</ul></li>
							<li class="active">តារាង</li>
						</ol>
					</div>
				</div>
			</div>
			<div class="page-content container-fluid">
				<!-- including user-board from include/admin/user-board-include.jsp -->
				<jsp:include page="../include/admin/user-board-include.jsp"></jsp:include>


				<div class="row" ng-controller="userListCtrl">
					<div class="col-md-12">
						<div class="widget no-border">
							<table id="user-list-table" style="width: 100%"
								class="table table-hover dt-responsive nowrap" datatable="ng"
								dt-options="dtOptions">
								<thead>
									<tr>
										<th style="width: 50%">សកម្មភាព</th>
										<th style="width: 16%">លេងរៀង</th>
										<th style="width: 37%">ឈ្មោះ</th>
										<th style="width: 2%">ភេទ</th>
										<th style="width: 12%">តួនាទី</th>
										<th style="width: 5%">ស្ថានភាព</th>

									</tr>
								</thead>
								<tbody>
									<tr ng-repeat="u in user">
										<td>
											<div role="toolbar" aria-label="Toolbar with button groups"
												class="btn-toolbar">
												<div role="group" aria-label="First group" class="btn-group">
													<button type="button" class="btn btn-outline btn-success"
														data-toggle="modal" data-target=".modalView"
														ng-click="viewUser(u.USER_ID)">
														<i class="ti-eye"></i>
													</button>
													<a type="button" href="/admin/edit-user/{{u.USER_ID}}"
														class="btn btn-outline btn-warning"> <i
														class="ti-pencil"></i>
													</a>
													<button type="button" class="btn btn-outline btn-danger"
														ng-click="remove(u.USER_ID)">
														<i class="ti-trash"></i>
													</button>
												</div>
											</div>
										</td>
										<td>{{ $index + 1 }}</td>
										<td>
											<div class="media">
												<div class="media-left avatar">
													<img src="{{ urls }}{{ u.PHOTO }}" alt=""
														class="media-object img-circle"><span
														class="status bg-success"></span>
												</div>
												<div class="media-body">
													<h5 class="media-heading">{{u.USER_NAME}}</h5>
													<p class="text-muted mb-0">អីុមែល: {{u.EMAIL}}</p>
												</div>
											</div>
										</td>
										<td>{{u.GENDER}}</td>

										<td>{{(u.ROLE.ROLE_NAME) == 'ROLE_ADMIN' ?
											'អ្នកគ្រប់គ្រងប្រព័ន្ធ':'អ្នកប្រើប្រាស់'}}</td>

										<td class="text-center"
											ng-class="(u.STATUS == 1) ? 'text-success':'text-danger'"><i
											ng-class="(u.STATUS == 1) ? 'ti-check' : 'ti-close'"></i></td>

									</tr>
								</tbody>
							</table>
						</div>
					</div>

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
											class="modal-title text-primary">ពត៌មានលម្អិតរបស់អ្នកប្រើប្រាស់</h4>
									</div>
									<div class="modal-body">
										<div class="row">
											<div class="col-sm-6">
												<p>ឈ្មោះ: {{userName}}</p>
												<p>ភេទ: {{userGender}}</p>
												<p>អីុមែល: {{userEmail}}</p>
												<p>តួនាទី: {{userRole}}</p>
												<p>ចុះឈ្មោះចូលប្រើថ្ងៃទី: {{userRegDate}}</p>
												<p>ស្ថានភាព: {{userStatus}}</p>
												<p>អំពីខ្ញុំ: {{userDescript}}</p>
											</div>
											<div class="col-sm-6">
												<div class="panel panel-info">
													<div class="panel-body" style="text-align: center;">
														<img src="{{ urls }}{{ userPhoto }}" alt="" class="avatar"
															width="150" height="150">
													</div>
												</div>
											</div>
										</div>
									</div>
									<div class="modal-footer">
										<button type="button" data-dismiss="modal"
											class="btn btn-raised btn-danger">
											<i class="fa fa-close text"></i> បោះបង់
										</button>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

		<!-- Right Sidebar start-->
		<%-- <jsp:include page="../include/admin/right-side-bar.jsp"></jsp:include> --%>
		<!-- Right Sidebar end-->
	</div>

	<!-- including js from include/admin/js-include.jsp -->
	<jsp:include page="../include/admin/js-include.jsp"></jsp:include>

	<!-- View Modal -->
	<!-- 	<div class="col-md-3 col-sm-6"> -->
	<!-- 		<div tabindex="-1" role="dialog" -->
	<!-- 			aria-labelledby="myAnimationModalLabel" -->
	<!-- 			class="modal animated fadeInLeft modalView"> -->
	<!-- 			<div role="document" class="modal-dialog"> -->
	<!-- 				<div class="modal-content"> -->
	<!-- 					<div class="modal-header"> -->
	<!-- 						<button type="button" data-dismiss="modal" aria-label="Close" -->
	<!-- 							class="close"> -->
	<!-- 							<span aria-hidden="true">×</span> -->
	<!-- 						</button> -->
	<!-- 						<h4 id="myAnimationModalLabel" class="modal-title text-primary">ពត៌មានលម្អិតរបស់អ្នកប្រើប្រាស់</h4> -->
	<!-- 					</div> -->
	<!-- 					<div class="modal-body"> -->
	<!-- 						<div class="row"> -->
	<!-- 							<div class="col-sm-6"> -->
	<!-- 								<p>ឈ្មោះ: ឃួន សុវណ្ណវត្តី</p> -->
	<!-- 								<p>ភេទ: ស្រី</p> -->
	<!-- 								<p>អីុមែល: vateykhuon@gmail.com</p> -->
	<!-- 								<p>តួនាទី: អ្នកគ្រប់គ្រងប្រព័ន្ធ</p> -->
	<!-- 								<p>ចុះឈ្មោះចូលប្រើថ្ងៃទី: 29th July, 2016</p> -->
	<!-- 								<p>ស្ថានភាព: ដំណើរការ</p> -->
	<!-- 								<p>អំពីខ្ញុំ: I am a girl who is beautiful :P</p> -->
	<!-- 							</div> -->
	<!-- 							<div class="col-sm-6"> -->
	<!-- 								<div class="panel panel-info"> -->
	<!-- 					                <div class="panel-body" style="text-align: center;"> -->
	<%-- 					                  <img src="${pageContext.request.contextPath}/resources/static/img/users/22.jpg" alt="" class="avatar" width="150" height="150"> --%>
	<!-- 					                </div> -->
	<!--               					</div> -->
	<!-- 							</div> -->
	<!-- 						</div> -->
	<!-- 					</div> -->
	<!-- 					<div class="modal-footer"> -->
	<!-- 						<button type="button" data-dismiss="modal" -->
	<!-- 							class="btn btn-raised btn-danger"><i class="fa fa-close text"></i> បោះបង់</button> -->
	<!-- 					</div> -->
	<!-- 				</div> -->
	<!-- 			</div> -->
	<!-- 		</div> -->
	<!-- 	</div> -->
</body>
</html>
