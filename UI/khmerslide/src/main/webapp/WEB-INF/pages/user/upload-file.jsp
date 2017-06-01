<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<!-- including style from include/user/css-include.jsp -->
<jsp:include page="../include/user/css-include.jsp"></jsp:include>
<%-- <%@ include file="../include/css-include.jsp" %> --%>
</head>
<body data-sidebar-color="sidebar-light" class="sidebar-light" ng-app="CombineWithUpload">
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
						<h4 class="mt-0 mb-5">Upload ឯកសារ</h4>
						<br>
						<ol class="breadcrumb mb-0">
							<li><a href="index">KhmerSLIDE</a></li>
							<li>ឯកសារ</li>
							<li class="active">Upload</li>
						</ol>
					</div>
				</div>
			</div>
			<div class="page-content container-fluid">
				<div class="row" ng-controller="documentListCtrl">
					<div class="col-md-12">
						<div class="widget">
							<div class="widget-heading text-center">
								<h3 class="widget-title">Upload ឯកសារ</h3>
							</div>
							<div class="widget-body">
								<form id="form-vertical" method="post" name="insertForm"
									novalidate="novalidate" ng-submit="submitForm()">
									<div class="row">
										<div class="col-md-6">
											<div class="form-group">
												<label for="txtTitle">ចំណងជើងឯកសារ</label><label
													class="text-danger"> *</label> <input id="txtTitle"
													type="text" name="txtTitle" ng-model="txtTitle"
													placeholder="Enter title" data-rule-required="true"
													data-rule-rangelength="[3,100]" class="form-control" required="required">
											</div>

											<div class="form-group" data-ng-controller="categoryListCtrl">
												<label for="ddlCategories">ស្ថិតក្រោមមីនុយ</label> <select
													id="ddlCategories" name="ddlCategories"
													class="form-control" data-ng-model="ddlCategories"
													data-ng-change="categories(ddlCategories)" required="required">
													<option value="">-- សូមធ្វើការជ្រើសរើស --</option>
													<option value="{{cat.CAT_ID}},{{cat.FOLDER}}"
														data-ng-repeat="cat in category | orderBy:'CAT_NAME'">{{cat.CAT_NAME}}</option>
												</select>
											</div>
										</div>

										<div class="col-md-6">
											<div class="form-group">
												<label for="ddlType">ប្រភេទឯកសារ</label><label
													class="text-danger"> *</label> <select id="ddlType"
													name="ddlType" ng-model="ddlType"
													ng-change="docType(ddlType)" data-rule-required="true"
													class="form-control" required="required">
													<option value="">-- សូមធ្វើការជ្រើសរើស --</option>
													<option value="1">Slide</option>
													<option value="2">PDF</option>
													<option value="3">Microsoft Word</option>
												</select>
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
												<label for="ddlCategory">ប្រភពឯកសារ</label> <input
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
									<div class="row">
										<div class="col-md-6">
											<div class="form-group">
												<label for="txtImg">រូបភាពគំរបមុខឯកសារ</label> <input
													id="input-10" type="file" accept="image/*"
													class="file-loading" ng-model="txtImg">
											</div>

										</div>
										<div class="col-md-6">
											<div class="form-group">
												<label for="txtDoc">ឯកសារ</label><label class="text-danger">
													*</label> <input id="input-14" name="input14[]" type="file"
													multiple="" class="file-loading" ng-model="txtDoc"
													ng-disabled="insertForm.$invalid">
											</div>
										</div>
									</div>
									<div class="text-right">
										<a href="/user/index" class="btn btn-raised btn-danger"><i
											class="ti-close"></i> បោះបង់</a>
										<button type="submit" name="btnSubmit" ng-click="insertDoc()"
											class="btn btn-raised btn-success" ng-disabled="insertForm.$invalid">
											<i class="ti-export"></i> បញ្ចូល
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
		<jsp:include page="../include/user/right-side-bar.jsp"></jsp:include>
		<!-- Right Sidebar end-->
	</div>
	<!-- including js from include/user/js-include.jsp -->
	<jsp:include page="../include/user/js-include.jsp"></jsp:include>
</body>
</html>
