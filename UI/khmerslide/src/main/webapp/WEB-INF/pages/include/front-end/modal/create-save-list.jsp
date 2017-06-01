<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="col-md-3 col-sm-6"​>
	<div tabindex="-1" role="dialog"
		aria-labelledby="myAnimationModalLabel"
		class="modal animated fadeInLeft modalCreateSaveList">
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
					<div class="row">
				<div class="col-md-12">
					<div class="widget">
						<div class="widget-heading text-center">
							<h3 class="widget-title">បង្កើតបញ្ជីររក្សាទុកថ្មី</h3>
						</div>
						<div class="widget-body">
								<form id="form-vertical" method="post"
									novalidate="novalidate">
									<div class="row text-center">
										<div class="col-md-12">
										<div class="form-group">
											<div class="form-group">
											<input id="txtSaveListName"
											type="text" name="txtSaveListName" ng-model="txtSaveListName"
											placeholder="ឈ្មោះបញ្ជីររក្សាទុក" data-rule-required="true"
											data-rule-rangelength="[3,100]" class="form-control"
											required="required">
											</div>	
										</div>
										</div>
									</div>
									<div class="text-right">
										<button class="btn btn-raised btn-danger" data-dismiss="modal"><i
											class="fa fa-times"></i> បោះបង់</button>
										<button type="submit" name="btnSubmit" id="btnSave" 
											class="btn btn-raised btn-success" data-dismiss="modal">
											<i class="fa fa-floppy-o"></i> រក្សាទុក
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