<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<!-- including style from include/admin/css-include.jsp -->
<jsp:include page="../include/admin/css-include.jsp"></jsp:include>
<%-- <%@ include file="../include/css-include.jsp" %> --%>
</head>
<body data-sidebar-color="sidebar-light" class="sidebar-light" ng-app="CombineModule">
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
						<h4 class="mt-0 mb-5">កំណែប្រែពត៌មានរបស់ឯកសារ</h4>
						<br>
						<ol class="breadcrumb mb-0">
							<li><a href="index">Khmer Slide</a></li>
							<li><a id="dropdownMenu2" href="#" data-toggle="dropdown"
								role="button">ឯកសារ</a>
								<ul aria-labelledby="dropdownMenu2"
									class="dropdown-menu fs-12 animated fadeInDown">
									<li><a href="doc-list"><i class="fa fa-table mr-5"></i>
											តារាង</a></li>
									<li><a href="add-doc"><i class="ti-plus mr-5"></i> បញ្ចូលថ្មី</a></li>
									<li><a href="confirm-doc"><i class="ti-check mr-5"></i>
											យល់ព្រម</a></li>
								</ul></li>
							<li class="active">កំណែប្រែ</li>
						</ol>
					</div>
				</div>
			</div>
			<div class="page-content container-fluid">
				<!-- including user-board from include/admin/doc-board-include.jsp -->
				<jsp:include page="../include/admin/doc-board-include.jsp"></jsp:include>

				<div class="row" ng-controller="documentListCtrl" ng-init="update()">
				<div class="col-md-12">
					<div class="widget">
						<div class="widget-heading text-center">
							<h3 class="widget-title">កំណែប្រែពត៌មានរបស់ឯកសារ</h3>
						</div>
						<div class="widget-body">
								<form id="form-vertical" method="post" name="insertForm"
									novalidate="novalidate">
									<div class="row">
										<div class="col-md-6">
											<div class="form-group">
												<label for="txtTitle">ចំណងជើងឯកសារ</label><label
													class="text-danger"> *</label> <input id="txtTitle"
													type="text" name="txtTitle" ng-model="txtTitle"
													placeholder="Enter title" data-rule-required="true"
													data-rule-rangelength="[3,100]" class="form-control" required="required">
											</div>

											<div class="form-group" ng-controller="categoryListCtrl">
												<label for="ddlCategories">ស្ថិតក្រោមមីនុយ</label> <select
													id="ddlCategories" name="ddlCategories"
													class="form-control" data-ng-model="ddlCategories"
													data-ng-change="categories(ddlCategories)" required="required">
													<option value="">-- សូមធ្វើការជ្រើសរើស --</option>
													<option value="{{ca.CAT_ID}}"
														data-ng-repeat="ca in category | orderBy:'CAT_NAME'">{{ca.CAT_NAME}}</option>
												</select>
											</div>
										</div>

										<div class="col-md-6">
											<div class="form-group">
												<label for="txtImg">រូបភាពគំរបមុខឯកសារ</label> <input
													id="input-10" type="file" accept="image/*"
													class="file-loading" ng-model="txtImg">
											</div>

											<div class="form-group">
												<label for="ddlStatus">ស្ថានភាព</label><label
													class="text-danger"> *</label> <select id="ddlStatus"
													name="ddlStatus" ng-model="ddlStatus"
													ng-change="status(ddlStatus)" data-rule-required="true"
													class="form-control" required="required">
													<option value="">-- សូមធ្វើការជ្រើសរើស --</option>
													<option value="1">ដំណើរការ</option>
													<option value="2">មិនដំណើរការ</option>
												</select>
											</div>
										</div>
									</div>
									<div class="row">
										<div class="col-md-12">
											<div class="form-group">
												<label for="txtSource">ប្រភពឯកសារ</label> <input
													id="txtSource" type="text" name="txtSource"
													ng-model="txtSource" class="form-control"
													placeholder="Ex: www.khmerslide.org">
											</div>
											<div class="form-group">
												<textarea id="txtDescription" name="txtDescription"
													ng-model="txtDescription" class="form-control"
													placeholder="ពត៌មានបន្ថែម"></textarea>
											</div>
											<div class="form-group">
												<input id="txtUploadDate" type="hidden" name="txtUploadDate"
													class="form-control">
											</div>
											<div class="form-group">
												<input id="txtUploadBy" type="hidden" name="txtUploadBy"
													class="form-control">
											</div>
											<div class="form-group">
												<input id="txtURL" type="hidden" name="txtURL"
													class="form-control">
											</div>
										</div>
									</div>
									<div class="text-right">
										<a href="doc-list" class="btn btn-raised btn-danger"><i
											class="ti-close"></i> បោះបង់</a>
										<button type="submit" name="btnSubmit" ng-click="submit()"
											class="btn btn-raised btn-success" ng-disabled="insertForm.$invalid">
											<i class="ti-pencil"></i> កែប្រែ
										</button>
									</div>
								</form>
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