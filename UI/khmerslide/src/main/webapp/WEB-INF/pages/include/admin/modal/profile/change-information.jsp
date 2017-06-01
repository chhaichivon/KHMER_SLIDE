<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="col-md-3 col-sm-6">
	<div tabindex="-1" role="dialog"
		aria-labelledby="myAnimationModalLabel"
		class="modal animated fadeInLeft modalChangeUserInformation">
		<div role="document" class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" data-dismiss="modal" aria-label="Close"
						class="close">
						<span aria-hidden="true"><i class="ti-close"></i></span>
					</button>
<!-- 					<h3 id="myAnimationModalLabel"
						class="modal-title text-primary text-center">កំណែប្រែរូបភាពរបស់គណនី</h3> -->
				</div>
				<div class="modal-body">
					<div class="row">
					<div class="widget">
						<div class="widget-heading text-center">
							<h3 class="widget-title">កំណែប្រែពត៌មានរបស់អ្នកប្រើប្រាស់</h3>
						</div>
						<div class="widget-body">
							<form id="form-vertical" method="post" name="insertForm"
								novalidate="novalidate">
								<div class="col-md-12">
									<div class="form-group">
										<label for="txtName">ឈ្មោះអ្នកប្រើប្រាស់</label><label
											class="text-danger"> *</label> <input id="txtName"
											type="text" name="txtName" ng-model="txtName"
											placeholder="Enter name" data-rule-required="true"
											data-rule-rangelength="[3,100]" class="form-control"
											required="required">
									</div>
								</div>
								<div class="col-md-12">
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
								</div>
								<div class="col-md-6">
									<div class="form-group">
										<label for="txtPassword">លេខសម្ងាត់</label><label
											class="text-danger"> *</label> <input id="txtPassword"
											type="password" name="txtPassword" ng-model="txtPassword"
											placeholder="Enter password" data-rule-required="true"
											data-rule-rangelength="[5,30]" class="form-control"
											required="required">
									</div>
								</div>

								<div class="col-md-6">
									<div class="form-group">
										<label for="txtConfirmPassword">បំពេញលេខសម្ងាត់ម្តងទៀត</label>
										<input id="txtConfirmPassword" type="password"
											name="txtConfirmPassword" ng-model="txtConfirmPassword"
											placeholder="Re-enter confirm password"
											data-rule-required="true" data-rule-equalto="#txtPassword"
											class="form-control" required="required">
									</div>
								</div>
								<div class="text-right">
									<a class="btn btn-raised btn-danger" data-dismiss="modal"><i
										class="ti-close"></i> បោះបង់</a>
									<button ng-click="update()" ng-disabled="insertForm.$invalid"
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
	</div>
</div>