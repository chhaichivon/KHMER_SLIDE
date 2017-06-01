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
	ng-app="User">
	<!-- Header start-->
	<header>
		<!-- including header from include/admin/header.jsp -->
		<jsp:include page="../include/admin/header.jsp"></jsp:include>
	</header>
	<!-- Header end-->
	<div class="main-container">
		<!-- Main Sidebar start-->
		<aside data-mcs-theme="minimal-dark"
			style="background-image: url( ${pageContext.request.contextPath}/resources/static/img/backgrounds/11.jpg)"
			class="main-sidebar mCustomScrollbar">
			<!-- including Main Sidebar from include/admin/main-sidebar-include.jsp -->
			<jsp:include page="../include/admin/main-sidebar-include.jsp"></jsp:include>
		</aside>
		<!-- Main Sidebar end-->
		<div class="page-container">
			<div class="page-header clearfix">
				<div class="row">
					<div class="col-sm-12">
						<h4 class="mt-0 mb-5">បញ្ចូលអ្នកប្រើប្រាស់ថ្មី</h4>
						<br>
						<ol class="breadcrumb mb-0">
							<li><a href="index">Khmer Slide</a></li>
							<li><a id="dropdownMenu2" href="#" data-toggle="dropdown"
								role="button">អ្នកប្រើប្រាស់</a>
								<ul aria-labelledby="dropdownMenu2"
									class="dropdown-menu fs-12 animated fadeInDown">
									<li><a href="user-list"><i class="fa fa-table mr-5"></i>
											តារាង</a></li>
									<!-- <li><a href="edit-user"><i class="ti-pencil mr-5"></i>
											កំណែប្រែថ្មី</a></li> -->
								</ul></li>
							<li class="active">បញ្ចូលថ្មី</li>
						</ol>
					</div>
				</div>
			</div>
			<div class="page-content container-fluid">
				<!-- including user-board from include/admin/user-board-include.jsp -->
				<jsp:include page="../include/admin/user-board-include.jsp"></jsp:include>

				<div class="row" ng-controller="userListCtrl">
					<div class="col-md-12">
						<div class="widget">
							<div class="widget-heading text-center">
								<h3 class="widget-title">បញ្ចូលអ្នកប្រើប្រាស់ថ្មី</h3>
							</div>
							<div class="widget-body">
								<form id="form-vertical" method="post" name="insertForm"
									novalidate="novalidate" ng-submit="submitForm()">
									<div class="col-md-6">
										<div class="form-group">
											<label for="txtName">ឈ្មោះអ្នកប្រើប្រាស់</label><label
												class="text-danger"> *</label> <input id="txtName"
												type="text" name="txtName" ng-model="txtName"
												placeholder="Enter name" data-rule-required="true"
												data-rule-rangelength="[3,15]" class="form-control" required="required">
										</div>
										<div class="form-group">
											<label for="txtEmail">អីុមែល</label><label
												class="text-danger"> *</label> <input id="txtEmail"
												type="text" name="txtEmail" ng-model="txtEmail"
												placeholder="Enter email" data-rule-required="true"
												data-rule-rangelength="[10,30]" data-rule-email="true"
												class="form-control" required="required">
										</div>
										<div class="form-group" >
											<label for="txtPassword">លេខសម្ងាត់</label><label
												class="text-danger"> *</label> <input id="txtPassword"
												type="password" name="txtPassword" ng-model="txtPassword"
												placeholder="Enter password" data-rule-required="true"
												data-rule-rangelength="[5,30]" class="form-control" required="required">
										</div>
									</div>

									<div class="col-md-6">
										<div class="form-group">
											<label for="ddlGender">ភេទ</label><label class="text-danger" required="required">
												*</label> <select id="ddlGender" name="ddlGender"
												ng-model="ddlGender" data-rule-required="true"
												class="form-control">
												<option value="">-- សូមធ្វើការជ្រើសរើស --</option>
												<option value="ប្រុស">ប្រុស</option>
												<option value="ស្រី">ស្រី</option>
											</select>
										</div>
										<div class="form-group" ng-controller="userTypeListCtrl">
											<label for="ddlRole">តួនាទី</label><label class="text-danger">
												*</label> <select id="ddlRole" name="ddlRole" ng-model="ddlRole"
												data-rule-required="true" class="form-control"
												ng-change="role(ddlRole)" required="required">
												<option value="">-- សូមធ្វើការជ្រើសរើស --</option>
												<option value="{{ut.ROLE_ID}}" ng-repeat="ut in userType">{{(ut.ROLE_NAME)
													== 'ROLE_ADMIN' ? 'អ្នកគ្រប់គ្រងប្រព័ន្ធ':'អ្នកប្រើប្រាស់'}}</option>
											</select>
										</div>
										<div class="form-group">
											<label for="txtConfirmPassword">បំពេញលេខសម្ងាត់ម្តងទៀត</label>
											<input id="txtConfirmPassword" type="password"
												name="txtConfirmPassword" ng-model="txtConfirmPassword"
												placeholder="Re-enter confirm password"
												data-rule-required="true" data-rule-equalto="#txtPassword"
												class="form-control" required="required">
										</div>
										<div class="form-group">
											<input id="txtRegisterDate" type="hidden"
												name="txtRegisterDate" ng-model="txtRegisterDate"
												class="form-control" value="{{date | date:'dd-MMM-yyyy'}}">
										</div>
										<div class="form-group">
											<input id="txtStatus" type="hidden" name="txtStatus"
												ng-model="txtStatus" class="form-control">
										</div>
										<div class="form-group">
											<input id="txtPhoto" type="hidden" name="txtPhoto"
												ng-model="txtPhoto" class="form-control"
												value="{{default-user-image.png}}">
										</div>
									</div>
									<div class="text-right">
										<a href="user-list" class="btn btn-raised btn-danger"><i
											class="ti-close"></i> បោះបង់</a>
										<button ng-click="insert()"
											ng-disabled="insertForm.$invalid"
											class="btn btn-raised btn-success">
											<i class="ti-save"></i> រក្សាទុក
										</button>
									</div>
								</form>
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


	<!-- including js from include/admin/js-include.jsp -->
	<jsp:include page="../include/admin/js-include.jsp"></jsp:include>
</body>
</html>
