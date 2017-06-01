<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<aside class="right-sidebar closed">
	<ul role="tablist" class="nav nav-tabs nav-justified nav-sidebar">
		<li role="presentation" class="active"><a href="#role"
			aria-controls="role" role="tab" data-toggle="tab"><i
				class="ti-user"></i> តួនាទី</a></li>
		<li role="presentation"><a href="#type" aria-controls="type"
			role="tab" data-toggle="tab"><i class="ti-bookmark-alt"></i>
				ប្រភេទឯកសារ</a></li>
	</ul>
	<div data-mcs-theme="minimal-dark"
		class="tab-content nav-sidebar-content mCustomScrollbar">
		<div id="role" role="tabpanel" class="tab-pane fade in active">
			<div class="row">
				<div class="widget ">
					<table id="role-table" style="width: 100%"
						class="table table-hover dt-responsive nowrap">
						<thead>
							<tr>
								<th style="width: 2%">ល.រ</th>
								<th style="width: 40%">ឈ្មោះ</th>
								<th style="width: 10%">ស្ថានភាព</th>
								<th style="width: 35%">សកម្មភាព</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>#1</td>
								<td>
									<div class="media">
										<div class="media-body">
											<h5 class="media-heading">អ្នកគ្រប់គ្រងប្រព័ន្ធ</h5>
										</div>
									</div>
								</td>
								<td class="text-center text-success"><i class="ti-check"></i></td>
								<td>
									<div role="toolbar" aria-label="Toolbar with button groups"
										class="btn-toolbar">
										<div role="group" aria-label="First group" class="btn-group">
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
										<div class="media-body">
											<h5 class="media-heading">អ្នកប្រើប្រាស់</h5>
										</div>
									</div>
								</td>
								<td class="text-center text-danger"><i class="ti-close"></i></td>
								<td>
									<div role="toolbar" aria-label="Toolbar with button groups"
										class="btn-toolbar">
										<div role="group" aria-label="First group" class="btn-group">
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

			<div class="row">
				<div class="widget">
					<div class="widget-heading">
						<h3 class="widget-title" style="text-align: center;">តួនាទី</h3>
					</div>
					<div class="widget-body">
						<form id="form-vertical" method="post" novalidate="novalidate">

							<div class="form-group">
								<label for="txtUserTypeName">ឈ្មោះ</label><label
									class="text-danger"> *</label> <input id="txtUserTypeName"
									type="text" name="txtUserTypeName" placeholder="Enter name"
									data-rule-required="true" data-rule-rangelength="[3,15]"
									class="form-control">
							</div>

							<div class="form-group">
								<label for="ddlStatus">ស្ថានភាព</label><label
									class="text-danger"> *</label> <select id="ddlStatus"
									name="ddlStatus" data-rule-required="true" class="form-control">
									<option value="">-- សូមធ្វើការជ្រើសរើស --</option>
									<option value="activated">ដំណើរការ</option>
									<option value="deactivated">មិនដំណើរការ</option>
								</select>
							</div>
							<div class="form-group">
								<label for="txtDescription">ពត៌មានបន្ថែម</label>
								<textarea id="txtDescription" name="txtDescription"
									class="form-control"></textarea>
							</div>
							<div style="text-align: center;">
								<a href="user-list" class="btn btn-raised btn-danger"><i
									class="fa fa-close text"></i> បោះបង់</a>
								<button type="submit" name="btnSubmit"
									class="btn btn-raised btn-success">
									<i class="fa fa-save text"></i> រក្សាទុក
								</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>

		<div id="type" role="tabpanel" class="tab-pane fade in active">
			<div class="row">
				<div class="widget">
					<table id="doc-table" style="width: 100%"
						class="table table-hover dt-responsive nowrap">
						<thead>
							<tr>
								<th style="width: 2%">ល.រ</th>
								<th style="width: 40%">ឈ្មោះ</th>
								<th style="width: 10%">ស្ថានភាព</th>
								<th style="width: 35%">សកម្មភាព</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>#1</td>
								<td>
									<div class="media">
										<div class="media-body">
											<h5 class="media-heading">Slide</h5>
										</div>
									</div>
								</td>
								<td class="text-center text-success"><i class="ti-check"></i></td>
								<td>
									<div role="toolbar" aria-label="Toolbar with button groups"
										class="btn-toolbar">
										<div role="group" aria-label="First group" class="btn-group">
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
										<div class="media-body">
											<h5 class="media-heading">Microsoft Word</h5>
										</div>
									</div>
								</td>
								<td class="text-center text-danger"><i class="ti-close"></i></td>
								<td>
									<div role="toolbar" aria-label="Toolbar with button groups"
										class="btn-toolbar">
										<div role="group" aria-label="First group" class="btn-group">
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
								<td>#3</td>
								<td>
									<div class="media">
										<div class="media-body">
											<h5 class="media-heading">PDF</h5>
										</div>
									</div>
								</td>
								<td class="text-center text-danger"><i class="ti-close"></i></td>
								<td>
									<div role="toolbar" aria-label="Toolbar with button groups"
										class="btn-toolbar">
										<div role="group" aria-label="First group" class="btn-group">
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

			<div class="row">
				<div class="widget">
					<div class="widget-heading">
						<h3 class="widget-title" style="text-align: center;">ប្រភេទឯកសារ</h3>
					</div>
					<div class="widget-body">
						<form id="form-vertical" method="post" novalidate="novalidate">

							<div class="form-group">
								<label for="txtUserTypeName">ឈ្មោះ</label><label
									class="text-danger"> *</label> <input id="txtUserTypeName"
									type="text" name="txtUserTypeName" placeholder="Enter name"
									data-rule-required="true" data-rule-rangelength="[3,15]"
									class="form-control">
							</div>

							<div class="form-group">
								<label for="ddlStatus">ស្ថានភាព</label><label
									class="text-danger"> *</label> <select id="ddlStatus"
									name="ddlStatus" data-rule-required="true" class="form-control">
									<option value="">-- សូមធ្វើការជ្រើសរើស --</option>
									<option value="activated">ដំណើរការ</option>
									<option value="deactivated">មិនដំណើរការ</option>
								</select>
							</div>
							<div class="form-group">
								<label for="txtDescription">ពត៌មានបន្ថែម</label>
								<textarea id="txtDescription" name="txtDescription"
									class="form-control"></textarea>
							</div>
							<div style="text-align: center;">
								<a href="user-list" class="btn btn-raised btn-danger"><i
									class="fa fa-close text"></i> បោះបង់</a>
								<button type="submit" name="btnSubmit"
									class="btn btn-raised btn-success">
									<i class="fa fa-save text"></i> រក្សាទុក
								</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</aside>
