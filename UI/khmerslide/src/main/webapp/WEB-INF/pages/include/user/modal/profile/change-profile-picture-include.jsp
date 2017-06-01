<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="col-md-3 col-sm-6"​>
	<div tabindex="-1" role="dialog"
		aria-labelledby="myAnimationModalLabel"
		class="modal animated fadeInLeft modalChangeProfile">
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
							<h3 class="widget-title">កំណែប្រែរូបភាពរបស់គណនី</h3>
						</div>
						<div class="widget-body">
								<form id="form-vertical" method="post"
									novalidate="novalidate">
									<div class="row text-center">
										<div class="col-md-12">
										<div class="panel panel-info">
									<div class="panel-body" style="text-align: center;">
										<img
											src="{{urls}}{{photo}}"
											alt="" class="avatar" width="150" height="150">
									</div>
								</div>
											
										</div>
									</div>
									
									<div class="row text-center">
										<div class="col-md-12">
										<div class="form-group">
												<input
													id="input-10" type="file" accept="image/*"
													class="file-loading" ng-model="txtImg">
											</div>
											
										</div>
									</div>
									<div class="text-right">
										<a class="btn btn-raised btn-danger" data-dismiss="modal"><i
											class="ti-close"></i> បោះបង់</a>
										<button type="submit" name="btnSubmit" ng-click="submit()"
											class="btn btn-raised btn-success">
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