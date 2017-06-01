<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="col-md-3 col-sm-6">
	<div tabindex="-1" role="dialog"
		aria-labelledby="myAnimationModalLabel"
		class="modal animated fadeInLeft modalAdd">
		<div role="document" class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" data-dismiss="modal" aria-label="Close"
						class="close">
						<span aria-hidden="true"><i class="ti-close"></i></span>
					</button>
					<h3 id="myAnimationModalLabel"
						class="modal-title text-primary text-center">បញ្ចូលមីនុយថ្មី្ម</h3>
				</div>
				<div class="modal-body">
					<div class="row">
						<div class="col-md-12">
							<div class="widget">
								<div class="widget-body">
									<form id="form-vertical" method="post" novalidate="novalidate">
										<div class="col-md-12">
											<div class="form-group">
												<label for="txtCatName">ឈ្មោះមីនុយ</label><label
													class="text-danger"> *</label> <input id="txtCatName"
													type="text" name="txtCatName" ng-model="txtCatName"
													placeholder="Enter category name" data-rule-required="true"
													data-rule-rangelength="[3,100]" class="form-control">
											</div>
											<div class="form-group">
												<label for="ddlCategory">ស្ថិតក្រោមមីនុយ</label> <select
													id="ddlCategory" name="ddlCategory" class="form-control" ng-model="ddlCategory" ng-change="categ(ddlCategory)" >
													<option value="">-- សូមធ្វើការជ្រើសរើស --</option>
													<option value="{{ca.CAT_ID}}, {{ca.FOLDER}}" data-ng-repeat="ca in category | orderBy:'CAT_NAME'">{{ca.CAT_NAME}}</option>
												</select>
											</div>
											<div class="form-group">
												<label for="ddlIcon">អាយខុនតំណាង</label>
												<label class="text-danger"> *</label>
												<select id="ddlIcon" name="ddlIcon" data-rule-required="true" ng-model="ddlIcon"
													class="form-control" style="font-family:'FontAwesome', Arial;">
													<option value="">-- សូមធ្វើការជ្រើសរើស --</option>
													<option value="fa fa-car">&#xf1b9; រថយន្ត
													</option>
													<option value="fa fa-balance-scale">&#xf24e; ជញ្ចីញ
													</option>
													<option value="fa fa-university">&#xf19c; សកលវិទ្យាល័យ
													</option>
													<option value="fa fa-bar-chart">&#xf080; ស្ថិតិ
													</option>
													<option value="fa fa-book" data-icon="fa-book">&#xf02d; សៀវភៅ
													</option>
													<option value="fa fa-briefcase">&#xf0b1; កាតាប
													</option>
													<option value="fa fa-building" class="fa fa-building">&#xf19c; អគារ
													</option>
													<option value="fa fa-calculator">&#xf1ec; ម៉ាសីុនគិតលេខ
													</option>
													<option value="fa fa-calendar">&#xf073; ប្រតិទិន
													</option>
													<option value="fa fa-camera">&#xf083; ម៉ាសីុនថតរូប
													</option>
													<option value="fa fa-code">&#xf121; កូដ
													</option>
													<option value="fa fa-credit-card-alt">&#xf1f0; កាតក្រេឌីត
													</option>
													<option value="fa fa-database">&#xf1c0; ដែតាបែស
													</option>
													<option value="fa fa-desktop">&#xf108; កុំព្យូទ័រ
													</option>
													<option value="fa fa-flask">&#xf0c3; គីមី
													</option>
													<option value="fa fa-film">&#xf008; វីដេអូ
													</option>
													<option value="fa fa-picture-o">&#xf03e; រូបភាព
													</option>
													<option value="fa fa-industry">&#xf275; រោងចក្រ
													</option>
													<option value="fa fa-language">&#xf1ab; ភាសា
													</option>
													<option value="fa fa-money">&#xf0d6; លុយ
													</option>
													<option value="fa fa-newspaper-o">&#xf1ea; កាសែត
													</option>
													<option value="fa fa-recycle">&#xf1b8; បរិស្ថាន
													</option>
													<option value="fa fa-server">&#xf233; ម៉ាសីុនសឺវឺ
													</option>
													<option value="fa fa-server">&#xf233; ណេតវឺក
													</option>
													<option value="fa fa-futbol-o">&#xf1e3; កីឡា
													</option>
													<option value="fa fa-heartbeat">&#xf21e; សុខភាព
													</option>
													<option value="fa fa-users">&#xf0c0; សង្គម
													</option>
												</select>
											</div>
											<div class="form-group">
												<textarea id="txtDescription" name="txtDescription"
													class="form-control" placeholder="ពត៌មានបន្ថែម" ng-model="txtDescription"></textarea>
											</div>
											<div class="form-group">
												<input id="txtCreateDate" type="hidden" name="txtCreateDate"
													class="form-control" ng-model="txtCreateDate">
											</div>
											<div class="form-group">
												<input id="txtCreateBy" type="hidden" name="txtCreateBy"
													class="form-control">
											</div>
										</div>
										<div class="text-right">
											<button type="button" data-dismiss="modal"
												class="btn btn-raised btn-danger">
												<i class="ti-close"></i> បោះបង់
											</button>
											<button type="submit" name="btnSubmit"
												class="btn btn-raised btn-success" ng-click="insert()" data-dismiss="modal">
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