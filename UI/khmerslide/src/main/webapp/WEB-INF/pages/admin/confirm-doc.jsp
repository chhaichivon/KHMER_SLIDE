<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<!-- including style from include/admin/css-include.jsp -->
<jsp:include page="../include/admin/css-include.jsp"></jsp:include>
<%-- <%@ include file="../include/css-include.jsp" %> --%>
</head>
<body data-sidebar-color="sidebar-light" class="sidebar-light">
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
						<h4 class="mt-0 mb-5">យល់ព្រមដាក់បញ្ចូលឯកសារ</h4>
						<br>
						<ol class="breadcrumb mb-0">
							<li><a href="index">Khmer Slide</a></li>
							<li><a id="dropdownMenu2" href="#" data-toggle="dropdown"
								role="button">ឯកសារ</a>
								<ul aria-labelledby="dropdownMenu2"
									class="dropdown-menu fs-12 animated fadeInDown">
									<li><a href="doc-list"><i class="fa fa-table mr-5"></i>
											តារាង</a></li>
									<li><a href="add-doc"><i class="ti-plus mr-5"></i>
											បញ្ចូលថ្មី</a></li>
									<!-- <li><a href="edit-doc"><i class="ti-pencil mr-5"></i>
											កំណែប្រែថ្មី</a></li> -->
								</ul></li>
							<li class="active">យល់ព្រម</li>
						</ol>
					</div>
				</div>
			</div>
			<div class="page-content container-fluid">
				<!-- including user-board from include/admin/doc-board-include.jsp -->
				<jsp:include page="../include/admin/doc-board-include.jsp"></jsp:include>

				<div class="row">
					<div class="col-md-12">
						<div class="widget no-border">
							<table id="accept-table" style="width: 100%"
								class="table table-hover dt-responsive nowrap">
								<thead>
									<tr>
										<th style="width: 5%">ល.រ</th>
										<th style="width: 37%">ចំណងជើងឯកសារ</th>
										<th style="width: 5%">ប្រភេទឯកសារ</th>
										<th style="width: 10%">ស្ថិតក្នុងមីនុយ</th>
										<th style="width: 10%">បញ្ចូលដោយ</th>
										<th style="width: 10%">ពត៌មានផ្សេងៗ</th>
										<th style="width: 10%">ស្ថានភាព</th>
										<th style="width: 35%">សកម្មភាព</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td>#1</td>
										<td>
											<div class="media">
												<div class="media-left avatar">
													<img
														src="${pageContext.request.contextPath}/resources/static/img/users/21.jpg"
														alt="" class="media-object img-circle"><span
														class="status bg-success"></span>
												</div>
												<div class="media-body">
													<h5 class="media-heading">ភាសា Java</h5>
													<p class="text-muted mb-0">បញ្ចូលថ្ងៃទី: 29th July,
														2016</p>
												</div>
											</div>
										</td>
										<td>Slide</td>
										<td>វិទ្យាសាស្ត្រកុំព្យូទ័រ</td>
										<td>ចាន់ ឧត្តម</td>
										<td></td>
										<td class="text-center"><a data-toggle="modal"
											data-target=".bs-example-modal-animation" class="text-danger"><i
												class="ti-close"></i></a></td>
										<td>
											<div role="toolbar" aria-label="Toolbar with button groups"
												class="btn-toolbar">
												<div role="group" aria-label="First group" class="btn-group">
													<button type="button" class="btn btn-outline btn-success">
														<i class="ti-eye"></i>
													</button>
													<button type="button" class="btn btn-outline btn-warning">
														<i class="ti-pencil"></i>
													</button>
													<button type="button" class="btn btn-outline btn-danger">
														<i class="ti-trash"></i>
													</button>
												</div>
											</div>
										</td>
									</tr>
									<tr>
										<td>#2</td>
										<td>
											<div class="media">
												<div class="media-left avatar">
													<img
														src="${pageContext.request.contextPath}/resources/static/img/users/20.jpg"
														alt="" class="media-object img-circle"><span
														class="status bg-success"></span>
												</div>
												<div class="media-body">
													<h5 class="media-heading">Web Design</h5>
													<p class="text-muted mb-0">បញ្ចូលថ្ងៃទី: 29th July,
														2016</p>
												</div>
											</div>
										</td>
										<td>Slide</td>
										<td>វិទ្យាសាស្ត្រកុំព្យូទ័រ</td>
										<td>ចាន់ ឧត្តម</td>
										<td>I gotta do something that I want to do today coz tmr
											I wont know wether I will be able to do or not!</td>
										<td class="text-center text-danger"><i class="ti-close"></i></td>
										<td>
											<div role="toolbar" aria-label="Toolbar with button groups"
												class="btn-toolbar">
												<div role="group" aria-label="First group" class="btn-group">
													<button type="button" class="btn btn-outline btn-success"
														data-toggle="modal"
														data-target=".bs-example-modal-animation">
														<i class="ti-eye"></i>
													</button>
													<button type="button" class="btn btn-outline btn-warning">
														<i class="ti-pencil"></i>
													</button>
													<button type="button" class="btn btn-outline btn-danger">
														<i class="ti-trash"></i>
													</button>
												</div>
											</div>
										</td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
				</div>

				<div class="row">
					<div class="col-md-12">
						<div class="widget">
							<div class="widget-heading text-center">
								<h3 class="widget-title">យល់ព្រមដាក់បញ្ចូលឯកសារ</h3>
							</div>
							<div class="widget-body">
								<form id="form-vertical" method="post" novalidate="novalidate">
									<div class="col-md-6">
										<div class="form-group">
											<label for="txtTitle">ចំណងជើងឯកសារ</label><label
												class="text-danger"> *</label> <input id="txtTitle"
												type="text" name="txtTitle" placeholder="Enter title"
												data-rule-required="true" data-rule-rangelength="[3,30]"
												class="form-control">
										</div>
										<div class="form-group">
											<label for="ddlType">ប្រភេទឯកសារ</label><label
												class="text-danger"> *</label> <select id="ddlType"
												name="ddlType" data-rule-required="true"
												class="form-control">
												<option value="">-- សូមធ្វើការជ្រើសរើស --</option>
												<option value="1">Slide</option>
												<option value="2">PDF</option>
												<option value="3">Microsoft Word</option>
											</select>
										</div>
									</div>

									<div class="col-md-6">
										<div class="form-group">
											<label for="ddlCategory">ស្ថិតក្នុងមីនុយ</label><label
												class="text-danger"> *</label> <select id="ddlCategory"
												name="ddlCategory" data-rule-required="true"
												class="form-control">
												<option value="">-- សូមធ្វើការជ្រើសរើស --</option>
												<option value="computer science">វិទ្យាសាស្ត្រកុំព្យូទ័រ</option>
												<option value="web design">ការរចនាគេហទំព័រ</option>
											</select>
										</div>
										<div class="form-group">
											<label for="ddlStatus">ស្ថានភាព</label><label
												class="text-danger"> *</label> <select id="ddlStatus"
												name="ddlStatus" data-rule-required="true"
												class="form-control">
												<option value="">-- សូមធ្វើការជ្រើសរើស --</option>
												<option value="1">ដំណើរការ</option>
												<option value="2">មិនដំណើរការ</option>
											</select>
										</div>
									</div>
									<div class="col-md-12">
										<div class="form-group">
											<textarea id="txtDescription" name="txtDescription"
												class="form-control" placeholder="ពត៌មានបន្ថែម"></textarea>
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
									<div class="text-right">
										<a href="user-list" class="btn btn-raised btn-danger"><i
											class="ti-close"></i> បោះបង់</a>
										<button type="submit" name="btnSubmit"
											class="btn btn-raised btn-success">
											<i class="ti-check"></i> យល់ព្រម
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

	<!-- View Modal -->
	<div class="col-md-3 col-sm-6">
		<div tabindex="-1" role="dialog"
			aria-labelledby="myAnimationModalLabel"
			class="modal animated fadeInLeft bs-example-modal-animation">
			<div role="document" class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" data-dismiss="modal" aria-label="Close"
							class="close">
							<span aria-hidden="true">×</span>
						</button>
						<h4 id="myAnimationModalLabel" class="modal-title text-primary">ពត៌មានលម្អិតរបស់អ្នកប្រើប្រាស់</h4>
					</div>
					<div class="modal-body">
						<div class="row">
							<div class="col-sm-6">
								<p>ឈ្មោះ: ឃួន សុវណ្ណវត្តី</p>
								<p>ភេទ: ស្រី</p>
								<p>អីុមែល: vateykhuon@gmail.com</p>
								<p>តួនាទី: អ្នកគ្រប់គ្រងប្រព័ន្ធ</p>
								<p>ចុះឈ្មោះចូលប្រើថ្ងៃទី: 29th July, 2016</p>
								<p>ស្ថានភាព: ដំណើរការ</p>
								<p>អំពីខ្ញុំ: I am a girl who is beautiful :P</p>
							</div>
							<div class="col-sm-6">
								<div class="panel panel-info">
									<div class="panel-body" style="text-align: center;">
										<img
											src="${pageContext.request.contextPath}/resources/static/img/users/22.jpg"
											alt="" class="avatar" width="150" height="150">
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
</body>
</html>
