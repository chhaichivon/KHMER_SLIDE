<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="col-md-3 col-sm-6">
	<div tabindex="-1" role="dialog"
		aria-labelledby="myAnimationModalLabel"
		class="modal animated fadeInLeft modalEdit">
		<div role="document" class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" data-dismiss="modal" aria-label="Close"
						class="close">
						<span aria-hidden="true"><i class="ti-close"></i></span>
					</button>
					<h3 id="myAnimationModalLabel"
						class="modal-title text-primary text-center">កំណែប្រែពត៌មានរបស់ឯកសារ</h3>
				</div>
				<div class="modal-body">
					<div class="row">
				<div class="col-md-12">
					<div class="widget">
						<div class="widget-heading text-center">
							<h3 class="widget-title">កំណែប្រែពត៌មានរបស់ឯកសារ</h3>
						</div>
						<div class="widget-body">
								<form id="form-vertical" method="post" name="insertForm"
									novalidate="novalidate">
									<div class="row">
										<div class="col-md-12">
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
												<label for="txtImg">រូបភាពគំរបមុខឯកសារ</label> <input
													id="input-10" type="file" accept="image/*"
													class="file-loading" ng-model="txtImg">
											</div>
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
										<a href="/user/my-document" class="btn btn-raised btn-danger" ng-click="close()" ><i
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
		</div>
	</div>
</div>