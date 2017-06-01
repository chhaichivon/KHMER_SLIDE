<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="col-md-3 col-sm-6"​>
	<div tabindex="-1" role="dialog"
		aria-labelledby="myAnimationModalLabel"
		class="modal animated fadeInLeft modalUpload">
		<div role="document" class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" data-dismiss="modal" aria-label="Close"
						class="close">
						<span aria-hidden="true"><i class="ti-close"></i></span>
					</button>
				<!-- 	<h3 id="myAnimationModalLabel"
						class="modal-title text-primary text-center">កំណែប្រែរូបភាពរបស់គណនី</h3> -->
				</div>
				<div class="modal-body">
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
													class="text-danger"> *</label> <input style="height: 40px;" id="txtTitle"
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
				
										</div>
									</div>
									<div class="row">
										<div class="col-md-6">
											<div class="form-group">
											<!-- <label for="txtImg">រូបភាពគំរបមុខឯកសារ</label>
											<label class="custom-file">
											  <input type="file" id="file" accept="image/*" class="custom-file-input" ng-model="txtImg">
											  <span class="custom-file-control"></span>
											</label> -->
												<label for="txtImg">រូបភាពគំរបមុខឯកសារ</label> <input style="height: 40px;"
													id="input-10" type="file" accept="image/*"
													class="file-loading custom-file-input" ng-model="txtImg">
											</div>

										</div>
										<div class="col-md-6">
											<div class="form-group">
												<label for="txtDoc">ឯកសារ</label><label class="text-danger">
													*</label> <input style="height: 40px;" id="input-14" name="input14[]" type="file"
													multiple="" class="file-loading custom-file-input" ng-model="txtDoc"
													>
											</div>
										</div>
									</div>
									<div class="text-right">
										<button data-dismiss="modal" class="btn btn-raised btn-danger"><i
											class="ti-close"></i> បោះបង់</button>
										<button type="submit" name="btnSubmit" ng-click="insertDoc()"
											class="btn btn-raised btn-success" ng-disabled="insertForm.$invalid" data-dismiss="modal">
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
		</div>
	</div>
</div>